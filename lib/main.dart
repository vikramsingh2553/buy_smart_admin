import 'package:buy_smart_admin/Auth/ui/login_screen.dart';
import 'package:buy_smart_admin/Auth/provider/auth_provider.dart';
import 'package:buy_smart_admin/Category/provider/category_provider.dart';
import 'package:buy_smart_admin/Product/provider/product_provider.dart';
import 'package:buy_smart_admin/Product/ui/starting_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider(),),
        ChangeNotifierProvider(create: (context) => CategoryProvider(),),
        ChangeNotifierProvider(create: (context) => AuthProvider(),)
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: StartingHomeScreen(),
            // home: authProvider.isLoggedIn ? StartingHomeScreen() : LogInScreen(),
          );
        },
      ),
    );
  }
}
