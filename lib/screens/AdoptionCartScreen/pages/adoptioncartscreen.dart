import 'package:flutter/material.dart';
import 'package:pet_shop/ExtraScreens/loadingscreen.dart';
import 'package:pet_shop/Helpers/Colors/colors.dart';
import 'package:pet_shop/screens/AdoptionCartScreen/pages/cartemptyscreen.dart';
import 'package:pet_shop/screens/AdoptionCartScreen/provider/adoptionprovider.dart';
import 'package:pet_shop/screens/AdoptionCartScreen/widget/alladoptionwidget.dart';
import 'package:pet_shop/screens/ProfileScreen/provider/userprovider.dart';

import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class AdoptionScreen extends StatefulWidget {
 


  const AdoptionScreen({Key? key,}) : super(key: key);

  @override
  State<AdoptionScreen> createState() => _AdoptionScreenState();
}

class _AdoptionScreenState extends State<AdoptionScreen> {
  
   @override
  void initState() {
   final userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<AdoptionProvider>(context, listen: false)
        .getAllAdoptionData(context: context, userid: userProvider.currentUserId);
  
    super.initState();
  }
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
     final adoption = Provider.of<AdoptionProvider>(context);
         final userData = Provider.of<UserProvider>(context);
    
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
       
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
        title: Text(
          ' Cart',
          style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
        ),
        actions: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: GestureDetector(
            onTap: () {
               adoption.clearCart(userid: userData.currentUserId); 
            },
             child: Container(
              height: size.height*0.04,
              width: size.width*0.23,
             
              child: Center(child: Text('Clear',style: TextStyle(color: purpleColor,fontWeight: FontWeight.w900),)),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
              
              
             ),
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
                    ? CartEmptyScreen()
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
                              notes: adoption.adoptions[intex].notes,
                              sex: adoption.adoptions[intex].sex,
                           
  
                            
                            );
                            
                          },
                        ),
                      ),       
                  
              
          
                ],
              ),
            ),
          ),
      adoption.adoptions.isEmpty?
      Text(''):
      Container(
            alignment: Alignment.bottomCenter,
            height: size.height * 0.12,
             decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.grey[400],
                      ),
            
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                   [
                     Text('Item Total',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                     SizedBox(height: size.height*0.01),
                  Text('₹ 4000',style: TextStyle(color: purpleColor,fontWeight: FontWeight.bold),)
                  ],
                 ),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: purpleColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                  onPressed: (){
                   Razorpay razorpay = Razorpay();
                                var options = {
                                  'key': 'rzp_test_1DP5mmOlF5G5ag',
                                  'amount': '100',
                                  'name': 'Pet Shop Execuation',
                                  'description': 'Fine T-Shirt',
                                  'retry': {'enabled': true, 'max_count': 1},
                                  'send_sms_hash': true,
                                  'prefill': {
                                    'contact': '8888888888',
                                    'email': 'test@razorpay.com'
                                  },
                                  'external': {
                                    'wallets': ['paytm']
                                  }
                                };
                                razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                                    handlePaymentErrorResponse);
                                razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                                    handlePaymentSuccessResponse);
                                razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                                    handleExternalWalletSelected);
                                razorpay.open(options);

                  }, child:Text('Place Order',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                ],
              ),
            ),
           
          )
        
 
        ],
      ),
    );
  }
  // Future<void>payment()async{
// try{
//   Map<String ,dynamic>body={

//     'amount':100.00,
//     'currency':'INR',

//   };
//   var response =await http.post(
//     Uri.parse('https://api.stripe.com/v1/payment_intents'),
//     headers:{
//       'Authorization':'Bearer',
//       'Content-type':'application/x-www-form-urlencoded'

//     }
//   );
//   paymentIntent=json.decode(response.body);
// }catch(error){
//   throw Exception(error);
// }
//  await Stripe.instance.initPaymentSheet(paymentSheetParameters:SetupPaymentSheetParameters(
//   paymentIntentClientSecret: paymentIntent!['client_secret'],
//   style: ThemeMode.light,
//   merchantDisplayName: 'Vishal'
//  )
//  ).then((value) => {});
//  try{
//   await Stripe.instance.presentPaymentSheet().then((value) =>{
//     print('Payment successfully')
//   } );
//  }catch(error){

//  }

//   }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
       print(response.data.toString());
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    // isLoading = true;
    // setState(() {

    // });
    // await context
    //     .read<CartProvider>()
    //     .placeOrderApi(userid: userProvider.currentUserId).then((value) {
    //        isLoading = false;
    // setState(() {

    // });
    //     });
    //     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const OrderSuccessScreen()));
    // print(response.data.toString());
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

 
