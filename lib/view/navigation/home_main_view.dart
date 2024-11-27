import 'package:eommerce_app/view/navigation/home_bottom_navigation.dart';
import 'package:eommerce_app/view/screens/booking/booking_screen.dart';
import 'package:eommerce_app/view/screens/home/home_screen.dart';
import 'package:eommerce_app/view/screens/profile/profile_screen.dart';
import 'package:eommerce_app/view_model/navigation_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_colors.dart';

class HomeMainView extends ConsumerWidget {
  const HomeMainView({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    BookingScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Consumer(
            builder: (ctx, ref, _) {
              return _screens[ref.watch(bottomNavigationProvider)];
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: HomeBottomNavigation(),
          )
        ],
      ),
    );
  }
}
