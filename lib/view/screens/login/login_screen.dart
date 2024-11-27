import 'package:eommerce_app/constants/app_colors.dart';
import 'package:eommerce_app/utils/style/app_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_images.dart';
import '../../../main.dart';
import '../../../view_model/auth_riverpod.dart';
import '../splash/splash_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 200, height: 200, child: Image.asset(AppImages.icon)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => _signInWithGoogle(context),
                    style: AppButtonStyle.curvedStyle(backgroundColor: AppColors.greyColor, foregroundColor: Colors.black, radius: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20, width: 20, child: Image.asset(AppImages.google)),
                        SizedBox(width: 10),
                        Text('Continue with Google', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: AppButtonStyle.curvedStyle(backgroundColor: AppColors.primaryColor, foregroundColor: Colors.white, radius: 10),
                    child: Text('Phone', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _signInWithGoogle(BuildContext context) async {
    await provider.read(authProvider.notifier).signInWithGoogle();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const SplashScreen()), (Route<dynamic> route) => false);
  }
}
