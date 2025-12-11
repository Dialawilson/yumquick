import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/screens/home.dart';

// --- Constants ---
const Color kBackgroundColor = Color(0xFFF5CB58); // Yellowish color
const Color kPrimaryColor = Color(0xFFE95422);   // Orange/Red

class Closeorder extends StatelessWidget {
  const Closeorder({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the size of the screen for responsive layout
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      
      // --- AppBar ---
      appBar: AppBar(
        // Set AppBar background and elevation to match the background color
        backgroundColor: kBackgroundColor,
        elevation: 0, 
        toolbarHeight: 100,
        centerTitle: true,
        // The title "Cancel Order" or similar is often good for context, but omitted here 
        // as the main body content is the focus.

        leading: IconButton(
          onPressed: () {
            // Standard back navigation
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/svg/BackIcon.svg",
            height: 24,
            // Added color filter to ensure the icon is visible (e.g., white)
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),

      // --- Body ---
      body: Container(
        width: double.infinity,
        // The body should typically fill the remaining space below the AppBar
        height: size.height - 100, 
        
        // Use a BoxDecoration for the rounded top corners and white background
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          // Use Center to vertically align content if there's enough space
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // --- Icon ---
                  SvgPicture.asset(
                    // Assuming 'Cancel.svg' is the correct asset path
                    "assets/svg/Cancel.svg",
                    height: 100, // Increased size for better focus
                    colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn), // Apply primary color to the icon
                  ),
                  
                  const SizedBox(height: 30),

                  // --- Title ---
                  const Text(
                    "Order Cancelled!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: kPrimaryColor, // Highlighted text
                    ),
                  ),
                  
                  const SizedBox(height: 10),

                  // --- Subtitle/Message ---
                  const Text(
                    "Your order has been successfully cancelled. You will receive a confirmation shortly.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  
                  // The original code had redundant space and text.
                  // We replace it with a button for a clear next action.
                  const SizedBox(height: 50),
                  
                  // --- Action Button ---
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => const Home()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Back to Home",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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