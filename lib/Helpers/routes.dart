



import 'package:flutter/material.dart';

import 'package:pet_shop/screens/AdoptionCartScreen/pages/alladoptioncart.dart';
import 'package:pet_shop/screens/CategoryScreen/pages/categoryscreen.dart';
import 'package:pet_shop/screens/CategoryScreen/pages/petcategoryscreen.dart';
import 'package:pet_shop/screens/PetFavouriteScreen/pages/petfavoutitescreen.dart';
import 'package:pet_shop/screens/PetViewScreen/pages/allpetscreen.dart';
import 'package:pet_shop/screens/PetViewScreen/pages/petdetailsscreen.dart';
import 'package:pet_shop/screens/ViewEventScreen/pages/eventscreen.dart';
import 'package:pet_shop/screens/ViewEventScreen/pages/peteventdetailsscreen.dart';
import 'package:pet_shop/screens/ViewOrdersScreen/pages/myordersscreen.dart';



var customRoutes = <String, WidgetBuilder>{
    'all_pet_screen': (context) => const AllPetScreen(),
         'pets_details_screen': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return PetDetailsScreen(
      id: id,
    );
  },
 'event_details_screen': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return EventDetailsScreen(
      id: id,
    );
  },
  'all_favourites_screen':(context) => PetFavouritePage(),
   'all_petadoption_screen':(context)=>AllAdoptionScreen(),

  'all_category_screen':(context) => CategoryScreen(),
 'all_orders_screen':(context) => MyOrdersScreen(),
   'event_screen':(context)=>EventScreen(),
   'all_categoryproduct_screen': (context) {
    var data = ModalRoute.of(context)!.settings.arguments;
    if (data is String) {
      return PetCategoryScreen(cate: data);
    } else if (data is Map<String, dynamic>) {
      return PetCategoryScreen(cate: data['category_id']);
    } else {
      print('Unexpected argument type: ${data.runtimeType}');
      return const Scaffold(
        body: Center(
          child: Text(''),
        ),
      );
    }
  },
};
