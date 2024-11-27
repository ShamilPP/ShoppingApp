import 'package:eommerce_app/model/cleaning_service.dart';

class Cart {
  int qty;
  final CleaningService item;

  Cart({required this.qty, required this.item});
}
