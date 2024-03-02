import 'package:flutter/material.dart';
import 'package:news_app/pages/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('images/off.jpg',
              height: MediaQuery.of(context).size.height/1.5,fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,),
            ),
            SizedBox(height: 10,),
            Text('News From Around the\n        World Fo You',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('Best time to read, take your time to\n    read a little more of the World',style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              },
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 45,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(child: Text('Get Started')),
                ),
              ),
            )
          ],
          
        ),
      ),
    );
  }
}
