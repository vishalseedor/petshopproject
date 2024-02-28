import 'package:flutter/material.dart';
import 'package:pet_shop/ExtraScreens/errorscreen.dart';
import 'package:pet_shop/ExtraScreens/loadingscreen.dart';
import 'package:pet_shop/screens/PetFavouriteScreen/provider/petfavprovider.dart';
import 'package:provider/provider.dart';


class AllFavouritesScreen extends StatefulWidget {
  static const routeName = 'all_favourites_screen';

  const AllFavouritesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllFavouritesScreen> createState() => _AllFavouritesScreenState();
}

class _AllFavouritesScreenState extends State<AllFavouritesScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of<PetProvider>(context, listen: false)
    //     .get(context: context, categoryproduct: widget.cateproduct);
    Provider.of<FavouriteProvider>(context, listen: false)
        .getAllFavouritesData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final favourites = Provider.of<FavouriteProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.grey[200],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Favourites',
                style: TextStyle(fontSize: 14),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        body: favourites.islOading
            ? const LoadingScreen(
                title: 'Loading...',
              )
            : favourites.isError
                ? ErrorScreen(title: favourites.isError.toString())
                : favourites.favourites.isEmpty
                    ? const Text(
                        'No Products ',
                      )
                    : favourites.favourites.isEmpty
                        ? const Center(child: Text("No Products"))
                        : ListView.builder(
                            itemCount:  favourites.favourites.length,
                            itemBuilder: (ctx, index) {
                              print(favourites.favourites.length.toString());
                              // return ChangeNotifierProvider.value(
                              //     value: pet.pets[index],
                              //     child: const AllPetWidget());
                            }),
      ),
    );
  }
}
