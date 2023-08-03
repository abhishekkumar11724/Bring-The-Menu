import 'package:bring_the_menu/views/admin/login/admin_login.dart';
import 'package:bring_the_menu/views/admin/signup/admin_signup.dart';
import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: IntroductionScreen(
      skip: Text('SKIP', style: TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold, fontSize: 18),),
      next: Text('NEXT', style: TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold, fontSize: 18),),
      globalBackgroundColor: Colors.black,
      isProgressTap: true,
      isProgress: true,
      pages: [
        PageViewModel(
          title: 'Scan and Go!',
              body: 'Easily scan a code at your table to access the digital menu instantly.',
          image: Center(child:Image.asset("assets/images/rev1.png",width: 350,),),
          decoration: getDecoration()

        ),
        PageViewModel(
          title: 'Seamless Menu Browsing!',
          body: 'Effortlessly explore a comprehensive menu with vibrant images and detailed descriptions.',
          image: Center(child:Image.asset("assets/images/rev2.png",width: 350,),),
            decoration: getDecoration()
        ),
        PageViewModel(
            title: 'Quick Order!',
            body: 'Place your food and beverage orders directly from the app, without having to wait for a Waiter.',
            image: Center(child:Image.asset("assets/images/rev3.png",width: 350,),),
            decoration: getDecoration()
        ),
        PageViewModel(
            title: 'Bring the menu on!',
            body: 'Start Using Bring-the-Menu Now!',
            footer: SizedBox(width: MediaQuery.of(context).size.width ,child:Center(child: ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 10, backgroundColor: Colors.deepOrangeAccent)
            ,onPressed: () async{
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('showslider', false);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminLogin())); },
            child: Text('PPROCEED TO SIGNUP/LOGIN', style: TextStyle(fontWeight: FontWeight.bold),),

            ),),),
            image: Center(child:Image.asset("assets/images/rev4.png",width: 350,),),
            decoration: getDecoration(),

        ),

      ],
      showNextButton: true,
      showSkipButton: true,
      showDoneButton: false,
      freeze: false,
      onDone: () => gotoHome(),
      dotsDecorator: DotsDecorator(

        size: const Size.square(10.0),

        activeSize: const Size(20.0, 10.0),
        activeColor: Colors.deepOrangeAccent,
        color: Colors.deepOrangeAccent,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
        ),
      ),


    ));
  }

  getDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.deepOrangeAccent ),
    bodyTextStyle: TextStyle(fontSize: 20, color: Colors.white),
    bodyPadding: EdgeInsets.all(10),
    imagePadding: EdgeInsets.all(20),

    titlePadding: EdgeInsets.all(10),
    pageColor: Colors.black
  );

  gotoHome() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminLogin()));
}

    
    