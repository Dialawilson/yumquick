import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/widget/bottomNav.dart';
import 'package:yumquick/widget/emptyorder.dart';

const Color kPrimaryColor = Color(0xFFE95422);
const Color kBackgroundColor = Color(0xFFF5CB58);

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          title: const Text(
            'My Orders',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: kBackgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              "assets/svg/BackIcon.svg",
              height: 24,
            ),
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 29),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // Placeholder for order items
          
         Expanded(
          
          child: OrdersComponent()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
