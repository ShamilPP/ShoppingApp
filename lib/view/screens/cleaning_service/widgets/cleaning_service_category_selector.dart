import 'package:eommerce_app/constants/app_colors.dart';
import 'package:eommerce_app/view/widget/gradient_button.dart';
import 'package:eommerce_app/view_model/cleaning_category_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CleaningServiceCategorySelector extends ConsumerWidget {
  CleaningServiceCategorySelector({super.key});

  final cleaningServiceList = ['Deep cleaning', 'Maid Services', 'Car Cleaning', 'Carpet Cleaning'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSelectedCategory = ref.watch(cleaningCategoryProvider);
    return Container(
      color: AppColors.lightGreen,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: cleaningServiceList.map((String item) {
              final isSelected = currentSelectedCategory == item;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: GradientButton(
                  gradient: isSelected ? AppColors.greenGradient : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Text(item, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.w500)),
                  ),
                  onPressed: () {
                    ref.read(cleaningCategoryProvider.notifier).updateCategory(item);
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
