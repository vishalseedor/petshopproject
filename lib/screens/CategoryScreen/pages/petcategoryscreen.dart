import 'package:flutter/material.dart';
import 'package:pet_shop/ExtraScreens/loadingscreen.dart';
import 'package:pet_shop/Helpers/Colors/colors.dart';
import 'package:pet_shop/screens/CategoryScreen/pages/categoryemptyscreen.dart';
import 'package:pet_shop/screens/CategoryScreen/provider/categoryeachprovider.dart';
import 'package:pet_shop/screens/CategoryScreen/widgets/petcategorywidget.dart';



import 'package:provider/provider.dart';

class PetCategoryScreen extends StatefulWidget {
   static const routeName = 'all_categoryproduct_screen';
  final String cate;
  const PetCategoryScreen({super.key,required this.cate});

  @override
  State<PetCategoryScreen> createState() => _PetCategoryScreenState();
}

class _PetCategoryScreenState extends State<PetCategoryScreen> {
   @override
  void initState() {
    Provider.of<CategoryEachProvider>(context, listen: false)
        .getAllPetCategoryData(context: context,categoryId: widget.cate);
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final petcategory= Provider.of<CategoryEachProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: purpleColor,
        title: Text('Category List Pets',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height*0.02),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Category Pets Nears You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: petcategory.loadingSpinner
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
                        : petcategory.petcategory.isEmpty
                            ?const CategoryEmptyScreen()
                            : SizedBox(
                              //  height: size.height * 0.6,
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.93),
                                  scrollDirection: Axis.vertical,
                                  itemCount: petcategory.petcategory.length,
                                  itemBuilder: (context, intex) {
                                    return AllPetCategoryWidget(
                                       id: petcategory.petcategory[intex].petid,
                                       name: petcategory.petcategory[intex].name,
                                       image: petcategory.petcategory[intex].photo,
                                    
                                    );
                                  },
                                ),
                              ),
          ),
        ],
      ),     
    );
  }
}