
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
  final String notes;
  final String sex;

 

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
      required this.notes,
      required this.sex

     
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
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 130,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            elevation: 0.1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 90,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.image),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name.substring(0,16),
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 2),
                        Text(
                          widget.breedname,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                       
                       const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '₹ : ${widget.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: purpleColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                            onPressed: (){
                                adoption.deleteCart(widget.cartid, context);
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
                          ), 
                        );
                            }, child:Row(
                              
                            children: [
                              Icon(Icons.delete,color: Colors.white,),
                              SizedBox(width: size.width*0.02),
                              Text('Delete',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                            ],
                          ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );

    
  }
}

