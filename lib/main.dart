import 'package:buy_smart_admin/Auth/provider/auth_provider.dart';
import 'package:buy_smart_admin/Auth/ui/login_screen.dart';
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
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        // ChangeNotifierProvider<ProductProvider>(
        //   create: (_) => ProductProvider(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LogInScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}