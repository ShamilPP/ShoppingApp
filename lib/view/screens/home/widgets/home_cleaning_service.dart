import 'package:eommerce_app/constants/app_images.dart';
import 'package:eommerce_app/view/screens/cleaning_service/cleaning_service_screen.dart';
import 'package:flutter/material.dart';

import '../../../../utils/style/app_text_style.dart';

class HomeCleaningService extends StatelessWidget {
  const HomeCleaningService({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Cleaning Services', style: AppTextStyle.paragraphBlackBold),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CleaningServiceScreen()));
                  },
                  child: const Row(
                    children: [
                      Text('See All', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.green)),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios_sharp, size: 10, color: Colors.green)
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  HomeCleaningServiceItem(image: AppImages.home_cleaning, label: 'Home Cleaning'),
                  SizedBox(width: 15),
                  HomeCleaningServiceItem(image: AppImages.carpet_cleaning, label: 'Carpet Cleaning'),
                  SizedBox(width: 15),
                  HomeCleaningServiceItem(image: AppImages.sofa_cleaning, label: 'Sofa Cleaning'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCleaningServiceItem extends StatelessWidget {
  final String image, label;

  const HomeCleaningServiceItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Column(
            children: [
              SizedBox(height: 160, width: 140, child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(image))),
              const SizedBox(height: 5),
              Text(label, style: AppTextStyle.subParagraphTextBlack)
            ],
          ),
        )
      ],
    );
  }
}
