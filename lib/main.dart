import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/theme/theme.dart';
import 'package:weather_app/features/auth/view/login_page.dart';
import 'package:weather_app/features/auth/view_model/auth_provider.dart';
import 'package:weather_app/features/weather/view_model/weather_provider.dart';
import 'features/weather/view/weather_home.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WeatherApp',
        theme: AppTheme.theme,
        home: const AuthChecker(),
      ),
    );
  }
}

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData) {
          return snapshot.data! ? const WeatherHomePage() : PhoneNumberScreen();
        } else {
          return PhoneNumberScreen();
        }
      },
    );
  }

  Future<bool> _checkLoginStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
