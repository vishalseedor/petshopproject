import 'package:flutter/material.dart';

class PetModel  {
  final String petId;
  final String petName;
  final String petBreed;
  final String petImage;
  final String petspeciesName;
  final String petSex;
  final String petAge;
  final String petWeight;
  


  PetModel({
   required this.petId,
   required this.petName,
   required this.petBreed,
   required this.petImage,
   required this.petspeciesName,
   required this.petAge,
   required this.petSex,
   required this.petWeight,
  
  });
  factory PetModel.fromJson(Map<String,dynamic>json){
    return PetModel(
      petId:json['petid'] ,
      petName: json['name'],
      petBreed: json['breed'], 
      petImage: json['photo'],
      petspeciesName: json['species'],
      petAge: json['age'],
      petSex:json['sex'],
      petWeight: json['weight'],
    
      );
  }
}
