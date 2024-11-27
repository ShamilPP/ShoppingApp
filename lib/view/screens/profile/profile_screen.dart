import 'package:eommerce_app/constants/app_colors.dart';
import 'package:eommerce_app/utils/style/app_text_style.dart';
import 'package:eommerce_app/view/screens/profile/widgets/profile_tile.dart';
import 'package:eommerce_app/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';
import '../../../model/user/user.dart';
import '../../../view_model/auth_riverpod.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = provider.read(authProvider);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name and icon
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(gradient: AppColors.greenGradient, borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text(user?.name[0] ?? 'N', style: TextStyle(fontSize: 25, color: Colors.white))),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user?.name ?? 'Name', style: AppTextStyle.paragraphBlackBold),
                            Text(user?.email ?? "Email", style: AppTextStyle.subParagraphTextBlack),
                          ],
                        )
                      ],
                    ),

                    /// Balance
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(color: AppColors.lightGreen, borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Wallet', style: TextStyle(fontSize: 16, color: AppColors.primaryColor, fontWeight: FontWeight.w500)),
                            Container(
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                child: const Text('Balance -  125', style: TextStyle(fontSize: 16, color: AppColors.primaryColor, fontWeight: FontWeight.w500)))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// Additional options
                    ProfileTile(label: 'Edit profile', icon: Icons.account_circle_rounded, onTap: () {}),
                    ProfileTile(label: 'Saved Address', icon: Icons.location_on_rounded, onTap: () {}),
                    ProfileTile(label: 'Terms & Conditions', icon: Icons.library_books_rounded, onTap: () {}),
                    ProfileTile(label: 'Privacy Policy', icon: Icons.book_rounded, onTap: () {}),
                    ProfileTile(label: 'Refer a friend', icon: Icons.group_rounded, onTap: () {}),
                    ProfileTile(label: 'Customer support', icon: Icons.phone_rounded, onTap: () {}),
                    ProfileTile(label: 'Log out', icon: Icons.logout_rounded, onTap: () => _logout(context)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(title: const Text('My Account', style: AppTextStyle.subTitleBold));
  }

  void _logout(BuildContext context) async {
    await provider.read(authProvider.notifier).signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const SplashScreen()), (Route<dynamic> route) => false);
  }
}
