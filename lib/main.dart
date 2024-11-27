import 'package:eommerce_app/constants/app_theme.dart';
import 'package:eommerce_app/constants/supabase_key.dart';
import 'package:eommerce_app/model/user/user.dart';
import 'package:eommerce_app/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

ProviderContainer provider = ProviderContainer();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Hive
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  /// Supabase
  await Supabase.initialize(url: SupabaseKey.SUPABASE_URL, anonKey: SupabaseKey.SUPABASE_ANON_KEY);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Shopping App',
        theme: AppTheme.theme,
        home: const SplashScreen(),
      ),
    );
  }
}
