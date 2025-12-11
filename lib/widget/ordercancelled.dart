import 'package:flutter/material.dart';


// --- CONSTANTS ---
// Using 0xFF for full opacity
const Color kPrimaryColor = Color(0xFFE95422); 
const Color kBackgroundColor = Color(0xFFF5CB58);
const Color kSecondaryColor = Color(0xFF333333); // Darker text/icon color
const Color kLightAccent = Color.fromARGB(255, 255, 207, 207); // Light background for buttons/status

class Ordercancelled extends StatelessWidget {
  const Ordercancelled({super.key});

  @override
  Widget build(BuildContext context) {
    // You should wrap the Activeorder widget in a Scaffold or use it within a full-screen layout.
    // For this example, we'll return a Card for a clean, contained look.
    
    // --- Sample Data ---
    const String itemName = "Strawberry Delight";
    const String itemPrice = "20.00";
    const String orderDate = "29 Nov, 01:20 pm";
    const String itemCount = "2 items";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
               
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. IMAGE SECTION
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: kLightAccent, // Light background for the image
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    "assets/images/Burger.png", 
                    fit: BoxFit.contain,
                  ),
                ),
                
                const SizedBox(width: 16),
                  
                // 2. DETAILS & STATUS SECTION
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Item Name and Price Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            itemName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kSecondaryColor,
                            ),
                          ),
                          Text(
                            "\$$itemPrice",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor, // Highlight the price
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 8),
                  
                      // Date and Items Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            orderDate,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            itemCount,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                  
                      const SizedBox(height: 12),
                      // Status Row
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cancel_outlined,
                           size: 17,
                            color: kPrimaryColor,
                          ),
                          Text(" Order cancelled",style: TextStyle(
                            color: kPrimaryColor
                          ),)
                        ],
                      ),

                      
                 
                    ],
                  ),
                ),
              ],
            ),
            const Padding(padding: 
                       EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
                      child:  Divider(color: kPrimaryColor,),
                      ),
          ],
        ),
      ),
    );
  }
}