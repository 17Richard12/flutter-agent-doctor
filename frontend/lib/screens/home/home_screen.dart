import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';
import '../../services/youtube_service.dart';
import '../../services/news_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<IAuthService>(context);
    final user = authService.user;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: user?.photoURL != null
                          ? NetworkImage(user!.photoURL!)
                          : null,
                      child: user?.photoURL == null ? const Icon(Icons.person) : null,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, ${user?.displayName ?? "User"}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Row(
                          children: [
                            Icon(Icons.location_on, size: 16, color: Colors.grey),
                            Text('Current Location', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Quick Actions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildActionIcon(context, Icons.map, 'Maps'),
                    _buildActionIcon(context, Icons.chat, 'Chat'),
                    _buildActionIcon(context, Icons.history, 'History'),
                    _buildActionIcon(context, Icons.person, 'Account'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Health Videos
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Health Videos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              _buildVideoSection(),
              const SizedBox(height: 20),
              // Health News
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Health News', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              _buildNewsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionIcon(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 30, color: Colors.blue),
          onPressed: () {
            // Logic to switch screens can be added here if needed
          },
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildVideoSection() {
    return FutureBuilder<List<dynamic>>(
      future: YouTubeService().fetchHealthVideos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Error loading videos'),
          );
        }
        final videos = snapshot.data ?? [];
        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index]['snippet'];
              return Container(
                width: 160,
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(video['thumbnails']['medium']['url'], height: 90, fit: BoxFit.cover),
                    const SizedBox(height: 4),
                    Text(video['title'], maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildNewsSection() {
    return FutureBuilder<List<dynamic>>(
      future: NewsService().fetchHealthNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Error loading news'),
          );
        }
        final news = snapshot.data ?? [];
        return SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: news.length,
            itemBuilder: (context, index) {
              final article = news[index];
              return Container(
                width: 200,
                margin: const EdgeInsets.all(8),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (article['urlToImage'] != null)
                        Image.network(article['urlToImage'], height: 100, width: double.infinity, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(article['title'], maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
