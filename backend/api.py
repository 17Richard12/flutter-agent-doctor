import os
import sys
import asyncio
from flask import Flask, request, jsonify
from flask_cors import CORS
from dotenv import load_dotenv

# Add the current directory to the sys.path to allow importing from healthcare_agents
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

try:
    from healthcare_agents.agent import root_agent
    from google.adk.runners import InMemoryRunner
    from google.genai import types
except ImportError as e:
    print(f"Error importing dependencies: {e}")
    # Fallback or exit if critical dependencies are missing
    sys.exit(1)

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)
# Enable CORS for all routes, allowing access from Flutter frontend
CORS(app)

@app.route('/api/chat', methods=['POST'])
async def chat():
    """
    Endpoint to handle chat messages from the user.
    Expects JSON body: {"message": "user query"}
    """
    data = request.json

    # Basic validation
    if not data or 'message' not in data:
        return jsonify({"error": "Message is required"}), 400

    user_query = data['message']

    try:
        # Initialize an InMemoryRunner with the root_agent
        # In a more advanced setup, you might want to persist the runner or session service
        runner = InMemoryRunner(agent=root_agent)

        # Create a session for the conversation
        # Using "default" as session_id for simplicity
        await runner.session_service.create_session(
            app_name=runner.app_name,
            user_id="user",
            session_id="default"
        )

        # Prepare the message in the format expected by ADK
        new_message = types.Content(parts=[types.Part(text=user_query)], role="user")

        response_text = ""
        # Run the agent asynchronously and collect the response events
        async for event in runner.run_async(
            user_id="user",
            session_id="default",
            new_message=new_message
        ):
            if event.content and event.content.parts:
                for part in event.content.parts:
                    if part.text:
                        response_text += part.text

        # Return the collected response text
        return jsonify({
            "status": "success",
            "response": response_text
        })

    except Exception as e:
        # Simple error handling as requested
        print(f"Error processing chat message: {e}")
        return jsonify({
            "status": "error",
            "message": str(e)
        }), 500

@app.route('/health', methods=['GET'])
def health_check():
    """Simple health check endpoint"""
    return jsonify({"status": "healthy", "agent": root_agent.name})

if __name__ == '__main__':
    # Get port from environment or use default 5000
    port = int(os.getenv('PORT', 3000))
    app.run(host='0.0.0.0', port=port, debug=os.getenv('DEBUG_MODE', 'False').lower() == 'true')
