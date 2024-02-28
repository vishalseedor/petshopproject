import 'package:flutter/material.dart';

class FavouriteModel {
  final String petid;
  final String name;
  final String species;
  final String breed;
  final String age;
  final String sex;
  final String color;
  final String weight;
  final String dob;
  final String microchipid;
  final String aid;
  final String diet;
  final String behaviour;
  final String notes;
  final String status;
  final String photo;
  final String price;
  final String addeddate;

  FavouriteModel(
      {required this.petid,
      required this.name,
      required this.species,
      required this.breed,
      required this.age,
      required this.sex,
      required this.color,
      required this.weight,
      required this.dob,
      required this.microchipid,
      required this.aid,
      required this.diet,
      required this.behaviour,
      required this.notes,
      required this.status,
      required this.photo,
      required this.price,
      required this.addeddate});

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
        petid: json['petid'],
        name: json['Name'],
        species: json['Species'],
        breed: json['breed'],
        age: json['age'],
        sex: json['sex'],
        color: json['color'],
        weight: json['weight'],
        dob: json['dob'],
        microchipid: json['microchipid'],
        aid: json['aid'],
        diet: json['diet'],
        behaviour: json['behaviour'],
        notes: json['notes'],
        status: json['status'],
        photo: json['photo'],
        price: json['price'],
        addeddate: json['addeddate']);
  }
}
