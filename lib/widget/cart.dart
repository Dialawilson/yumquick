import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

 class Cart extends  StatefulWidget{
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(
        child: Text("This is the cart screen"),
      ),
    );
  }
}