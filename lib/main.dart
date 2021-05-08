import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:githubapp/presentation/routes/routes.dart';
import 'package:githubapp/presentation/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'GithubApp',
      initialRoute: appInitialRoute,
      routes: appRoutes,
    );
  }
}
