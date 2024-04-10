import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pet_shop/ExtraScreens/loadingscreen.dart';
import 'package:pet_shop/screens/AdoptionCartScreen/pages/adoptioncartscreen.dart';
import 'package:pet_shop/screens/CategoryScreen/pages/categoryscreen.dart';
import 'package:pet_shop/screens/CategoryScreen/provider/categoryprovider.dart';
import 'package:pet_shop/screens/CategoryScreen/widgets/frontcategorywidget.dart';
import 'package:pet_shop/screens/LoginScreen/loginscreen.dart';
import 'package:pet_shop/screens/PetFavouriteScreen/pages/petfavoutitescreen.dart';
import 'package:pet_shop/screens/PetViewScreen/provider/petprovider.dart';
import 'package:pet_shop/screens/PetViewScreen/widgets/petwidget.dart';
import 'package:pet_shop/screens/ProfileScreen/pages/profilescreen.dart';
import 'package:pet_shop/screens/ProfileScreen/pages/supportscreen.dart';
import 'package:pet_shop/screens/ProfileScreen/provider/userprovider.dart';
import 'package:pet_shop/screens/ViewEventScreen/pages/eventscreen.dart';
import 'package:pet_shop/screens/ViewOrdersScreen/pages/myordersscreen.dart';
import 'package:provider/provider.dart';
import '../../../Helpers/Colors/colors.dart';


class PetViewScreen extends StatefulWidget {

const PetViewScreen({super.key});

  @override
  State<PetViewScreen> createState() => _PetViewScreenState();
}

class _PetViewScreenState extends State<PetViewScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Provider.of<PetProvider>(context, listen: false)
        .getAllPetsData(context: context);
   
    Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategoryData(context: context);

    Provider.of<UserProvider>(context,listen: false).getUsertData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pet = Provider.of<PetProvider>(context);
    final category=Provider.of<CategoryProvider>(context);
    //final navigation=Provider.of<BottomNavigationBarProvider>(context);
    final userprovider=Provider.of<UserProvider>(context,listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor:purpleColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pets Adoption ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),
          
         Consumer<UserProvider>(builder: (context, value, child) {
                String userAddress = "";
                for (var i = 0; i < value.users.length; i++) {
                  userAddress = value.users[i].address;
                }
                return Text(
                  '$userAddress , India',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w900),
                );
              }),
          ],
        ),
        actions: [
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap:(){
             Navigator.push(context,MaterialPageRoute(builder:(context)=>const AdoptionScreen()));
            } ,
            child: Image.asset('assets/addcart.png',height: 35,width: 35))
        )
        ],
      ),
      
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: purpleColor),
                currentAccountPicture: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                accountName: const Text(
                  'Vishal',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: const Text(
                  'vishal123@gmail.com',
                  style: TextStyle(fontWeight: FontWeight.w400),
                )),
            ListTile(
              leading:  Icon(IconlyBold.home,color: purpleColor,),
              title: const Text('Dashboard',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
              onTap: () {
               
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PetViewScreen()));
              },
            ),
             InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>const CategoryScreen()));
              },
               child: ListTile(
                leading: Icon(Icons.pets,color: purpleColor,),
                title: const Text('Categories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                           ),
             ), 
           
          InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>const PetFavouritePage()));
              },
               child: ListTile(
                leading: Icon(IconlyBold.heart,color: purpleColor,),
                title: const Text('My Favourites',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                           ),
             ),
              InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>const MyOrdersScreen()));
              },
               child: ListTile(
                leading: Icon(IconlyBold.heart,color: purpleColor,),
                title: const Text('My Orders',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                           ),
             ),
             InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>const EventScreen()));
              },
               child: ListTile(
                leading: Icon(IconlyBold.paper,color: purpleColor,),
                title: const Text('Pet Events',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                           ),
             ),
             InkWell(
                onTap: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>const SupportScreen()));
              },
               child: ListTile(
                leading: Icon(IconlyBold.message,color: purpleColor,),
                title: const Text('Feedback',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                           ),
             ),
            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>const ProfilePage()));
              },
              child: ListTile(
                leading:  Icon(IconlyBold.profile,color: purpleColor,),
                title: const Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                onTap: () {
              
                },
              ),
            ),
            ListTile(
              leading:  Icon(IconlyBold.logout,color: purpleColor,),
              title: const Text('Logout',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Logout',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content:
                          const Text('Are you sure want to exit this app?'),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: purpleColor),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: purpleColor),
                          onPressed: () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(
                               fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),borderSide: BorderSide.none
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                     // size: 17,
                    ),
                    hintText: "Search ",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                       fontSize: 14,
                        fontWeight: FontWeight.w600),
                 
                 
                  ),
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    if (value != "") {
                      String searchQuery = value.toLowerCase();
                      print("hhhhhhhhh");
                      pet.getSearchData(value: searchQuery);
                    }
                  },
                ),
               SizedBox(height: size.height*0.02),
               const Text('Categories',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: size.height*0.02),
               category.loadingSpinner
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const LoadingScreen(title: 'Loading'),
                          CircularProgressIndicator(
                            color:purpleColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                       
                        ],
                      )
                    : category.category.isEmpty
                        ? Center(
                            child: Text(
                            'No Categories...',
                            style: TextStyle(color:purpleColor),
                          ))
                        : SizedBox(
                            height: size.height * 0.07,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: category.category.length,
                              itemBuilder: (context, intex) {
                                return FrontCategoryWidegt(
                                  id: category.category[intex].id,
                                  image: category.category[intex].image,
                                 
                                );
                              },
                            ),
                          ),
                     
              SizedBox(
                height: size.height*0.03,
              ),
              Text('Popular Pets Nears You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              pet.loadingSpinner
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LoadingScreen(title: 'Loading'),
                        CircularProgressIndicator(
                          color: purpleColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                     
                      ],
                    )
                  : pet.pets.isEmpty
                      ? Center(
                          child: Text(
                          'No Pets...',
                          style: TextStyle(color: purpleColor),
                        )):pet.searchProducts.isEmpty&&
                        searchController.text.isNotEmpty?Center(
                          child: Text('No Pets Avilable',style: TextStyle(color: purpleColor),),):
                          searchController.text.isNotEmpty&&
                          pet.searchProducts.isNotEmpty?
                          SizedBox(
                          height: size.height * 0.6,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: pet.searchProducts.length,
                            itemBuilder: (context, intex) {
                              return AllPetWidget(
                                petid: pet.searchProducts[intex].petId,
                                name: pet.searchProducts[intex].petName,
                                age: pet.searchProducts[intex].petAge,
                                breed: pet.searchProducts[intex].petBreed,
                                petImage: pet.searchProducts[intex].petImage,
                                gender: pet.searchProducts[intex].petSex,
                                species: pet.searchProducts[intex].petspeciesName,
                                price: pet.searchProducts[intex].price,
                              );
                            },
                          ),
                        )


                      : SizedBox(
                          height: size.height * 0.6,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: pet.pets.length,
                            itemBuilder: (context, intex) {
                              return AllPetWidget(
                                petid: pet.pets[intex].petId,
                                name: pet.pets[intex].petName,
                                age: pet.pets[intex].petAge,
                                breed: pet.pets[intex].petBreed,
                                petImage: pet.pets[intex].petImage,
                                gender: pet.pets[intex].petSex,
                                species: pet.pets[intex].petspeciesName,
                                price: pet.pets[intex].price,
                              );
                            },
                          ),
                        ),          
           
            ],
          ),
        ),
      ),
    );
  }
}
