import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy history data
    final List<Map<String, dynamic>> allHistory = [
      {'date': DateTime.now().subtract(const Duration(days: 2)), 'title': 'Symptom Analysis'},
      {'date': DateTime.now().subtract(const Duration(days: 10)), 'title': 'Hospital Finder'},
      {'date': DateTime.now().subtract(const Duration(days: 25)), 'title': 'Home Remedies'},
      {'date': DateTime.now().subtract(const Duration(days: 40)), 'title': 'Old Consultation'},
    ];

    final thirtyDaysAgo = DateTime.now().subtract(const Duration(days: 30));
    final filteredHistory = allHistory.where((item) => (item['date'] as DateTime).isAfter(thirtyDaysAgo)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Consultation History')),
      body: ListView.builder(
        itemCount: filteredHistory.length,
        itemBuilder: (context, index) {
          final item = filteredHistory[index];
          return ListTile(
            leading: const Icon(Icons.history),
            title: Text(item['title']),
            subtitle: Text(DateFormat('yyyy-MM-dd').format(item['date'])),
            trailing: const Icon(Icons.chevron_right),
          );
        },
      ),
    );
  }
}
