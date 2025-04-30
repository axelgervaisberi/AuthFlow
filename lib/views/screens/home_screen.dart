import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/theme.dart';
import '../../viewmodels/auth_viewmodel.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final user = authViewModel.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthFlow'),
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authViewModel.signOut();
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.verified_user,
              size: 100,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 32),
            Text('Welcome!', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 16),
            Text(
              'You are successfully logged in',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.email,
                        color: AppTheme.primaryColor,
                      ),
                      title: const Text('Email'),
                      subtitle: Text(user?.email ?? 'Not available'),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.fingerprint,
                        color: AppTheme.primaryColor,
                      ),
                      title: const Text('User ID'),
                      subtitle: Text(user?.uid ?? 'Not available'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Sign Out',
              onPressed: () async {
                await authViewModel.signOut();
              },
              backgroundColor: Colors.red.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
