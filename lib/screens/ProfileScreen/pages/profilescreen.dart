import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pet_shop/Helpers/Colors/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.arrow_back,color: Colors.white,),
        backgroundColor: purpleColor,
        title: const Text('Profile',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
         Container(height: 200,width: double.infinity,decoration: BoxDecoration(color: purpleColor,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
          Stack(
  children: [
    CircleAvatar(
      backgroundColor: Color(0xff00A3FF),
      backgroundImage: AssetImage("assets/profile.png"),
      radius: 60.0,
    ),
    Positioned(
      right: 5,
      bottom: 0,
      child: Container(
        child: Icon(Icons.camera_alt_outlined,color: Colors.black,size: 20,),
        padding: EdgeInsets.all(7.5),
        decoration: BoxDecoration(
          border: Border.all(
          width: 1,
          color: Colors.white
        ),
        borderRadius: BorderRadius.circular(90.0),
        color: Colors.grey[200]
        )
      )
    )
  ]
),
           Text('Bosco Willaiam',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
           Text('+918870120688',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12),)
         ],
       ),
         ),
         SizedBox(height: 30,),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
               
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Email',style: TextStyle(fontWeight: FontWeight.w900),),
                      Text('william@gmail.com')
                    ],
                  ),
                   SizedBox(height: 20),
                
                   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date of Birth',style: TextStyle(fontWeight: FontWeight.w900)),
                      Text('william@gmail.com')
                    ],
                  ),
                    SizedBox(height: 20),
                
                   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gender',style: TextStyle(fontWeight: FontWeight.w900)),
                      Text('Male')
                    ],
                  ),
                    SizedBox(height: 20),
               
                   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phone',style: TextStyle(fontWeight: FontWeight.w900)),
                      Text('+918870120688')
                    ],
                  )
                ],
                
              ),
            ),
           ),
          
         ),
         SizedBox(height: 20),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
              child: Row(
               
                children: [
                  Icon(IconlyLight.lock,color: Colors.red,),
                  SizedBox(width: 20),
                  Text('Change Password',style: TextStyle(fontWeight: FontWeight.w900),)
                ],
              ),
            ),
           ),
         ),
            SizedBox(height: 10),
          Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
              child: Row(
               
                children: [
                  Icon(IconlyLight.bookmark,color: Colors.blue,),
                  SizedBox(width: 20),
                  Text('My Orders',style: TextStyle(fontWeight: FontWeight.w900),)
                ],
              ),
            ),
           ),
         ),
            SizedBox(height: 10),
          Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
              child: Row(
               
                children: [
                  Icon(IconlyLight.shieldDone,color: Colors.green),
                  SizedBox(width: 20),
                  Text('Help',style: TextStyle(fontWeight: FontWeight.w900),)
                ],
              ),
            ),
           ),
         )
        ],
      ),
    );
  }
}