import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:frontend/screens/auth/login_screen.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MockAuthService extends ChangeNotifier implements IAuthService {
  @override
  User? get user => null;

  @override
  Future<UserCredential?> signInWithGoogle() async => null;

  @override
  Future<UserCredential?> signInWithEmail(String email, String password) async => null;

  @override
  Future<UserCredential?> registerWithEmail(String email, String password) async => null;

  @override
  Future<void> signOut() async {}

  @override
  Future<void> sendPasswordResetEmail(String email) async {}
}

void main() {
  testWidgets('LoginScreen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<IAuthService>(
        create: (_) => MockAuthService(),
        child: const MaterialApp(
          home: LoginScreen(),
        ),
      ),
    );

    expect(find.text('Login'), findsAtLeast(1));
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Sign in with Google'), findsOneWidget);
  });
}
