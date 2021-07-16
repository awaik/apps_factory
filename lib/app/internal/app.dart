import 'package:apps_factory/app/view/home_screen/home_screen.dart';
import 'package:apps_factory/app/view/search_screen/model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SearchViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Albums Lib',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(),
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrange,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
