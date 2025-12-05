import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
const Color kPrimaryColor = Color(0xFFE95422);
class Alert extends StatelessWidget {
  const  Alert({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.centerRight,
      child: Material(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(40)
          ),
          child: Container(
            width: screenWidth * 0.7,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(-5, 0)
                )
              ]
            ),
            child: SafeArea(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsetsGeometry.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.notification_add_rounded, color: Colors.white,),
                        SizedBox(width: 20,),
                        Text("Notifications", style: TextStyle(
                          color: Colors.white
                        ),)
                      ],
                    ),
                    // SizedBox(height: 20,),
                    const Padding(padding: 
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                  child: const Divider(color: Colors.white54,),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child: SvgPicture.asset("assets/svg/spoon.svg",),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth*0.9,
                        child: Text("we have added a product you may like",style: TextStyle(
                          
                        ),),
                      )
                    ],
                  )

                  ],
                ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

}