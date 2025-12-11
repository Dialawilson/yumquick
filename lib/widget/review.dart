import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/screens/home.dart';

// --- Constants ---
const Color kBackgroundColor = Color(0xFFF5CB58); // Yellowish color
const Color kPrimaryColor = Color(0xFFE95422); // Orange/Red

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  int _rating = 0; // For star rating
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  // Build a star widget (filled or unfilled)
  Widget _buildStar(int index) {
    return IconButton(
      icon: Icon(
        index <= _rating ? Icons.star : Icons.star_border,
        color: kPrimaryColor,
        size: 36,
      ),
      onPressed: () {
        setState(() {
          _rating = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,

      // ------------------ APP BAR ------------------
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          "Leave a Review",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            "assets/svg/BackIcon.svg",
            height: 24,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),

      // ------------------ BODY ------------------
      body: Container(
        width: double.infinity,
        height: size.height - 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),

          child: SingleChildScrollView(
            child: Column(
              children: [
                // --- ICON ---
                SvgPicture.asset(
                  "assets/svg/Cancel.svg",
                  height: 100,
                  colorFilter:
                      const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
                ),

                const SizedBox(height: 25),

                // --- TITLE (Dish Name) ---
                const Text(
                  "Chicken Curry",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: kPrimaryColor,
                  ),
                ),

                const SizedBox(height: 10),

                // --- SUBTITLE ---
                const Text(
                  "We'd love to know what you\nthink of your dish.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),

                const SizedBox(height: 25),

                // ------------------ STAR RATING ------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStar(1),
                    _buildStar(2),
                    _buildStar(3),
                    _buildStar(4),
                    _buildStar(5),
                  ],
                ),

                const SizedBox(height: 30),

                // ------------------ FEEDBACK INPUT FIELD ------------------
                TextField(
                  controller: _feedbackController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Write your review...",
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kPrimaryColor, width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kPrimaryColor, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // ------------------ BUTTONS ------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // CANCEL BUTTON
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: kPrimaryColor, width: 2),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    // SUBMIT BUTTON
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint("Rating: $_rating");
                          debugPrint("Feedback: ${_feedbackController.text}");

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const Home(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
