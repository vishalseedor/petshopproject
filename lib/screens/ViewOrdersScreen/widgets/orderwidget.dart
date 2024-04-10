import 'package:flutter/material.dart';
import 'package:pet_shop/Helpers/Colors/colors.dart';

class AllOrdersWidget extends StatefulWidget {
  final String orderid;
  final String petid;
  final String petname;
  final String totalAmount;
  final String date;
  final String image;
  final String species;
  final String breed;
  final String purchaseType;



  const AllOrdersWidget({super.key,required this.orderid,required this.petid,required this.petname,
  required this.totalAmount,required this.date,required this.image,required this.breed,required this.species,required this.purchaseType});

  @override
  State<AllOrdersWidget> createState() => _AllOrdersWidgetState();
}

class _AllOrdersWidgetState extends State<AllOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover),borderRadius: BorderRadius.circular(10)
                ),
              ),
              SizedBox(width: 25),
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.petname.substring(0,16),style: TextStyle(color: purpleColor,fontSize: 15,fontWeight: FontWeight.bold),),
                  SizedBox(height: size.height*0.01),
                  Text(widget.breed,style: TextStyle(fontWeight: FontWeight.w400),),
                   SizedBox(height: size.height*0.01),
                  Text(widget.species),
                   SizedBox(height: size.height*0.01),
                  Container(
                    height: 30,
                    width: 65,
                   
                    decoration: BoxDecoration( color:purpleColor,borderRadius: BorderRadius.circular(8)),
                    child:  Center(child: Text(widget.purchaseType,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                  )
                 

                 
                  
                ],
              ),
                
            ],
          ),
        ),
      )
    ); 
  }
}