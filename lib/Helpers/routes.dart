import 'package:flutter/material.dart';
import 'package:pet_shop/screens/AdoptionCartScreen/pages/alladoptioncart.dart';
import 'package:pet_shop/screens/PetFavouriteScreen/pages/allpetfavouitescreen.dart';
import 'package:pet_shop/screens/PetViewScreen/pages/allpetscreen.dart';
import 'package:pet_shop/screens/PetViewScreen/pages/petdetailsscreen.dart';

var customRoutes = <String, WidgetBuilder>{
    'all_pet_screen': (context) => const AllPetScreen(),
         'pets_details_screen': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return PetDetailsScreen(
      id: id,
    );
  },
  'all_favourites_screen':(context) => AllFavouritesScreen(),
  'all_petadoption_screen':(context) => AllAdoptionScreen()
};
