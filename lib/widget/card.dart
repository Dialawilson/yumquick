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
            fontWeight: FontWeight.w700,

          ),
          
        ),
        leading: IconButton(onPressed: ()
        => Navigator.pop(context),
         icon: SvgPicture.asset("assets/svg/BackIcon", height: 24,),
         ),
      ),
      body: Container(
        // === WORKING ON THE CARD SECTION ====
      ),
    )
  }
}