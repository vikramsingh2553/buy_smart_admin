import 'package:buy_smart_admin/Product/ui/starting_home_screen.dart';
import 'package:buy_smart_admin/shared/api_end_points.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buy_smart_admin/Auth/user/provider/user_provider.dart';
import 'package:buy_smart_admin/Product/provider/product_provider.dart';
import 'package:buy_smart_admin/Category/provider/category_provider.dart';
import 'package:buy_smart_admin/Auth/ui/login_screen.dart';

import 'Auth/provider/auth_provider.dart';
import 'Auth/user/service/user_service.dart';
import 'Auth/user/ui/user_profile_screen.dart';

void main() {
  final apiService = ApiService(
    baseUrl: 'http://localhost:3000/api',
    authToken:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiMSIsInVzZXJuYW1lIjoiVmlrcmFtIn0sImlhdCI6MTcyMjIzNzkyMCwiZXhwIjoxNzIyMjQxNTIwfQ.eP4B6G4L3G_nPsi7eDDEQuUwgPHF0YwpCnBn9hEugXI',

  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(
          create: (context) => UserProvider(apiService),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: authProvider.isLoggedIn ? StartingHomeScreen() : LogInScreen(),
        );
      },
    );
  }
}
