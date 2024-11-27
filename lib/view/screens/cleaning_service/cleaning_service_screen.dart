import 'package:eommerce_app/constants/app_colors.dart';
import 'package:eommerce_app/model/cart.dart';
import 'package:eommerce_app/utils/style/app_button_style.dart';
import 'package:eommerce_app/view/screens/cleaning_service/widgets/cleaning_service_category_selector.dart';
import 'package:eommerce_app/view/screens/cleaning_service/widgets/cleaning_service_list.dart';
import 'package:eommerce_app/view_model/cart_selection_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CleaningServiceScreen extends ConsumerWidget {
  const CleaningServiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cleaning services'),
        titleSpacing: 10,
        leadingWidth: 70,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black, size: 15),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
          style: AppButtonStyle.curvedStyle(backgroundColor: AppColors.greyColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                CleaningServiceCategorySelector(),
                CleaningServiceList(),
              ],
            ),

            /// Add cart button
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Consumer(
                builder: (ctx, ref, _) {
                  var carts = ref.watch(cartSelectionProvider);
                  if (carts.isEmpty) return const SizedBox();
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
                          child: Center(
                            child: Text(
                              "${carts.length} items | ₹${getTotalAmount(carts)}",
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.cartButtonColor,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Text("VIEW CART", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Icon(Icons.arrow_right_rounded, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getTotalAmount(List<Cart> carts) {
    double amount = 0;
    for (var cart in carts) {
      amount = amount + (cart.item.price * cart.qty);
    }
    return amount;
  }
}
