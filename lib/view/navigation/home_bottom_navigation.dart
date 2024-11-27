import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/navigation_riverpod.dart';

class HomeBottomNavigation extends ConsumerWidget {
  HomeBottomNavigation({super.key});

  final List<IconData> _icons = [
    Icons.home,
    Icons.calendar_today,
    Icons.account_circle,
  ];

  final List<String> _labels = [
    "Home",
    "Bookings",
    "Account",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavigationProvider);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (index) {
          final isSelected = currentIndex == index;
          return GestureDetector(
            onTap: () {
              ref.read(bottomNavigationProvider.notifier).updateIndex(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green.withOpacity(0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    _icons[index],
                    color: isSelected ? Colors.green : Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    _labels[index],
                    style: TextStyle(color: isSelected ? Colors.green : Colors.grey, fontWeight: FontWeight.w500,fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
