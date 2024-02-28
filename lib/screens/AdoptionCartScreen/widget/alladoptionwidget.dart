import 'package:flutter/material.dart';
import 'package:pet_shop/Helpers/Colors/colors.dart';
import 'package:pet_shop/screens/AdoptionCartScreen/provider/adoptionprovider.dart';
import 'package:provider/provider.dart';


class AllAdoptionWidget extends StatefulWidget {
  final String cartid;
  final String productid;
  final String name;
  final String image;
  final String quantity;
  final String price;
  final String itemtotal;
  final String breedname;

 

  const AllAdoptionWidget(
      {super.key,
      required this.cartid,
      required this.productid,
      required this.name,
      required this.image,
      required this.quantity,
      required this.price,
      required this.itemtotal,
      required this.breedname,
     
      });

  @override
  State<AllAdoptionWidget> createState() => _AllAdoptionWidgetState();
}

class _AllAdoptionWidgetState extends State<AllAdoptionWidget> {
  
  int quanity=1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final adoption = Provider.of<AdoptionProvider>(context);
    int itemTotal = int.parse(widget.price) * quanity;
    //  final pet = Provider.of<PetModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover)),
      
            ),
          //  SizedBox(width: size.width*0.1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
           
              children: [
              Text(widget.name.substring(0,9),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color: purpleColor),),
              SizedBox(height: size.height*0.01,),
              Text(widget.breedname,style: TextStyle(color:darkgreyColor,fontSize: 12,fontWeight: FontWeight.bold),),
                 SizedBox(height: size.height*0.01,),
              Text("₹ : ${widget.price}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
              ],
            ),
            IconButton(icon:Icon( Icons.delete,color: purpleColor,size: 30),
            onPressed: () {
                adoption.deleteCart(widget.cartid);
                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                           backgroundColor: purpleColor,
                           content: const Text(
                             'Cart item Deleted successfully!',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold),
                           ),
                           duration: const Duration(seconds: 4),
                         ));
            },
              
             )
      
          ],
        ),
      ),
    );

    
  }
}

