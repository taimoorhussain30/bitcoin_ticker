import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/price_screen.dart';

void main() {
  runApp(const Bitcoin());
}

class Bitcoin extends StatelessWidget {
  const Bitcoin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Colors.lightBlue),
          scaffoldBackgroundColor: Colors.white),
      home: const PriceScreen(),
    );
  }
}
