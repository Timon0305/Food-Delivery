import 'package:food_delivery_app/src/models/extra.dart';
import 'package:food_delivery_app/src/models/food.dart';

class FoodOrder {
  String id;
  double price;
  double quantity;
  List<Extra> extras;
  Food food;
  DateTime dateTime;
  FoodOrder();

  FoodOrder.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'].toString();
    price = jsonMap['price'] != null ? jsonMap['price'].toDouble() : 0.0;
    quantity = jsonMap['quantity'] != null ? jsonMap['quantity'].toDouble() : 0.0;
    food = jsonMap['food'] != null ? Food.fromJSON(jsonMap['food']) : [];
    dateTime = DateTime.parse(jsonMap['updated_at']);
    extras = jsonMap['extras'] != null
        ? List.from(jsonMap['extras']).map((element) => Extra.fromJSON(element)).toList()
        : null;
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["price"] = price;
    map["quantity"] = quantity;
    map["food_id"] = food.id;
    map["extras"] = extras.map((element) => element.id).toList();
    return map;
  }
}
