import 'package:flutter/material.dart';
import 'package:pet_shop/Helpers/Colors/colors.dart';
import 'package:pet_shop/screens/PetFavouriteScreen/provider/petfavprovider.dart';
import 'package:pet_shop/screens/PetFavouriteScreen/widgets/petfavwidget.dart';
import 'package:provider/provider.dart';
import '../../../ExtraScreens/loadingscreen.dart';

class PetFavouritePage extends StatefulWidget { 
  const PetFavouritePage({super.key});

  @override
  State<PetFavouritePage> createState() => _PetFavouritePageState();
}

class _PetFavouritePageState extends State<PetFavouritePage> {
    @override
  void initState() {
    Provider.of<FavouriteProvider>(context, listen: false)
        .getAllFavouritesData(context: context);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final favpet=Provider.of<FavouriteProvider>(context);
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        // ignore: prefer_const_constructors
        },icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: purpleColor,
        title: const Text('Favouitres',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    body:favpet.loadingSpinner
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingScreen(title: 'Loading'),
                        CircularProgressIndicator(
                          color:Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                     
                      ],
                    )
                  : favpet.favourites.isEmpty
                      ? const Center(
                          child: Text(
                          'No Pets...',
                          style: TextStyle(color:Colors.green),
                        ))
                      : SizedBox(
                         // height: size.height * 0.6,
                          child: GridView.builder(
            itemCount: favpet.favourites.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.98,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return AllFavouriteWidget(
                id: favpet.favourites[index].petid,
                name: favpet.favourites[index].name,
                image: favpet.favourites[index].photo,
                breedname: favpet.favourites[index].breed,
                );
            },
          )
                        ),  
    );
  }
}