import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart'; // Untuk BuildContext jika perlu
// Impor halaman-halaman fitur Anda di sini nanti
// import 'package:mediai_agent/features/symptom_analysis/presentation/pages/symptom_input_page.dart';
// import 'package:mediai_agent/features/hospital_results/presentation/pages/results_page.dart';
// import 'package:mediai_agent/features/search_history/presentation/pages/history_page.dart';
// import 'package:mediai_agent/features/about_app/presentation/pages/about_page.dart';

// Placeholder sementara untuk halaman
class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({required this.title, super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(child: Text(title)),
  );
}

final GoRouter router = GoRouter(
  initialLocation: '/symptom_input', // Rute awal aplikasi
  routes: [
    GoRoute(
      path: '/symptom_input',
      name: 'symptomInput',
      builder: (context, state) => const PlaceholderPage(
        title: 'Halaman Input Gejala',
      ), // Ganti dengan SymptomInputPage asli nanti
    ),
    GoRoute(
      path: '/results',
      name: 'results',
      builder: (context, state) => const PlaceholderPage(
        title: 'Halaman Hasil',
      ), // Ganti dengan ResultsPage asli nanti
      // Anda bisa menambahkan sub-rute untuk peta di sini jika perlu
      // routes: [
      //   GoRoute(
      //     path: 'map',
      //     name: 'map',
      //     builder: (context, state) => const PlaceholderPage(title: 'Halaman Peta'), // Ganti dengan MapPage asli nanti
      //   ),
      // ]
    ),
    GoRoute(
      path: '/history',
      name: 'history',
      builder: (context, state) => const PlaceholderPage(
        title: 'Halaman Riwayat',
      ), // Ganti dengan HistoryPage asli nanti
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => const PlaceholderPage(
        title: 'Halaman Tentang',
      ), // Ganti dengan AboutPage asli nanti
    ),
  ],
  // (Opsional) Error handler jika rute tidak ditemukan
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Error')),
    body: Center(child: Text('Halaman tidak ditemukan: ${state.error}')),
  ),
);
