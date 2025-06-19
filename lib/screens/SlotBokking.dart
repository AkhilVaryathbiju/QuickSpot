import 'package:flutter/material.dart';
import 'package:quickspot/screens/paymentScreen.dart';

class SlotbokkingPage extends StatefulWidget {
  const SlotbokkingPage({super.key});

  @override
  State<SlotbokkingPage> createState() => _SlotbokkingPageState();
}

class _SlotbokkingPageState extends State<SlotbokkingPage> {

List<String>floorOptions=['G','F1','F2'];

List <int>selectedA1Cancels=[];
List <int>selectedA2Cancels=[];
List <int>selectedA3Cancels=[];


Map<String ,List<String>>A1StatusPerFloor={
  'G':[
  'Empty',
  'Booked',
  'Booked',
  'Empty',
  'Empty',
  'Booked',
  'Booked',
  'Empty',
],
'F1':[
  'Empty',
  'Booked',
  'Booked',
  'Empty',
  'Empty',
  'Booked',
  'Booked',
  'Empty',
],
'F2':[     'Empty',
  'Booked',
  'Booked',
  'Empty',
  'Empty',
  'Booked',
  'Booked',
  'Empty',]

};  

Map<String ,List<String>>A2StatusPerFloor={
  'G':[
  'Empty',
  'Booked',
  'Booked',
  'Empty',
  'Empty',
  'Booked',
  'Booked',
  'Empty',
],
'F1':[
  'Empty',
  'Booked',
  'Booked',
  'Booked',
  'Booked',
  'Booked',
  'Booked',
  'Empty',
],
'F2':[     'Empty',
  'Booked',
  'Booked',
  'Booked',
  'Booked',
  'Booked',
  'Booked',
  'Empty',]

};


Map<String ,List<String>>A3StatusPerFloor={
  'G':[
  'Empty',
  'Empty',
  'Empty',
  'Empty',
  'Empty',
  'v',
  'Empty',
  'Empty',
],
'F1':[
  'Empty',
  'Empty',
  'Booked',
  'Empty',
  'Booked',
  'Booked',
  'Empty',
  'Empty',
],
'F2':[     'Empty',
  'Booked',
  'Empty',
  'Empty',
  'Empty',
  'Empty',
  'Empty',
  'Empty',]

};

List <int>a1Cancel=[];
List <int>a2Cancels=[];
List <int>a3Cancels=[];

List<String>A1Status=[
  'Empty',
  'Booked',
  'Booked',
  'Empty',
  'Empty',
  'Empty',
  'Empty',
  'Empty',
];


//a2
List<String>A2Status=[
  'Empty',
  'Booked',
  'Booked',
  'Empty',
  'Empty',
  'Booked',
  'Booked',
  'Booked',
];


List<String>A3Status=[
  'Empty',
  'Booked',
  'Booked',
  'Booked',
  'Booked',
  'Booked',
  'Booked',
  'Booked',
];

String ? SelectedFloor='G';
List SelectedA1Index=[];
List selectedA2Index=[];
List  selectedA3Index=[];

Future<bool?>showConfirmationDialog(BuildContext context,String actionType){
  return showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text('$actionType Booking'),
    content: SizedBox(
      height: 50,
      child: Column(
        children: [
          Text('Warning ! ',style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
          Text('cancellation must be done within 1 hour'),
        ],
      ),
    ),
    actions: [
      TextButton(onPressed: (){
        Navigator.pop(context,false);
      }, child: Text('No')),
      TextButton(onPressed: (){
        Navigator.pop(context,true);

      }, child: Text('Yes'))
    ],

  ));
}
Future<bool?>showcancelDialog(BuildContext context,String actionType){
  return showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text('$actionType Booking'),
    actions: [
      TextButton(onPressed: (){
        Navigator.pop(context,false);
      }, child: Text('No')),
      TextButton(onPressed: (){
        Navigator.pop(context,true);

      }, child: Text('Yes'))
    ],

  ));
}





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);

                  }, icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,)),
                 
                  Text('Book Your Slot',style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  ),),
                DropdownButton<String>(
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor: Colors.white,
                  underline: SizedBox(),
                  value: SelectedFloor,
                  items: floorOptions.map((floor){
                    return DropdownMenuItem(
                      
                      value: floor,
                      child: Text(floor,style: TextStyle(
                        color: Colors.black
                      ),));
                  }).toList()

                , onChanged: (value){
                  setState(() {
                    SelectedFloor=value;
                  });
                  

                })
                  
                  
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
              ),
             
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('A1',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              Text('A2',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              Text('A3',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              //A1
              Column(
                children:List.generate(8, (index){
                 final status=A1StatusPerFloor[SelectedFloor]![index];
                 Color color;
                 if(status=='Booked'){
                  if(selectedA1Cancels.contains(index)){
                    color=Colors.red;
                  }else {
                  color =  Colors.black;
                  }
                 }else if(SelectedA1Index.contains(index)){
                  color =Colors.green;
                 }else{
                  color=Colors.grey;
                 }
                 return  GestureDetector(
                  child: BookingContainer(Bgcolor: color,),
                  onTap: () {
                   if(status=='Booked'){
                    setState(() {
                      if(selectedA1Cancels.contains(index)){
                        selectedA1Cancels.remove(index);
                      }else{
                        selectedA1Cancels.add(index);
                      }
                    });
                   } else if(status=='Empty'){
                        setState(() {
                          if(SelectedA1Index.contains(index)){
SelectedA1Index.remove(index);
                          }else{
                            SelectedA1Index.add(index);
                          }
                        });
                      }
                    
                  },
                 );
                 

                  
                })
              ),
              //A2
              Column(
                children: List.generate(8, (index){
                  final status=A2StatusPerFloor[SelectedFloor]![index];
                  Color colorr;
                  if(status=='Booked'){
                    if(selectedA2Cancels.contains(index)){
                      colorr=Colors.red;
                    }else {
                    colorr=Colors.black;
                    }
                  }else if(selectedA2Index.contains(index)){
                    colorr=Colors.green;
                  }else{
                    colorr=Colors.grey;
                  }
                    return GestureDetector(
                      child: BookingContainer(Bgcolor: colorr,),
                      onTap: () {
        if(status=='Booked'){
                    setState(() {
                      if(selectedA2Cancels.contains(index)){
                        selectedA2Cancels.remove(index);
                      }else{
                        selectedA2Cancels.add(index);
                      }
                    });
                   } else

                        if(status=='Empty'){
                          setState(() {
                            if(selectedA2Index.contains(index)){
                              selectedA2Index.remove(index);
                            }else{
                              selectedA2Index.add(index);
                            }
                          });
                        }
                      },
                    );

                  
                })
              ),
              //A3
              Column(
                children: List.generate(8, (index){
                  final status=A3StatusPerFloor[SelectedFloor]! [index];
                  Color colorrr;
                  if(status=='Booked'){
                    if(selectedA3Cancels.contains(index)){
                      colorrr=Colors.red;
                    }
                    else{
                    colorrr=Colors.black;
                    }
                  }else if(selectedA3Index.contains(index)){
                    colorrr=Colors.green;

                  }
                  else{
                    colorrr=Colors.grey;
                  }
                  return GestureDetector(
                    child: BookingContainer(
                      Bgcolor: colorrr,
                    ),
                    onTap: (){
                              if(status=='Booked'){
                    setState(() {
                      if(selectedA3Cancels.contains(index)){
                        selectedA3Cancels.remove(index);
                      }else{
                        selectedA3Cancels.add(index);
                      }
                    });
                   } else
                      if(status=='Empty'){
setState(() {
  if(selectedA3Index.contains(index)){
    selectedA3Index.remove(index);
  }else{
    selectedA3Index.add(index);
  }
});
                      }
                    },
                  );
                })
              ),
              
            ],
            
            
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
       Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10,),
                      Text('Selected')
                    ],
                  ),
                         Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10,),
                      Text('Booked')
                    ],
                  ),
                         Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10,),
                      Text('Empty')
                    ],
                  )
          ],),
          
          SizedBox(height: 3,),
         
Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
     ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              backgroundColor: Colors.green
            ),
            onPressed: ()async {
             if(SelectedA1Index.isEmpty&&selectedA2Index.isEmpty&&selectedA3Index.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No slots selecetd')));
             return;
             }
             


              final confirmed=await showConfirmationDialog(context, 'Confirm');

            if(confirmed??false){
               if(SelectedFloor!=null){

              
              var a1=A1StatusPerFloor[SelectedFloor]!;
              var a2=A2StatusPerFloor[SelectedFloor]!;
              var a3=A3StatusPerFloor[SelectedFloor]!;
              for(int i in SelectedA1Index){
                a1[i]='Booked';
                a1Cancel.add(i);
                
          
              }
              for(int i in selectedA2Index){
                a2[i]='Booked';
                a2Cancels.add(i);
          
              }
              for(int i in selectedA3Index){
                a3[i]='Booked';
                a3Cancels.add(i);
          
              }
              setState(() {
                SelectedA1Index.clear();
                selectedA2Index.clear();
                selectedA3Index.clear();
              });
                ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Slots Booked')),
      );
              
             }
           
            }
              
              
              
              
            },
            child: Center(child: Text('Confirm',style: TextStyle(color: Colors.white),),)
          ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentscreenPage()));
                
                }, child: Text('Go To Payments >',style: TextStyle(
                  color: Colors.white
                ),)),
              ),
              
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
              ),
              onPressed: ()async{
if(selectedA1Cancels.isEmpty&&selectedA2Cancels.isEmpty&&selectedA3Cancels.isEmpty){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No slots to cancel')));
  return;
}

            final confirmation= await showcancelDialog(context, 'Cancel');
            if(confirmation??false){
                   if(SelectedFloor!=null){
                var a1=A1StatusPerFloor[SelectedFloor]!;
                var a2=A2StatusPerFloor[SelectedFloor]!;
                var a3=A3StatusPerFloor[SelectedFloor]!;
                for(int i in a1Cancel){
                  a1[i]='Empty';
                }
                for(int i in a2Cancels){
                  a2[i]='Empty';
                }
                for(int i in a3Cancels){
                  a3[i]='Empty';
                }
                setState(() {
                  selectedA1Cancels.clear();
                  selectedA2Cancels.clear();
                  selectedA3Cancels.clear();
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Booking Cancelled')));
            
              }

            }

                     
         
            
            }, child: Text('Cancel',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),)),
          )
  ],
)
          
        ],
      
      ),
    );
  }
}




class BookingContainer extends StatelessWidget {
   Color ?Bgcolor;


   BookingContainer({super.key,this.Bgcolor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 60,
        color: Bgcolor,
      ),
    );
  }
}
