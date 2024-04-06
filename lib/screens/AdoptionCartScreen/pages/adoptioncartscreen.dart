import 'package:flutter/material.dart';
import 'package:pet_shop/ExtraScreens/loadingscreen.dart';
import 'package:pet_shop/Helpers/Colors/colors.dart';
import 'package:pet_shop/screens/AdoptionCartScreen/provider/adoptionprovider.dart';
import 'package:pet_shop/screens/AdoptionCartScreen/widget/alladoptionwidget.dart';

import 'package:provider/provider.dart';


class AdoptionScreen extends StatefulWidget {
    static const routeName = 'adoption_screen';


  const AdoptionScreen({Key? key,}) : super(key: key);

  @override
  State<AdoptionScreen> createState() => _AdoptionScreenState();
}

class _AdoptionScreenState extends State<AdoptionScreen> {
  
   @override
  void initState() {
    Provider.of<AdoptionProvider>(context, listen: false)
        .getAllAdoptionData(context: context);
  
    super.initState();
  }
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
     final adoption = Provider.of<AdoptionProvider>(context);
    
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        backgroundColor:purpleColor,
         leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Center(
          child: Text(
            'Adoption Cart',
            style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
            height: size.height*0.04,
            width: size.width*0.23,
           
            child: Center(child: Text('Clear',style: TextStyle(color: purpleColor,fontWeight: FontWeight.w900),)),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
            
            
           ),
         )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height*0.02),
                  adoption.loadingSpinner
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
                : adoption.adoptions.isEmpty
                    ? const Center(child: Text('hhhh'),)
                    : SizedBox(
                       height: size.height * 0.8,
                        child: ListView.builder(
                        
                          scrollDirection: Axis.vertical,
                          itemCount:adoption.adoptions.length,
                          itemBuilder: (context, intex) {
                            return AllAdoptionWidget(
                              breedname: adoption.adoptions[intex].breed,
                              cartid: adoption.adoptions[intex].cartid,
                              productid: adoption.adoptions[intex].addeddate,
                              name:adoption.adoptions[intex].name,
                              price: adoption.adoptions[intex].petid,
                              image: adoption.adoptions[intex].photo,
                              quantity:adoption.adoptions[intex].quantity,
                              itemtotal:adoption.adoptions[intex].age,
                           
  
                            
                            );
                            
                          },
                        ),
                      ),       
                  
              
          
                ],
              ),
            ),
          ),
        
 
        ],
      ),
    );
  }
 
}