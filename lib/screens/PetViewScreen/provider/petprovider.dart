import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as https;
import 'package:pet_shop/screens/PetViewScreen/models/petmodel.dart';

class PetProvider with ChangeNotifier {
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

  List<PetModel> _pets = [];
  List<PetModel> get pets {
    return [..._pets];
  }

  Future getAllPetsData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/pet_shop/api/viewallpets.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/pet_shop/api/viewallpets.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _pets = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> petDetails = extractedData['petDetails'];
        for (var i = 0; i < petDetails.length; i++) {
          _pets.add(
            PetModel(
              petId: petDetails[i]['petid'].toString(),
              petName: petDetails[i]['name'].toString(),
              petBreed: petDetails[i]['breed'].toString(),
              petspeciesName: petDetails[i]['species'].toString(),
              petImage: petDetails[i]['photo'].toString(),
              petAge: petDetails[i]['age'].toString(),
              petSex: petDetails[i]['sex'].toString(),
              petWeight: petDetails[i]['weight'].toString()
            ),
          );
        }
        ;

        print('pet details' + _pets.toString());
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