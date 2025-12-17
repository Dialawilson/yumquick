import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// Constants for colors
const Color kBackgroundColor = Color(0xFFF5CB58);
const Color kPrimaryColor = Color(0xFFE95422);

class AddDeliveryaddress extends StatelessWidget{
  const AddDeliveryaddress({super.key});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text("Add New Address",
        style: TextStyle(
         fontWeight: FontWeight.w700,
         color: Colors.white,
         fontSize: 22,
        ),
        ),
        leading: IconButton(onPressed: ()=>Navigator.pop(context),
         icon: SvgPicture.asset("assets/svg/BackIcon.svg", height:24)),
      ),
      body: Container(
        height: size.height - 100,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.vertical(top: Radius.circular(30))
        ),
      child: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
            child: Image.asset("assets/svg/home_icon.svg")
            )
          ],
        ),
        ),
      ),
      ),
    );
  }
}