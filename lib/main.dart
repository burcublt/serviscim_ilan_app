import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviscim_app/providers/post_provider.dart';
import 'package:serviscim_app/screens/home_page.dart';
import 'package:serviscim_app/screens/login.dart';
import 'package:serviscim_app/src/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(
            create: (context) => PostProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Login(),
      ),
    );
  }
}

/*
theme: ThemeData.light().copyWith(
            tabBarTheme: TabBarTheme(
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.grey.withOpacity(0.3),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const BoxDecoration()),
            appBarTheme: const AppBarTheme(
                elevation: 0, backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.dark),
            floatingActionButtonTheme:
                const FloatingActionButtonThemeData(backgroundColor: Color.fromRGBO(11, 23, 84, 1))),
      ),
*/
