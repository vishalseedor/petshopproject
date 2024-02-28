

import 'package:pet_shop/screens/AdoptionCartScreen/provider/adoptioncartprovider.dart';
import 'package:pet_shop/screens/AdoptionCartScreen/provider/adoptionprovider.dart';
import 'package:pet_shop/screens/BottomNavigationScreen/bottomnavigtionprovider.dart';
import 'package:pet_shop/screens/PetFavouriteScreen/provider/petfavprovider.dart';
import 'package:pet_shop/screens/PetViewScreen/provider/petprovider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> multiprovider = [
  ChangeNotifierProvider(create: (context) => PetProvider()),
  ChangeNotifierProvider(create: (context) => FavouriteProvider()),
  ChangeNotifierProvider(create: (context) => AdoptionProvider()),
  ChangeNotifierProvider(create: (context)=> AdoptionCartProvider()),
  ChangeNotifierProvider(create: (context)=>BottomNavigationBarProvider())
];
