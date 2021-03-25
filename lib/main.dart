import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_app/views/blog_list_view/blog_list_view.dart';
import 'package:simple_flutter_app/views/login_view/login_view.dart';
import 'package:simple_flutter_app/helper/locator.dart';
import 'package:simple_flutter_app/providers/user_provider.dart';
import 'package:simple_flutter_app/views/splash_view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashView(),
        routes: {
          BlogListView.NAME: (_) => BlogListView(),
          LoginView.NAME: (_) => LoginView(),
        },
      ),
    );
  }
}
