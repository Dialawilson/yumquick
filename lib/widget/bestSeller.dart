import 'package:flutter/material.dart';


const Color priceBg = Color(0xFFE95422);

class BestSeller extends StatelessWidget {
  const BestSeller({super.key, required this.Img_Url, this.price});
  final String Img_Url;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      // The main container for the card, width/height can be defined here if needed
      width: 87, 
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
                  height: 98,
                  width: 75,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 80, // Adjusted height for visibility
                    width: 79, // Adjusted width for visibility
                    color: Colors.grey,
                    child: const Center(child: Icon(Icons.broken_image_outlined)),
                  ),
                ),
              ),

              // 1.2. Top Layer (The Price Tag) - Must be inside the Stack
              Positioned(
                // Positioned controls where the widget sits within the Stack
                top: 65, 
                left: 27, // Adjusted position to look like a floating tag
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration( // Corrected BoxDecotration to BoxDecoration
                    color: priceBg, // Corrected Color: to color:
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft:Radius.circular(10)),
                  ),
                  child: Text(
                    '\$${price ?? '?.??'}', // Display price, or a fallback if null
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12, // Added font size back
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          // You can add other content here, outside the Stack but inside the main Column
          // const Padding(
          //   padding: EdgeInsets.only(top: 8.0),
          //   child: Text(
          //     "Product Title",
          //     style: TextStyle(fontWeight: FontWeight.w600),
          //   ),
          // )
        ],
      ),
    );
  }
}