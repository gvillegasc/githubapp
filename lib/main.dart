import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:githubapp/injection/injection.dart';
import 'package:githubapp/presentation/routes/routes.dart';
import 'package:githubapp/presentation/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
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
