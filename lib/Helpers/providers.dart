

import 'package:pet_shop/screens/AdoptionCartScreen/provider/adoptionprovider.dart';
import 'package:pet_shop/screens/BottomNavigationScreen/bottomnavigtionprovider.dart';
import 'package:pet_shop/screens/CategoryScreen/provider/categoryeachprovider.dart';
import 'package:pet_shop/screens/CategoryScreen/provider/categoryprovider.dart';
import 'package:pet_shop/screens/PetFavouriteScreen/provider/petfavprovider.dart';
import 'package:pet_shop/screens/PetViewScreen/provider/petprovider.dart';
import 'package:pet_shop/screens/ProfileScreen/provider/feedbackprovider.dart';
import 'package:pet_shop/screens/ProfileScreen/provider/userprovider.dart';
import 'package:pet_shop/screens/ViewEventScreen/provider/eventprovider.dart';
import 'package:pet_shop/screens/ViewOrdersScreen/provider/orderprovider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> multiprovider = [
  ChangeNotifierProvider(create: (context) => PetProvider()),
  ChangeNotifierProvider(create: (context) => FavouriteProvider()),
  ChangeNotifierProvider(create: (context)=>BottomNavigationBarProvider()),
  ChangeNotifierProvider(create: (context)=>CategoryProvider()),
  ChangeNotifierProvider(create: (context)=>CategoryEachProvider()),
  ChangeNotifierProvider(create: (context)=>OrderProvider()),
  ChangeNotifierProvider(create: (context)=>UserProvider()),
  ChangeNotifierProvider(create: (context)=>EventProvider()),
  ChangeNotifierProvider(create: (context)=>FeedbackProvider()),
  ChangeNotifierProvider(create: (context)=>AdoptionProvider())
];
