import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translation/flutter_translation.dart';
import 'package:githubapp/core/language/app_languages.dart';
import 'package:githubapp/core/language/app_locations.dart';
import 'package:githubapp/injection/injection.dart';
import 'package:githubapp/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:githubapp/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:githubapp/presentation/routes/routes.dart';
import 'package:githubapp/presentation/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => getIt<ThemeBloc>(),
      ),
      BlocProvider(
        create: (_) => getIt<LanguageBloc>(),
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
    final themeBloc = context.read<ThemeBloc>();
    final languageBloc = context.read<LanguageBloc>();
    themeBloc.add(ChangeTheme((brightness == Brightness.dark) ? true : false));
    languageBloc.add(OnGetLanguage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, languageState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeState.isDark ? appThemeDark : appThemeLight,
              title: 'GithubApp',
              supportedLocales: getIt<AppLanguages>()
                  .languages
                  .map((lang) => lang.toLocale()),
              locale: languageState.language.toLocale(),
              localizationsDelegates: const [
                AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              initialRoute: appInitialRoute,
              routes: appRoutes,
            );
          },
        );
      },
    );
  }
}
