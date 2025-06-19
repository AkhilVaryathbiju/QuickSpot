import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickspot/models/accountModel.dart';
import 'package:quickspot/provider/AccountProvider.dart';

import 'package:quickspot/screens/bottomnavigation.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
final _formkey=GlobalKey<FormState>();

  String name='';
  String email='';
  String ph='';
  String Adress='';
  String vehicle='';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(child: Text('QuickSpot',style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold
                  ),),)
                ],
              ),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              ),
            ),
            SizedBox(
              height: 800,
              child: Form(
                key: _formkey,
                child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text('Sign up',style:GoogleFonts.openSans(
                      fontSize: 18
                    )
                    ,
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if(value==null||value.trim().isEmpty||!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)){
                          return 'Enter your name';
                        }
                      },
                      onSaved: (value)=>name=value??'',
                      decoration: InputDecoration(
                        hintText: 'Name',
                        
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value==null||value.isEmpty||!value.contains('@')){
                        return 'Must contains @';
                      }
                    },
                    onSaved: (value)=>email=value??'',
                      decoration: InputDecoration(
                        
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                    ),),Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if(value==null||value.isEmpty||value.length<10||value.length>10){
                            return 'You must enter your ph number';
                          }
                        },
                        onSaved: (value)=>ph=value??'',
                      decoration: InputDecoration(
                        hintText: 'Ph',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if(value==null|| value.trim().isEmpty){
return 'value cannot be empty';
                          }
                        },
                        onSaved: (value)=>Adress=value??'',
                      decoration: InputDecoration(
                        hintText: 'Adress',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if(value==null||value.trim().isEmpty){
                            return 'Enter your vehicle';
                          }else if(!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)){
                            return 'Enter your vehicle model';
                          }return null;
                        },
                        onSaved: (value)=>vehicle=value??'',
                      decoration: InputDecoration(
                        hintText: 'Vehicle',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 20,right: 100,left: 100),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          
                        ),
                        onPressed: (){
                       if(_formkey.currentState?.validate()??false){
                         _formkey.currentState?.save();
                        final account=Account(name: name, Adress: Adress, Email: email, ph: ph, vehicles: vehicle);
                        Provider.of<Accountprovider>(context,listen: false).seaccount(account);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BottomnavigationPage()));

                       }
                      }, child: Text('Submit',style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 20
                      )
                      )
                      ),
                    )
                ],
              )),
            )
          ],
        ),
      )
    );
  }
}
