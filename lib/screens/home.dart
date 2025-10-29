import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("hekkl"),
                Container()
               
                
              ],
            )
          ],
        ),
      ),
    );
  }
}