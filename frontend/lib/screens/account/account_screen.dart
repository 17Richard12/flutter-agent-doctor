import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../services/auth_service.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<IAuthService>(context);
    final user = authService.user;

    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: user?.photoURL != null
                ? NetworkImage(user!.photoURL!)
                : null,
            child: user?.photoURL == null ? const Icon(Icons.person, size: 50) : null,
          ),
          const SizedBox(height: 10),
          Text(
            user?.displayName ?? 'User Name',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            user?.email ?? 'user@example.com',
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 30),
          _buildButton(context, 'Edit Profile', Icons.edit, () {}),
          _buildButton(context, 'Forgot Password', Icons.lock, () {
            if (user?.email != null) {
              authService.sendPasswordResetEmail(user!.email!);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Password reset email sent')),
              );
            }
          }),
          _buildButton(context, 'Sign Out', Icons.logout, () {
            authService.signOut();
          }),
          const Spacer(),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text('App Version: ${snapshot.data!.version}'),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
      ),
    );
  }
}
