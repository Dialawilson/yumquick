import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/screens/signup.dart';
import 'package:yumquick/screens/setpassword.dart';
import 'package:yumquick/screens/home.dart';


// Define theme colors as constants for clarity and reuse
const Color kPrimaryColor = Color(0xFFE95422); // Orange/Red for buttons
const Color kBackgroundColor = Color(0xFFF5CB58); // Yellow for background/fields
const Color kSocialButtonColor = Color(0xFFFFDECF); // Light pink for social buttons

// ⭐ 1. CONVERTED TO STATEFULWIDGET
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ⭐ 2. STATE VARIABLE for password visibility
  bool _isPasswordVisible = false;

  // Helper function to create the TextField decoration for clean code
  InputDecoration _buildInputDecoration(String hint, {Widget? suffixIcon}) {
    // Define a standard border style for consistency
    const borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: kBackgroundColor, // Use the same color as the fill
        width: 0,
      ),
    );

    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: kBackgroundColor,
      // Apply the border style to all states for consistency
      border: borderStyle,
      enabledBorder: borderStyle,
      focusedBorder: borderStyle.copyWith(
          borderSide: const BorderSide(color: kPrimaryColor, width: 2)), // Highlight focus
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      suffixIcon: suffixIcon, // Add the suffix icon if provided
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100), // Adjusted height
        child: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          centerTitle: true,
          toolbarHeight: 100,
          title: const Text(
            "Log In",
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              "assets/svg/BackIcon.svg",
              height: 24,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn), // Ensure it is white
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        // ⭐ Removed height: double.infinity
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // You removed the "Welcome" text here, ensure this is correct
              const Text(
                "Welcome", // Added back, assuming this was an accidental removal
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 25),
              
              // --- Email Field ---
              const Text(
                "Email or Mobile Number",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: _buildInputDecoration("example@example.com"),
              ),
              
              const SizedBox(height: 20),
              
              // --- Password Field ---
              const Text(
                "Password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                // ⭐ 3. Toggle obscuring text based on the state variable
                obscureText: !_isPasswordVisible, 
                decoration: _buildInputDecoration(
                  "Enter your password",
                  // ⭐ 4. Suffix Icon logic
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Toggle the state
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      // Change icon based on state
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 14),
              
              // --- Forgot Password Link ---
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // ⭐ 5. Fixed navigation: ensure SetPassword is instantiated correctly
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SetPassword()));
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 60),
              
              // --- Log In Button ---
              Center(
                child: SizedBox(
                  width:250,
                  child: ElevatedButton(
                    onPressed: () {
                      // ⭐ 6. Fixed navigation: ensure Home is instantiated correctly
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // --- Or Sign Up With Text ---
              const Center(
                child: Text(
                  "Or Sign Up With",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              
              // --- Social Buttons ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialButton(iconPath: 'assets/svg/Gmail.svg', onPressed: () {}),
                  const SizedBox(width: 20,),
                  _SocialButton(iconPath: 'assets/svg/Facebook.svg', onPressed: () {}),
                  const SizedBox(width: 20,),
                  _SocialButton(iconPath: 'assets/svg/Mark.svg', onPressed: () {}),
                ],
              ),
              
              const SizedBox(height: 20,),
              
              // --- Don't have an account? Sign Up ---
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to SignUp page
                        Navigator.push(
                          context,
                          // ⭐ 7. Fixed navigation: ensure SignUp is instantiated correctly
                          MaterialPageRoute(builder: (context) => const SignUp()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Stateless Widget for Social Buttons (reusable)
class _SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;

  const _SocialButton({required this.onPressed, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kSocialButtonColor, // Use constant color
          borderRadius: BorderRadius.circular(30),
        ),
        child: SvgPicture.asset(
          iconPath,
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}