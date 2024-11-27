import 'package:eommerce_app/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileTile({super.key, required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey, size: 25),
        title: Text(label, style: AppTextStyle.paragraphText),
        onTap: onTap,
      ),
    );
  }
}
