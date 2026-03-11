import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'theme.dart';
import 'routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const ARCollectionsApp(),
    ),
  );
}

class ARCollectionsApp extends StatelessWidget {
  const ARCollectionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AR Collections',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.modern,
      routerConfig: appRouter,
    );
  }
}
