import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/screens/history/history_screen.dart';

void main() {
  testWidgets('HistoryScreen filtering test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HistoryScreen(),
      ),
    );

    // In HistoryScreen, we have dummy data:
    // 2 days ago, 10 days ago, 25 days ago, 40 days ago.
    // Filtered history should have 3 items.

    expect(find.byType(ListTile), findsNWidgets(3));
    expect(find.text('Old Consultation'), findsNothing);
    expect(find.text('Symptom Analysis'), findsOneWidget);
  });
}
