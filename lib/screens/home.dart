import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5CB58),
      appBar: PreferredSize(preferredSize: const Size.fromHeight(120), 
      child:  AppBar(
        automaticallyImplyLeading: false,
        title: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text("hekko"),
                    ),
      ),
                  ),
                  body: Text("body text"),);
    // );
    }
    }