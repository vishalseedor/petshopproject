import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pet_shop/Helpers/Colors/colors.dart';
import 'package:pet_shop/screens/PetFavouriteScreen/pages/petfavoutitescreen.dart';
import 'package:pet_shop/screens/PetFavouriteScreen/provider/petfavprovider.dart';
import 'package:pet_shop/screens/PetViewScreen/pages/globalsnackbar.dart';
import 'package:pet_shop/screens/PetViewScreen/pages/productsnackbar.dart';
import 'package:pet_shop/screens/PetViewScreen/provider/petprovider.dart';
import 'package:pet_shop/screens/ProfileScreen/provider/userprovider.dart';


import 'package:provider/provider.dart';
class PetDetailsScreen extends StatefulWidget {
  static const routeName = 'pets_details_screen';
  final String id;
  const PetDetailsScreen({super.key,required this.id});

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
   bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
  GlobalSnackBar _snackBar =GlobalSnackBar();
  ProductSnackBar _productSnackBar=ProductSnackBar();
    final size=MediaQuery.of(context).size;
       final pets = Provider.of<PetProvider>(context,listen: false);
      
        final favpet=Provider.of<FavouriteProvider>(context,listen: false);
        final user=Provider.of<UserProvider>(context,listen: false);
      final petData =
        Provider.of<PetProvider>(context).pets.firstWhere((element) => element.petId == widget.id);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(onPressed: (){
         Navigator.pop(context); 
        }, icon:const Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: purpleColor,
        title: const Text('Pet Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
          height: 270,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(petData.petImage),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
              SizedBox(height: size.height*0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(petData.petName,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 18),),
                  Text(petData.petspeciesName,style: TextStyle(color: purpleColor,fontWeight: FontWeight.w900,fontSize: 18),),
                  
                ],
              ),
              Row(
                children: [
                  Icon(LineIcons.dog,color: purpleColor),
                  SizedBox(width: size.width*0.02),
                  Text('Breed Name :${petData.petBreed}')
                ],
              ),
             SizedBox(height: size.height*0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height*0.09,
                width: size.width*0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Age',style: TextStyle(color:purpleColor,fontWeight: FontWeight.w900),),
                      Text('${petData.petAge} Years',style: const TextStyle(fontWeight: FontWeight.w500),)
                    ],
                  ),
                  ),
                   Container(
                height: size.height*0.09,
                width: size.width*0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),color: Colors.white
              ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Gender',style: TextStyle(color:purpleColor,fontWeight: FontWeight.w900),),
                      Text(petData.petSex,style: TextStyle(fontWeight: FontWeight.w500),)
                    ],
                  ),
              ),
               Container(
               height: size.height*0.09,
                width: size.width*0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),color: Colors.white
              ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Weight',style: TextStyle(color:purpleColor,fontWeight: FontWeight.w900),),
                      Text(petData.petWeight,style: const TextStyle(fontWeight: FontWeight.w500),)
                    ],
                  ),
              ),
                ],
              ),
              SizedBox(height: size.height*0.02),
              Text('Pet Color : ${petData.petcolor}',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: size.height*0.01),
                 Text('Pet Diet : ${petData.petdiet}',style: TextStyle(fontWeight: FontWeight.bold),),
                   SizedBox(height: size.height*0.01),
                    Text('Pet Behavoiur : ${petData.petbehaveier}',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: size.height*0.01),       
              const Text('Description',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 17),),
               SizedBox(height: size.height*0.01),
              Text(petData.petnotes),
             SizedBox(height: size.height*0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               Container(
     height: size.height*0.07,
                  width: size.width*0.16,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: purpleColor),
      ),
      child: IconButton(
        onPressed: ()async {
         favpet.addItemToFavourites(petid: petData.petId.toString(),userid: user.currentUserId.toString());
            SnackBar(backgroundColor: purpleColor,content: const Text('Item add to favourite successfully'),duration: const Duration(seconds: 4),);
         await Navigator.push(context,MaterialPageRoute(builder: (context)=>const PetFavouritePage()));
          
        },
        icon: const Icon(
        Icons.favorite,color: Colors.red,
        ),
      ),
    ),
                  InkWell(
                    onTap: () async{
                      

                     SnackBar(backgroundColor: purpleColor,content: const Text('Adoption pet successfully'),duration: const Duration(seconds: 4),);
                 //   await  Navigator.push(context,MaterialPageRoute(builder: (context)=>const AdoptionNowScreen()));

                       
                      
    //                    petcartapi.addItemToCart(petid: petData.petId,quanity:'0'); 
    //                           ScaffoldMessenger.of(context).showSnackBar(
    //    SnackBar(
    //     backgroundColor: purpleColor,
    //     content: const Text('Item added to cart successfully!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
    //     duration: const Duration(seconds: 4),
    //   ),
    // );
    //                        await Navigator.push(context,MaterialPageRoute(builder: (context)=> AdoptionScreen()));
                    },
                    child: Container(
                     height: size.height*0.07,
                     width: size.width*0.65,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.circular(10)),
                      child:  Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Image.asset('assets/cart.png',height: 30,width: 30),
                          SizedBox(width: size.width*0.04),
                          const Text('Add to Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                        ],
                      )),
                                       ),
                  ),
                ],
              )
               
              
            ],
          ),
        ),
      ),
    );
  }
}