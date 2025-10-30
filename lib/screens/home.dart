import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


const Color kPrimaryColor = Color(0xFFE95422);
const Color kBackgroundColor = Color(0xFFF5CB58);
const Color kSocialButtonColor = Color(0xFFFFDECF);

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kBackgroundColor,
          elevation: 0,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:Row(
            
            children: [
              // Text("Home Screen"),
              Expanded(
                flex: 3,
                child: TextField(

                decoration: InputDecoration(
                  border:OutlineInputBorder(

                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none
                  ),
                  hintText: "search",
                  
                  filled: true,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset("asset/svg/BackIcon.svg",
                    width: 20,
                    height: 20,
                    color: Colors.amber,),
                  ),
                  
                  fillColor: Colors.white
                ),
              )
              ),
              SizedBox(width: 20,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30) 

                ),
                child: SvgPicture.asset("assets/svg/cart.svg",
                height: 20,
                )
              ),
              SizedBox(width: 13,),
               Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30) 

                ),
                child: SvgPicture.asset("assets/svg/notify.svg",
                height: 20,
                ),
              ),
              SizedBox(width: 13,),
               Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30) 

                ),
                child: SvgPicture.asset("assets/svg/profile.svg", 
                height: 20,),
              ),

              // Flexible(
              //   flex: 5,
              //   fit: FlexFit.loose,
              //   child: const TextField(
              //     decoration: InputDecoration(
              //       hintText: "look"
              //     ),
              //   )
              //   )

             SizedBox(height: 20,)
             
            ],
          ),
          
        ),
      )
    );
  }
}