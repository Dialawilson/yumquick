import 'package:flutter/material.dart';

const Color priceBg = Color(0xFFE95422);

class Recommend extends StatelessWidget {
  const Recommend({super.key, required this.Img_Url, this.rate});
  final String Img_Url;
  final String? rate;

  @override
  Widget build(BuildContext context) {
    // The main container for the card, width/height can be defined here if needed
    return SizedBox(
      width: 120, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Stack: Used to layer the Image and the Rating Tag
          Stack(
            children: [
              // 1.1. Base Layer (The Image)
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  Img_Url,
                  height: 140, // Added a specific height for better structure
                  width: 120, // Match the parent width
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 140, // Match image height
                    width: 120,  // Match image width
                    color: Colors.grey,
                    child: const Center(child: Icon(Icons.broken_image_outlined)),
                  ),
                ),
              ),

              // 1.2. Top Layer (The Rating Tag) - Positioned at the top-left
              Positioned(
                top: 10, // Small offset from the top
                left: 3, // Align to the left edge
                child: Container(
                  // Padding around the content (rating text + star)
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(193, 255, 255, 255),
                    
                    // Rounded corners only on the side where the container starts
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10), 
                      bottomRight: Radius.circular(10),
                      topLeft:Radius.circular(10),
                      bottomLeft:Radius.circular(10)
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Constrain Row size to its children
                    children: [
                      // Rating Text
                      Text(
                        rate ?? "N/A", // Use "N/A" or a similar fallback
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4), // Space between text and star
                      // Star Icon
                      const Icon(Icons.star, color: priceBg, size: 12),
                    ],
                  ),
                ),
              ),
              

            ],
          ),
          // You would typically add Title/Subtitle/etc. here:
          const SizedBox(height: 8),
          const Text(
            "Item Title",
            style: TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}