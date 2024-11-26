import 'package:agecalculator/splash/splash.dart';
import 'package:agecalculator/theme/theme_provider.dart';
import 'package:agecalculator/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const AgeCalculator());
}

class AgeCalculator extends StatelessWidget {
  const AgeCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}




