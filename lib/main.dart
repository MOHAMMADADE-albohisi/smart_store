import 'package:flutter/material.dart';
import 'package:smart_store/screens/core/launch_screen.dart';
import 'package:smart_store/screens/core/outboarding_screen.dart';
void main(){
  runApp(smart_store());
}


class smart_store extends StatelessWidget {
  const smart_store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/onbressd_screen',
      routes: {
        '/lunch_screen': (context) => const lunch_screen(),
        '/onbressd_screen': (context) => const onbressd_screen(),

      },
    );
  }
}
