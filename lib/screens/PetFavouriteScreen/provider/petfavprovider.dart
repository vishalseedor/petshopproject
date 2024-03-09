import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

import 'package:pet_shop/screens/PetFavouriteScreen/models/petfavmodel.dart';



class FavouriteProvider extends ChangeNotifier {
 
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
  FavouiteModel? cartDetails;
  List< FavouiteModel> _favourites = [];
  List< FavouiteModel> get favourites {
    return [..._favourites];
  }

  Future getAllFavouritesData({BuildContext? context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/pet_shop/api/viewfavpets.php?aid=1"),
      );

      print(
            "http://campus.sicsglobal.co.in/Project/pet_shop/api/viewfavpets.php?aid=1");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _favourites = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> favDetails = extractedData['petDetails'];
        for (var i = 0; i < favDetails.length; i++) {
          _favourites.add(
            FavouiteModel(
              petid:favDetails[i]['petid'].toString(),
              name: favDetails[i]['name'].toString(),
              species: favDetails[i]['species'].toString(),
              breed:favDetails[i]['breed'].toString(),
              age: favDetails[i]['age'].toString(),
              sex: favDetails[i]['sex'].toString(),
              color: favDetails[i]['color'].toString(),
              weight: favDetails[i]['weight'].toString(),
              dob: favDetails[i]['dob'].toString(),
              microchipid: favDetails[i]['microchipid'].toString(),
              aid: favDetails[i]['aid'].toString(),
              diet: favDetails[i]['diet'].toString(),
              behaviour: favDetails[i]['behaviour'].toString(),
              notes: favDetails[i]['notes'].toString(),
              status: favDetails[i]['status'].toString(),
              photo: favDetails[i]['photo'].toString(),
              addeddate: favDetails[i]['addeddate'].toString()
            
             
              
            ),
          );
        }
        ;

        print('favourites details' + _favourites.toString());
        _isLoading = false;
        print('Favourites loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in fav prod -->>' + e.toString());
      print('Favourite Data is one by one loaded the favouite' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
  Future<void> AddtoFavourite({String? petid}) async {
    final url = Uri.parse('http://campus.sicsglobal.co.in/Project/pet_shop/api/viewfavpets.php?aid=1&petid=$petid');
    
    try {
      final response = await https.post(url);

      if (response.statusCode == 200) {
      getAllFavouritesData();
        print(url);
     
        // Cart deleted successfully
        print('Fav added successfully');
      } else {
        // Failed to delete cart
        print('Failed to delete cart: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting cart: $e');
    }
  }
 


 
}


 
