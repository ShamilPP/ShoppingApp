import 'package:eommerce_app/constants/app_colors.dart';
import 'package:eommerce_app/model/cart.dart';
import 'package:eommerce_app/utils/style/app_text_style.dart';
import 'package:eommerce_app/view_model/cart_selection_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../model/cleaning_service.dart';

class CleaningServiceCard extends ConsumerWidget {
  final CleaningService cleaningService;

  const CleaningServiceCard(this.cleaningService, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Cart? cart = getCart(ref.watch(cartSelectionProvider));
    bool isAdded = cart != null;
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        cleaningService.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    )),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.star_rate_rounded, color: Colors.amber),
                        const SizedBox(width: 3),
                        Text('(${cleaningService.rating}/5) ${cleaningService.orders} Orders', style: AppTextStyle.subParagraphText),
                      ],
                    ),
                    Text(cleaningService.title, style: AppTextStyle.subTitleText),
                    Text(cleaningService.duration, style: AppTextStyle.subParagraphText),
                    Text('₹ ${cleaningService.price}', style: AppTextStyle.subTitleText),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Material(
              color: Colors.transparent,
              child: Ink(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  gradient: isAdded ? null : AppColors.greenGradient,
                  color: isAdded ? AppColors.greyColor : null,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                ),
                child: InkWell(
                  onTap: !isAdded ? () => _increaseQty(ref) : null,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: isAdded
                        ? [
                            InkWell(onTap: () => _decreaseQty(ref), child: const Icon(Icons.remove_rounded, color: AppColors.primaryColor, size: 20)),
                            const SizedBox(width: 7),
                            Text('${cart.qty}', style: const TextStyle(color: AppColors.primaryColor, fontSize: 20, fontWeight: FontWeight.w500)),
                            const SizedBox(width: 7),
                            InkWell(onTap: () => _increaseQty(ref), child: const Icon(Icons.add_rounded, color: AppColors.primaryColor, size: 20))
                          ]
                        : const [
                            Text('Add', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                            SizedBox(width: 5),
                            Icon(Icons.add_rounded, color: Colors.white, size: 20)
                          ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Cart? getCart(List<Cart> carts) {
    int index = carts.indexWhere((i) => i.item.id == cleaningService.id);
    if (index != -1) {
      return carts[index];
    }
    return null;
  }

  void _increaseQty(WidgetRef ref) {
    ref.read(cartSelectionProvider.notifier).increaseQty(cleaningService);
  }

  void _decreaseQty(WidgetRef ref) {
    ref.read(cartSelectionProvider.notifier).decreaseQty(cleaningService);
  }
}
