
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pet_shop/ExtraScreens/loadingscreen.dart';
import 'package:pet_shop/Helpers/Colors/colors.dart';
import 'package:pet_shop/Helpers/Images/images.dart';
import 'package:pet_shop/screens/AdoptionCartScreen/pages/adoptioncartscreen.dart';
import 'package:pet_shop/screens/BottomNavigationScreen/bottomnavigtionprovider.dart';
import 'package:pet_shop/screens/LoginScreen/loginscreen.dart';
import 'package:pet_shop/screens/PetViewScreen/provider/petprovider.dart';
import 'package:pet_shop/screens/PetViewScreen/widgets/petwidget.dart';
import 'package:provider/provider.dart';


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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pet = Provider.of<PetProvider>(context);
    final navigation=Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor:purpleColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pets ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),
          
            const Text(
              'Trivandrum. India',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12,color: Colors.white),
            )
          ],
        ),
        actions: [
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(icon: const Icon(IconlyBold.bag,color: Colors.white,),onPressed: (){
           Navigator.push(context,MaterialPageRoute(builder:(context)=>const AdoptionScreen()));
          }),
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
              leading: const Icon(IconlyLight.home),
              title: const Text('Dashboard'),
              onTap: () {
                navigation.currentIndex=0;
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const PetViewScreen()));
              },
            ),
            const ListTile(
              leading: Icon(IconlyLight.shieldDone),
              title: Text('Adoption'),
            ),
            ListTile(
              leading: const Icon(IconlyLight.addUser),
              title: const Text('Pet Adoption Evnent'),
              onTap: () {
               
              },
            ),
            ListTile(
              leading: const Icon(IconlyLight.heart),
              title: const Text('Favourites'),
              onTap: () {
               
              },
            ),
            const ListTile(
              leading: Icon(IconlyLight.bookmark),
              title: Text('Bookes Evnts'),
            ),
            const ListTile(
              leading: Icon(IconlyLight.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: const Icon(IconlyLight.profile),
              title: const Text('Profile'),
              onTap: () {
            
              },
            ),
            ListTile(
              leading: const Icon(IconlyLight.logout),
              title: const Text('Logout'),
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
                                    builder: (context) => const LoginPage()));
                          },
                          child: Text(
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
                          child: Text(
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
            children: [
              TextField(
                controller: searchController,
                onChanged: (value) {
                  
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none),
                    hintText: 'Search',
                    prefixIcon: const Icon(IconlyLight.search),
                   
                    fillColor: Colors.white.withOpacity(0.4),
                    filled: true),
              ),
               SizedBox(height: size.height*0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: purpleColor),
                      color:purpleColor,
                    ),
                    child: Image.asset(categoryDogImage, scale: 10,color: Colors.white,),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                       border: Border.all(color: purpleColor),
                      color: purpleColor,
                    ),
                    child: Image.asset(categoryCatImage, scale: 13,color: Colors.white),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                       border: Border.all(color: purpleColor),
                      color: purpleColor,
                    ),
                    child: Image.asset(categoryHorseImage, scale: 12,color: Colors.white,),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                       border: Border.all(color: purpleColor,width: 2),
                      color: purpleColor,
                    ),
                    child: Image.asset(categoryRabbitImage, scale: 12,color: Colors.white,),
                  ),
                ],
              ),
              SizedBox(
                height: size.height*0.02,
              ),
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
                        ))
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
