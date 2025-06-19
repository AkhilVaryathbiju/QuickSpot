import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentscreenPage extends StatefulWidget {
  const PaymentscreenPage({super.key});

  @override
  State<PaymentscreenPage> createState() => _PaymentscreenPageState();
}

class _PaymentscreenPageState extends State<PaymentscreenPage> {
  String ?selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
        SizedBox(
          height: 100,
          child: 
          Container(
            child: Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                IconButton(
                  onPressed:(){
                    Navigator.pop(context);
                  } ,
                  icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,)),
                SizedBox(width: 40,),
                Center(
                  child: Text('Choose Your Payment',style: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                  ),),
                ),
                

              ],
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RadioListTile(
            activeColor: Colors.black,
            radioScaleFactor: 1.6,
            title: FaIcon(FontAwesomeIcons.applePay,size: 40,color: Colors.black,),
            value: 'Applepay', groupValue: selectedValue, onChanged: (value){
            setState(() {
              selectedValue=value;
            });
          }),
        ),
        SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RadioListTile(
                    activeColor: Colors.black,
                            radioScaleFactor: 1.6,
                            title: FaIcon(FontAwesomeIcons.googlePay,size: 40,color: Colors.orange,),
                            value: 'Gpay', groupValue: selectedValue, onChanged: (value){
                            setState(() {
                              selectedValue=value;
                            });
                          }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RadioListTile(
                    activeColor: Colors.black,
                            radioScaleFactor: 1.6,
                            title: FaIcon(FontAwesomeIcons.paypal,size: 40,color: Colors.blue,),
                            value: 'Paypal', groupValue: selectedValue, onChanged: (value){
                            setState(() {
                              selectedValue=value;
                            });
                          }),
                ),
        SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RadioListTile(
                    activeColor: Colors.black,
                            radioScaleFactor: 1.6,
                            title: FaIcon(FontAwesomeIcons.ccPaypal,size: 40,color: Colors.lightBlue,),
                            value: 'ccPaypal', groupValue: selectedValue, onChanged: (value){
                            setState(() {
                              selectedValue=value;
                            });
                          }),
                ),

Padding(
  padding: const EdgeInsets.all(8.0),
  child: SizedBox(height: 250,
  child: Container(

    decoration: BoxDecoration(
      color: Colors.white,
      image: DecorationImage(image: NetworkImage('https://www.bankoftennessee.com/wp-content/uploads/BoT-Business-Credit-Card-720x500-2022.png'),fit: BoxFit.fill),
      borderRadius: BorderRadius.circular(15)
    ),
    
  ),),
),
SizedBox(height: 50,),

ElevatedButton(


  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green
  ),
  onPressed: (){

}, child: Text('Confirm',style: TextStyle(
  color: Colors.white
),))



        ],
      ),
    );
  }
}