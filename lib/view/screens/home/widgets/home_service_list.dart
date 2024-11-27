import 'package:eommerce_app/constants/app_colors.dart';
import 'package:eommerce_app/constants/app_images.dart';
import 'package:eommerce_app/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeServiceList extends StatelessWidget {
  HomeServiceList({super.key});

  final List<Map<String, String>> services = [
    {'icon': AppImages.cleaning, 'label': 'Cleaning'},
    {'icon': AppImages.waste, 'label': 'Waste Disposal'},
    {'icon': AppImages.plumbing, 'label': 'Plumbing'},
    {'icon': AppImages.plumbing, 'label': 'Plumbing'},
    {'icon': AppImages.cleaning, 'label': 'Cleaning'},
    {'icon': AppImages.waste, 'label': 'Waste Disposal'},
    {'icon': AppImages.plumbing, 'label': 'Plumbing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(left: 15), child: Text('Available Services', style: AppTextStyle.paragraphBlackBold)),
          const SizedBox(height: 10),
          GridView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: services.length + 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 15),
            itemBuilder: (context, index) {
              // See all button
              if (index == services.length) {
                return const HomeServiceItem(icon: Icon(Icons.arrow_forward, color: Colors.green, size: 24), label: 'See All', labelColor: Colors.green);
              }

              // Service button
              final service = services[index];
              return HomeServiceItem(icon: SvgPicture.asset(service['icon']!, width: 30, height: 30), label: service['label']!);
            },
          )
        ],
      ),
    );
  }
}

class HomeServiceItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final Color labelColor;

  const HomeServiceItem({super.key, required this.icon, required this.label, this.labelColor = AppColors.textColorPrimary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 30, backgroundColor: Colors.grey[200], child: icon),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: labelColor)),
        ],
      ),
    );
  }
}
