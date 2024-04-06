import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;
import 'package:pet_shop/screens/ViewOrdersScreen/models/ordermodel.dart';


class OrderProvider with ChangeNotifier {
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

  List<OrderModel> _orders = [];
  List<OrderModel> get orders {
    return [..._orders];
  }
 


  Future getAllOrderData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/pet_shop/api/view_my_orders.php?user_id=1"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/pet_shop/api/view_my_orders.php?user_id=1");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _orders = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> orderDetails = extractedData['orders'];
        for (var i = 0; i < orderDetails.length; i++) {
          _orders.add(
            OrderModel(
              orderId:orderDetails[i]['order_id'].toString(),
              petId:orderDetails[i]['pet_id'].toString(),
              userId: orderDetails[i]['user_id'].toString(),
              purchaseType: orderDetails[i]['purchase_type'].toString(),
              totalAmount: orderDetails[i]['total_amount'].toString(),
              quantity: orderDetails[i]['quantity'].toString(),
              status: orderDetails[i]['status'].toString(),
              date: orderDetails[i]['date'].toString(),
              name: orderDetails[i]['name'].toString(),
              species: orderDetails[i]['species'].toString(),
              breed: orderDetails[i]['breed'].toString(),
              age: orderDetails[i]['age'].toString(),
              sex: orderDetails[i]['sex'].toString(),
              color: orderDetails[i]['color'].toString(),
              weight: orderDetails[i]['weight'].toString(),
              dob: orderDetails[i]['dob'].toString(),
              microchipid: orderDetails[i]['microchipid'].toString(),
              aid: orderDetails[i]['aid'].toString(),
              diet: orderDetails[i]['diet'].toString(),
              behaviour: orderDetails[i]['behaviour'].toString(),
              addeddate: orderDetails[i]['addeddate'].toString(),
              notes: orderDetails[i]['notes'].toString(),
              photo: orderDetails[i]['photo'].toString(),


             
            ),
          );
        }
        ;

        print('pet details' + _orders.toString());
        _isLoading = false;
        print('cateogory products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Pet Data is one by one loaded the pet' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }

}