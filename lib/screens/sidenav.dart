import 'package:flutter/material.dart';
import 'package:yumquick/screens/delivery_address.dart';
import 'package:yumquick/screens/myorders.dart';
import 'package:yumquick/screens/pay_methods.dart';
import 'package:yumquick/widget/profile.dart';

const Color kPrimaryColor = Color(0xFFE95422);
class Sidenav extends StatelessWidget {
  const Sidenav({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.centerRight,
    
      child: Material( // Wrap in Material for proper shadows/colors),
      color: Colors.transparent,
      
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(40),
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
                  offset: Offset(-5, 0),
                ),
              ],
            ),
            child: SafeArea( // Ensures content is below status bar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header (Profile Info)
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              // backgroundColor: Colors.white,
                              child: Icon(Icons.person, size: 20, color: kPrimaryColor),
                            ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                        Text(
                          'John Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'john.doe@email.com',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                          ],
                        )
                          ],
                        ),
                      ],
                    ),
                  ),
              
                  // Navigation Items
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListTile(
                      leading: const Icon(Icons.home, color: Colors.white),
                      title: const Text('My Orders', style: TextStyle(color: Colors.white, fontSize: 16)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) =>MyOrders())
                        ); // Close the drawer
                      },
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(color: Colors.white54, height: 1),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListTile(
                      leading: const Icon(Icons.supervised_user_circle_rounded, color: Colors.white),
                      title: const Text('My Profile', style: TextStyle(color: Colors.white, fontSize: 16)),
                      onTap: () {
                        // Navigate to My Profile screen
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(color: Colors.white54, height: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListTile(
                      leading: const Icon(Icons.add_location_outlined, color: Colors.white, ),
                      title: const Text('Delivery Address', style: TextStyle(color: Colors.white, fontSize: 16)),
                      onTap: () {
                        // Navigate to settings screen
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>AddressSelection()));
                      },
                    ),
                  ),
                  Padding(padding: 
                  const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Divider(color: Colors.white54,),
                  ),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListTile(
                    leading: const Icon(Icons.atm, color: Colors.white,),
                    title: const Text('Payment Methods', style: TextStyle(color: Colors.white),),
                     onTap: () {
                        // Navigate to settings screen
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const PayMethods()));
                      },
                  ),
                  ),
                   Padding(padding: 
                  const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Divider(color: Colors.white54,),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListTile(
                    leading: const Icon(Icons.phone_callback_rounded, color: Colors.white,),
                    title: const Text('Contact Us', style: TextStyle(
                      color: Colors.white
                    ),),
                     onTap: () {
                        // Navigate to settings screen
                        Navigator.pop(context);
                      },
                  ),
                  ),
                       Padding(padding: 
                  const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Divider(color: Colors.white54,),
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListTile(
                      leading: const Icon(Icons.chat_bubble, color: Colors.white, ),
                      title: const Text('Help & FAQs', style: TextStyle(color: Colors.white, fontSize: 16)),
                      onTap: () {
                        // Navigate to settings screen
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(padding: 
                  const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Divider(color: Colors.white54,),
                  ),

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings_applications, color: Colors.white,),
                    title: const Text('Settings', style: TextStyle(color: Colors.white),),
                     onTap: () {
                        // Navigate to settings screen
                        Navigator.pop(context);
                      },
                  ),
                  ),
                   Padding(padding: 
                  const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Divider(color: Colors.white54,),
                  ),

                  const Spacer( ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, left: 20),
                    child: ListTile(
                      leading: const Icon(Icons.logout, color: Colors.white,),
                      title: const Text('Logout', style: TextStyle(color: Colors.white, fontSize: 16)),
                      onTap: () {
                        // Handle logout
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}