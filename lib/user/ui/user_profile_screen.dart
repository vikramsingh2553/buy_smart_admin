import 'package:buy_smart_admin/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: userProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : userProvider.errorMessage != null
          ? Center(child: Text(userProvider.errorMessage!))
          : userProvider.userProfile == null
          ? Center(child: Text('No user profile data'))
          : Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${userProvider.userProfile!['name']}'),
            Text('Email: ${userProvider.userProfile!['email']}'),
          ],
        ),
      ),
    );
  }
}
