import 'package:eommerce_app/model/cart.dart';
import 'package:eommerce_app/model/cleaning_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartSelectionProvider = StateNotifierProvider<CartSelectionNotifier, List<Cart>>((ref) => CartSelectionNotifier());

class CartSelectionNotifier extends StateNotifier<List<Cart>> {
  CartSelectionNotifier() : super([]);

  void increaseQty(CleaningService item) {
    List<Cart> newList = [...state];
    int index = newList.indexWhere((i) => i.item.id == item.id);
    if (index != -1) {
      newList[index].qty++;
    } else {
      Cart cart = Cart(qty: 1, item: item);
      newList.add(cart);
    }
    // Replace the state with the updated list to notify listeners.
    state = newList;
  }

  void decreaseQty(CleaningService item) {
    List<Cart> newList = [...state];
    int index = newList.indexWhere((i) => i.item.id == item.id);
    if (index != -1) {
      newList[index].qty--;
      if (newList[index].qty == 0) {
        newList.removeAt(index);
      }
    }
    // Replace the state with the updated list to notify listeners.
    state = newList;
  }
}
