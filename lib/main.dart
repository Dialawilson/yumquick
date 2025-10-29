import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'package:yumquick/screens/signup.dart';

void main() =>runApp(const LaunchScreen());

class LaunchScreen extends StatelessWidget{
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 84, 34),
     
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                
                child: Builder(
                  builder: (context) {
                    return Column(
                      
                      children: [
                        SizedBox(height: 280,),
                        Image.asset("assets/logo/logo_yello.png"),
                        SizedBox(height: 20,),
                        Text("Our promise is simple: the freshest local ingredients, prepared by skilled hands, delivered with warmth.",
                        textAlign: TextAlign.center,
                         style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.5
                         )),
                         SizedBox(
                          height: 43,
                         ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 245, 203, 88),
              
                            padding: EdgeInsets.symmetric(horizontal: 73)
                          ),
                          onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                        }, child: Text("Log In",
                        style: TextStyle(
                          color: Color.fromARGB(255, 233, 84, 34)
                        ),)),
                        SizedBox(
                          height: 4,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 73)
                          ),
                          onPressed: (){
                            Navigator.push(context,
                            
                             MaterialPageRoute(
                              builder: (context)=> SignUp())

                              );
                          }, 
                        child:Text("Sign Up",
                        
                        style: TextStyle(
                          color:Color.fromARGB(255, 233, 84, 34)
                        ),
                        )
                         )
                      ],
                      
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


