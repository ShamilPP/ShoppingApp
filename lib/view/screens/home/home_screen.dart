import 'package:eommerce_app/constants/app_colors.dart';
import 'package:eommerce_app/constants/app_images.dart';
import 'package:eommerce_app/utils/style/app_button_style.dart';
import 'package:eommerce_app/view/screens/home/widgets/home_cleaning_service.dart';
import 'package:eommerce_app/view/screens/home/widgets/home_search.dart';
import 'package:eommerce_app/view/screens/home/widgets/home_service_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/style/app_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAppBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              /// Adds bottom padding to ensure the full home screen is visible,
              /// accounting for the overlay of the bottom navigation bar.
              padding: const EdgeInsets.only(top: 15, bottom: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15), child: Image.asset(AppImages.poster, width: double.infinity, fit: BoxFit.contain)),
                  const SizedBox(height: 20),
                  const HomeSearch(),
                  const SizedBox(height: 20),
                  HomeServiceList(),
                  const SizedBox(height: 20),
                  const HomeCleaningService()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text('👋', style: AppTextStyle.subTitleText)),
          Row(
            children: [
              const Text('406, Skyline Park Dale, MM Road.... ', style: AppTextStyle.subParagraphText),
              ShaderMask(
                shaderCallback: (bounds) => AppColors.greenGradient.createShader(bounds),
                child: const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.shopping),
            style: AppButtonStyle.curvedStyle(backgroundColor: Colors.white, radius: 10),
          ),
        ),
      ],
    );
  }
}
