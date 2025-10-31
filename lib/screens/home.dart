import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
      // ⭐ FIX 1: Removed the redundant Container with height: double.infinity
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column( // Column is now the direct child
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3, // This is fine, but not necessary if it's the only Expanded
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search...",
                      filled: true,
                      fillColor: Colors.white,

                      // ⭐ FIX 2: Added a prefixIcon (makes more sense for search)
                      // prefixIcon: const Icon(Icons.settings_rounded, color: Colors.grey),
                      
                      // ⭐ FIX 3: Corrected the asset path from 'asset/' to 'assets/'
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(
                          // Using a 'filter' icon as it's more common for a suffix
                          "assets/svg/filter.svg", 
                          width: 20,
                          height: 20,
                          // colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Spacing between search and icons
                const SizedBox(width: 15),
                  
                // Re-usable helper widget for icons
                _HomeIcon(svgPath: "assets/svg/cart.svg"),
                const SizedBox(width: 10),
                _HomeIcon(svgPath: "assets/svg/notify.svg"),
                const SizedBox(width: 10),
                _HomeIcon(svgPath: "assets/svg/profile.svg"),
                  
                // ⭐ FIX 4: Removed the misplaced SizedBox(height: 20) from the Row
              ],
            ),
            
            // This SizedBox is now correctly in the Column
            const SizedBox(height: 25), 
            
            const Text(
              "Good Morning",
              style: TextStyle(fontSize: 29, letterSpacing: 1, fontWeight: FontWeight.w900, color: Colors.white),
            ),
            Text("Rise And Shine! It's Breakfast Time",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, 
              color: kPrimaryColor
            ),
            ),

            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))
              ),
              child: Column(
                children: [
                  Text("hekwk")
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

// Helper Widget for Reusable Icon Buttons
class _HomeIcon extends StatelessWidget {
  final String svgPath;
  
  const _HomeIcon({required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30) 
      ),
      child: SvgPicture.asset(
        svgPath,
        height: 20,
      )
    );
  }
}