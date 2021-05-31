import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubapp/injection/injection.dart';
import 'package:githubapp/presentation/blocs/theme_bloc/theme_bloc.dart';
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
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => ThemeBloc(),
      ),
    ], child: _Init());
  }
}

class _Init extends StatefulWidget {
  @override
  __InitState createState() => __InitState();
}

class __InitState extends State<_Init> {
  @override
  void initState() {
    super.initState();
    final brightness = SchedulerBinding.instance!.window.platformBrightness;
    final bloc = context.read<ThemeBloc>();
    bloc.add(ChangeTheme((brightness == Brightness.dark) ? true : false));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.isDark ? appThemeDark : appThemeLight,
          title: 'GithubApp',
          initialRoute: appInitialRoute,
          routes: appRoutes,
        );
      },
    );
  }
}
