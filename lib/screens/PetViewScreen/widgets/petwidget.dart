import 'package:flutter/material.dart';
import 'package:pet_shop/Helpers/Colors/colors.dart';
import 'package:pet_shop/screens/PetViewScreen/pages/petdetailsscreen.dart';


class AllPetWidget extends StatefulWidget {
  final String petid;
  final String petImage;
  final String name;
  final String breed;
  final String age;
  final String gender;
  final String species;
 

  const AllPetWidget(
      {super.key,
      required this.petid,
      required this.petImage,
      required this.name,
      required this.breed,
      required this.age,
      required this.gender,
      required this.species,
    
      });

  @override
  State<AllPetWidget> createState() => _AllPetWidgetState();
}

class _AllPetWidgetState extends State<AllPetWidget> {
  bool isFavourirte=false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final pet = Provider.of<PetModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: InkWell( 
              onTap: () {
      //            Navigator.of(context).pushNamed(
      // PetDetailsScreen.routeName,
      // arguments: widget.petid);
              Navigator.of(context).pushNamed(PetDetailsScreen.routeName,arguments:widget.petid);
              },
              child: Container(
                  height: 150,
            width: 130,
                decoration: BoxDecoration(
                     image: DecorationImage(image: NetworkImage(widget.petImage),fit: BoxFit.cover),
                   
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))),
             
              ),
            ),
          ),
          Container(
            height: 150,
            width: 190,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Text(
                      widget.name.substring(0,16),
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.fade,
                    ),
                     
                    ],
                  ),
                   Text(widget.gender),
                  Text(
                    widget.species,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '${widget.age} Years',
                    style: TextStyle(color: Colors.black),
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/adopt.png',height: 25,width: 25),
                      SizedBox(width: size.width*0.03),
                      Text(widget.breed)
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.2,
          )
        ],
      ),
    );
  }
}
