import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:pet_shop/screens/AdoptionCartScreen/models/adoptionmodel.dart';




class AdoptionProvider extends ChangeNotifier {
  String? userid;
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }
  AdoptionDetails?adoptionDetails;
  List<AdoptionDetails> _adoptions = [];
  List<AdoptionDetails> get adoptions {
    return [..._adoptions];
  }

  Future getAllAdoptionData({BuildContext? context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/pet_shop/api/view_cart.php?user_id=1"),
      );

      print(
            "http://campus.sicsglobal.co.in/Project/pet_shop/api/view_cart.php?user_id=1");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _adoptions=[];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> adoptionDetails = extractedData['cartDetails'];
        for (var i = 0; i < adoptionDetails.length; i++) {
          _adoptions.add(
            AdoptionDetails(
              cartid:adoptionDetails[i]['cartid'].toString(),
              quantity: adoptionDetails[i]['quantity'].toString(),
              petid: adoptionDetails[i]['petid'].toString(),
              name: adoptionDetails[i]['name'].toString(),
              species: adoptionDetails[i]['species'].toString(),
              breed: adoptionDetails[i]['breed'].toString(),
              age: adoptionDetails[i]['age'].toString(),
              sex: adoptionDetails[i]['sex'].toString(),
              color: adoptionDetails[i]['color'].toString(),
              weight: adoptionDetails[i]['weight'].toString(),
              dob: adoptionDetails[i]['dob'].toString(),
              microchipid: adoptionDetails[i]['microchipid'].toString(),
              aid: adoptionDetails[i]['aid'].toString(),
              diet: adoptionDetails[i]['diet'].toString(),
              behaviour: adoptionDetails[i]['behaviour'].toString(),
              status: adoptionDetails[i]['status'].toString(),
              notes: adoptionDetails[i]['notes'].toString(),
              addeddate: adoptionDetails[i]['addeddate'].toString(),
              photo: adoptionDetails[i]['photo'].toString()


             
              
            ),
          );
        }
        ;

        print('product details' + _adoptions.toString());
        _isLoading = false;
        print('products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
  Future<void> deleteCart(String cartId) async {
    final url = Uri.parse('http://campus.sicsglobal.co.in/Project/pet_shop/api/delete_cart.php?cart_id=$cartId');
    
    try {
      final response = await https.delete(url);

      if (response.statusCode == 200) {
        getAllAdoptionData();
        // Cart deleted successfully
        print('Cart deleted successfully');
      } else {
        // Failed to delete cart
        print('Failed to delete cart: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting cart: $e');
    }
  }
  // Future<void> clearCart({String? userid}) async {
  //   final url = Uri.parse('http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/clear_cart.php?user_id=$userid');
    
  //   try {
  //     final response = await https.delete(url);

  //     if (response.statusCode == 200) {
  //       getAllCartsData();
  //       // Cart deleted successfully
  //       print('Cart deleted successfully');
  //     } else {
  //       // Failed to delete cart
  //       print('Failed to delete cart: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error deleting cart: $e');
  //   }
  // }


 
}


 
