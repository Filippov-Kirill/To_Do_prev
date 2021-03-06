
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_app/AppColors.dart';
import 'package:todo_app/Dependencies.dart';
import 'package:todo_app/Localization.dart';
import 'package:todo_app/presentation/home/HomeScreen.dart';

// static dependency injection
Dependencies _sharedDependencies;
Dependencies get dependencies => _sharedDependencies;

class App extends StatelessWidget {
  App({
    Key key,
    Dependencies dependencies,
  }): super(key: key) {
    _sharedDependencies = dependencies;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blue Diary',
      theme: ThemeData(
        canvasColor: AppColors.BACKGROUND_WHITE,
        primaryColor: AppColors.PRIMARY,
        primaryColorLight: AppColors.PRIMARY_LIGHT,
        primaryColorDark: AppColors.PRIMARY_DARK,
        accentColor: AppColors.SECONDARY,
        splashColor: AppColors.RIPPLE,

        textTheme: TextTheme(
          subhead: TextStyle(
            textBaseline: TextBaseline.alphabetic
          ),
        ),
      ),
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ko'),
      ],
      builder: (context, widget) {
        if (kReleaseMode) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return Container();
          };
        }
        return widget;
      },
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
