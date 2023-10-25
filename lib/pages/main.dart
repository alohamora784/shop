import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/pages/registration/login.dart';
import 'package:smartphone_shop/providers/address_provider.dart';
import 'package:smartphone_shop/providers/card_provider.dart';
import 'package:smartphone_shop/providers/categories_provider.dart';
import 'package:smartphone_shop/providers/posts_provider.dart';
import 'package:smartphone_shop/providers/user_provider.dart';
import 'package:smartphone_shop/providers/wishlist_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => CardProvider()),
        ChangeNotifierProvider(create: (_) => PostsProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => WishListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: const MyLogin(),
      ),
    );
  }
}
