import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color kPrimaryColor = Color(0xFFE95422);
const Color kBackgroundColor = Color(0xFFF5CB58);


class Activeorder  extends StatelessWidget{
  const Activeorder({super.key});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                  child: Divider(color: kPrimaryColor,),),
                  SizedBox(
                    width: 60,
                    child: Image.asset("assets/images/Burger.png", height: 150,)),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Starwberry", style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor,
                      ),),
                  Text("20.00")
                    ],
                  ),
                  Row(
                    children: [

                    Text("29 Nov, 01:20 pm"),
                    Text("2 items")
                    ]
                  )
                  Row(
                    children: [
                      TextButton(onPressed: onPressed, child: child)
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

