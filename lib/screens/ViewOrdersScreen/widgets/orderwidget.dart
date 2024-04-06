import 'package:flutter/material.dart';

class AllOrdersWidget extends StatefulWidget {
  final String orderid;
  final String petid;
  final String petname;
  final String totalAmount;
  final String date;
  final String image;
  final String species;
  final String breed;



  const AllOrdersWidget({super.key,required this.orderid,required this.petid,required this.petname,
  required this.totalAmount,required this.date,required this.image,required this.breed,required this.species});

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
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( widget.petname.substring(0,15)),
                SizedBox(height: size.height*0.01),// A
                Text(widget.totalAmount),
                SizedBox(height: size.height*0.01),// Add
                Text(widget.breed),
                 SizedBox(height: size.height*0.01),// Add
                Text(widget.species),
                  SizedBox(height: size.height*0.01),// Add
                Text(widget.date)
              ],
            ),
          ],
        ),
      ),
    ); 
  }
}