import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:pet_shop/screens/AdoptionCartScreen/models/adoptioncart.dart';


class AdoptionCartProvider extends ChangeNotifier {
  List<AdoptionCartModel> _adopItems = [];

  List<AdoptionCartModel> get cartItems =>_adopItems;
 
 void addToCart(AdoptionCartModel adop) {
    _adopItems.add(adop);
    notifyListeners();
  }

  Future addItemToCart({ String? petid,
  
   //String? userid,
  
   String? quanity}) async {
      var body = {
    'petid': petid.toString(),
    
   // 'user_id': userid.toString(),
    'quantity': quanity.toString(),
  };

  try {
    var response = await http.post(Uri.parse('http://campus.sicsglobal.co.in/Project/pet_shop/api/add_cart.php?petid=$petid&user_id=1&quantity=$quanity'),
        body: body);

    if (response.statusCode == 200) {
      // Request successful
      print('Added to cart successfully');
      print('Response: ${response.body}');
    } else {
      // Request failed with error code
      print('Failed to add to cart. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    // Exception thrown during request
    print('Failed to add to cart. Exception: $e');
  }
    
  }
}

