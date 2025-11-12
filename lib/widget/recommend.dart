import 'package:flutter/material.dart';

const Color priceBg = Color(0xFFE95422);
class Recommend extends StatelessWidget {
  const Recommend({super.key, required this.Img_Url, this.rate});
  final String Img_Url;
  final String? rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      // The main container for the card, width/height can be defined here if needed
      width: 120, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Stack: This is used to layer widgets (Image + Price Tag)
          Stack(
            
            // The image and the Positioned price tag are siblings inside the Stack
            children: [
              // 1.1. Base Layer (The Image)
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  Img_Url,
                  height: 140,
                  width: 159,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 80, // Adjusted height for visibility
                    width: 79, // Adjusted width for visibility
                    color: Colors.grey,
                    child: const Center(child: Icon(Icons.broken_image_outlined)),
                  ),
                ),
              ),

              Positioned(
                top: 10,
                child: Container(
                height: 140,
                width: 159,
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  // color: Colors.black,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                      decoration: BoxDecoration( // Corrected BoxDecotration to BoxDecoration
                        color: priceBg, // Corrected Color: to color:
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft:Radius.circular(10)),
                      ),
                      child: Stack(
                        children: [

                        Text(
                          rate  ?? "*.*",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12, // Added font size back
                          ),
                        ),
                       const Spacer(),
                       
                        const Icon(Icons.star, color: Colors.yellow, size: 12,),
                        ], 
                      ),
                    // const Spacer(),
                    // const Icon(Icons.favorite_border, color: Colors.yellow,),
                    ),
                  ],
                ),
              )),


              // 1.2. Top Layer (The Price Tag) - Must be inside the Stack
              // Positioned(
              //   // Positioned controls where the widget sits within the Stack
              //   top: 90, 
              //   left: 80, // Adjusted position to look like a floating tag
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
              //     decoration: BoxDecoration( // Corrected BoxDecotration to BoxDecoration
              //       color: priceBg, // Corrected Color: to color:
              //       borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft:Radius.circular(10)),
              //     ),
              //     child: Text(
              //       '\$${price ?? '?.??'}', // Display price, or a fallback if null
              //       style: const TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 12, // Added font size back
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}