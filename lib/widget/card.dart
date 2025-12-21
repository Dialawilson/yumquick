import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color kBackgroundColor = Color(0xFFF5CB58);
const Color kPrimaryColor = Color(0xFFE95422);

class CardPay extends StatelessWidget{
  const CardPay({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        toolbarHeight: 100,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Add Card",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,

          ),
          
        ),
        leading: IconButton(onPressed: ()
        => Navigator.pop(context),
         icon: SvgPicture.asset("assets/svg/BackIcon.svg", height: 24,),
         ),
      ),

      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))
        ),
        // === WORKING ON THE CARD SECTION ====
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
            
              children: [
                SvgPicture.asset("assets/svg/card.svg"),
                SizedBox(height: 20,),

                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [

                  Text(
                    "Card holder Name",
                    style: TextStyle(
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "john smith",
                      fillColor: kBackgroundColor,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Card Number",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,

                    ),
                  ),
                     TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "000 000 000 00",
                      fillColor: kBackgroundColor,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 20,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}