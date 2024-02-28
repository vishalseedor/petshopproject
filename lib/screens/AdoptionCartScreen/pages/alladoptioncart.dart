import 'package:flutter/material.dart';
import 'package:pet_shop/ExtraScreens/errorscreen.dart';
import 'package:pet_shop/ExtraScreens/loadingscreen.dart';
import 'package:pet_shop/screens/AdoptionCartScreen/provider/adoptionprovider.dart';
import 'package:provider/provider.dart';


class AllAdoptionScreen extends StatefulWidget {
  static const routeName = 'all_petadoption_screen';

  const AllAdoptionScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllAdoptionScreen> createState() => _AllAdoptionScreenState();
}

class _AllAdoptionScreenState extends State<AllAdoptionScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AdoptionProvider>(context, listen: false)
        .getAllAdoptionData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final adoption= Provider.of<AdoptionProvider>(context);
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
                'Products',
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
        body: adoption.islOading
            ? const LoadingScreen(
                title: 'Loading...',
              )
            : adoption.isError
                ? ErrorScreen(title:adoption.isError.toString())
                : adoption.adoptions.isEmpty
                    ? const Text(
                        'No Carts ',
                      )
                    :adoption.adoptions.isEmpty
                        ? const Center(child: Text("No Carts"))
                        : ListView.builder(
                            itemCount: adoption.adoptions.length,
                            itemBuilder: (ctx, index) {
                              print(adoption.adoptions.length.toString());
                              // return ChangeNotifierProvider.value(
                              //     value: pet.pets[index],
                              //     child: const AllPetWidget());
                            }),
      ),
    );
  }
}
