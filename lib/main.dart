import 'package:driver/firebase_options.dart';
import 'package:driver/providers/map_provider.dart';
import 'package:driver/providers/user_provider.dart';
import 'package:driver/screens/cash_earned_screen.dart';
import 'package:driver/screens/choice_screen.dart';
import 'package:driver/screens/completed_trip_screen.dart';
import 'package:driver/screens/login_signup_screen.dart';
import 'package:driver/screens/map_screen.dart';
import 'package:driver/screens/onboarding_screen.dart';
import 'package:driver/screens/profile.dart';
import 'package:driver/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TaxiAppDriver());
}

class TaxiAppDriver extends StatelessWidget {
  const TaxiAppDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MapProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Taxi App Driver',
        initialRoute: OnboardingScreen.route,
        theme: theme,
        routes: {
          OnboardingScreen.route: (_) => const OnboardingScreen(),
          LoginSignupScreen.route: (_) => const LoginSignupScreen(),
          MapScreen.route: (_) => const MapScreen(),
          CompletedTripsScreen.route: (_) => const CompletedTripsScreen(),
          CashEarnedScreen.route: (_) => const CashEarnedScreen(),
          ChoiceScreen.route: (_) => const ChoiceScreen(),
          Profile.route: (_) => const Profile(),
        },
      ),
    );
  }
}
