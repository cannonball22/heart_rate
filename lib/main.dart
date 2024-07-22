import 'package:flutter/material.dart';
import 'package:heart_rate/util.dart';

import 'core/Services/App/app.service.dart';
import 'core/Services/Firebase/firebase.service.dart';
import 'features/authentication/domain/repositories/AuthService.dart';
import 'features/authentication/presentation/pages/landing.screen.dart';
import 'features/home/presentation/pages/home.screen.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await App.initialize(AppEnvironment.dev);

  await FirebaseService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: theme.light().colorScheme,
        textTheme: textTheme,
      ),
      highContrastTheme: ThemeData(
        useMaterial3: true,
        colorScheme: theme.lightHighContrast().colorScheme,
        textTheme: textTheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: theme.dark().colorScheme,
        textTheme: textTheme,
      ),
      highContrastDarkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: theme.darkHighContrast().colorScheme,
        textTheme: textTheme,
      ),
      home: StreamBuilder(
        stream: AuthService().isUserLoggedIn(),
        builder: (builder, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LandingScreen();
          }
        },
      ),
    );
  }
}
