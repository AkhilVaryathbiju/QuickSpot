import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickspot/provider/AccountProvider.dart';
import 'package:quickspot/screens/signUppage.dart';


class AccounuiPage extends StatelessWidget {
  const AccounuiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accountProvider=Provider.of<Accountprovider>(context);
    final account=accountProvider.account;
    return  Scaffold(
      
      body: account==null?Center(child: Text('No account found'),):
      
      
      
      SingleChildScrollView(
        child: Column(
        
          children: [
            SizedBox(
              height: 200,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  Text('Profile',style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/profilrpic.jpg',),
                    
                  ),
                  SizedBox(height: 10,),
            
        
        
        
                ],
              ),
            ),
              Container(
          child:
          
           Column(
            children: [
              SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            
            child: ListTile(
              title: Text('Name:${account.name}'),
            ),),
        ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Card(
                         
                         child: ListTile(
                           title: Text('Email:${account.Email}'),
                         ),),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Card(
                         
                         child: ListTile(
                           title: Text('Ph:${account.ph}'),
                         ),),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Card(
                         
                         child: ListTile(
                           title: Text('Adress:${account.Adress}'),
                         ),),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Card(
                         
                         child: ListTile(
                           title: Text('Vehicle:${account.vehicles}'),
                         ),),
               ),
               TextButton(onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupPage()));
               }, child: Container(
                height: 30,
                width: 90,
                child: Center(child: Text('Log out')),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
               ))
           
            ],
          ),
          height: 665,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
          ),
        )
        
           
          ],
        ),
      )
    );
  }
}
//  
//           
//          
//           Text('Adress:${account.Adress}'),
//           Text('Vehicles:${account.vehicles}')
// account==null?Center(
//         child: Column(
//           children: [
//             Text('No account ')
//           ],
//         ),
//       ):