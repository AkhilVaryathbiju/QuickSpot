import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quickspot/screens/signUppage.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
PageDecoration pagedecoration = PageDecoration(
  
  boxDecoration: BoxDecoration(
    
  ),
  imagePadding: EdgeInsets.all(20),
  titlePadding: EdgeInsets.all(20),
  bodyTextStyle: TextStyle(
fontSize: 18,
fontWeight: FontWeight.normal
  ),
  titleTextStyle: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold
  )
);


    return Scaffold(
      backgroundColor: Colors.white,
    body: IntroductionScreen(
      
      showDoneButton: true,
      globalBackgroundColor: Colors.white,
      dotsDecorator: DotsDecorator(
        color: Colors.green,
        activeColor: Colors.lightGreenAccent,
        activeSize: Size(20, 20),
        size: Size(10, 10)
      ),
      showNextButton: true,
      showSkipButton: true,
      onDone: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupPage()));
      },
      
      onSkip: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupPage()));
      },
      skip: Card(
        
        child: Padding(padding: EdgeInsets.only(top: 10,bottom: 10,
        right: 20,left: 20),
        child: Text('Skip',style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.green
        ),),
        ),
        color: Colors.white,
      ),
      done: Card(
        child: Padding(padding: EdgeInsets.only(top: 10,bottom: 10,
        right: 20,left: 20),
        child: Text('Done',style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
        ),
        color: Colors.green,
      ),
    next: Card(
      child:  Padding(padding: EdgeInsets.only(top: 10,bottom: 10,
        right: 20,left: 20),
        child: Text('Next',style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
        ),
      color: Colors.green,
    ),
      pages: [
         PageViewModel(
          
          decoration: pagedecoration,
          image: CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
            radius: 100,
            backgroundColor: Colors.amber,
          ),
          title: 'Welcome to QuickSpot',
          body: 'A Parking Spot finding App'
        ),
        PageViewModel(
          
          decoration: pagedecoration,
          image: CircleAvatar(
            backgroundImage: AssetImage('assets/images/parkSpace.jpg'),
            radius: 100,
            backgroundColor: Colors.amber,
          ),
          title: 'Stuck Finding Parking ?',
          body: 'Say goodbye to circling around. Discover nearby parking in seconds'
        ),
            PageViewModel(
          decoration: pagedecoration,
          image: CircleAvatar(radius: 100,
          backgroundImage: AssetImage('assets/images/parkSpcae2.jpg'),
          ),
          title: 'Find Parking Instantly',
          body: 'Find yor parking in your city'
        ),
            PageViewModel(
          decoration: pagedecoration,
          image: CircleAvatar(
            radius: 130,
            backgroundImage: AssetImage('assets/images/BookingVector.avif'),
          ),
          title: 'Book Your Parking Spot',
          body: 'Book or Check available parking spots '
        )
      ],
    ),
    );
  }
}