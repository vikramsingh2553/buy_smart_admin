import 'package:buy_smart_admin/Product/ui/starting_home_screen.dart';
import 'package:buy_smart_admin/shared/api_end_points.dart';
import 'package:buy_smart_admin/user/provider/user_provider.dart';
import 'package:buy_smart_admin/user/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buy_smart_admin/Product/provider/product_provider.dart';
import 'package:buy_smart_admin/Category/provider/category_provider.dart';
import 'package:buy_smart_admin/Auth/ui/login_screen.dart';
import 'package:buy_smart_admin/Auth/provider/auth_provider.dart';

void main() {

  final ApiService apiService = ApiService();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider(ApiEndpoints.authToken)),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider(apiService: apiService),),
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
