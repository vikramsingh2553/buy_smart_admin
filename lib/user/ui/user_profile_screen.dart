import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (userProvider.errorMessage != null) {
            return Center(child: Text('Error: ${userProvider.errorMessage}'));
          }

          final userProfile = userProvider.userProfile;

          if (userProfile == null) {
            return const Center(child: Text('No user data available'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('username: ${userProfile['username'] ?? 'N/A'}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                // Add more fields as needed
              ],
            ),
          );
        },
      ),
    );
  }
}
