import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Constants for colors
const Color kBackgroundColor = Color(0xFFF5CB58);
const Color kPrimaryColor = Color(0xFFE95422);

class Profile extends StatelessWidget {
  const Profile({super.key});

  // Helper method to build consistent text form fields
  // IMPORTANT: This method must be defined outside of the build method
  // and should not return a full Scaffold.
  Widget _buildTextField({
    required String initialValue,
    required String label, // Changed from textinput to label for standard use
    // required IconData icon, // Re-added icon as required for the design
    TextInputType keyboardType = TextInputType.text,
  }) {
    // The fill color used in the form fields
    const Color kTextFieldFillColor = Color(0xFFF3E9B5); 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The text label above the input field
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            // labelText: label, // Using the Text widget above, so removing labelText
            // prefixIcon: Icon(icon, color: kPrimaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: kTextFieldFillColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          ),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          "Profile",
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
          ),
        ),
      ),
      body: Container(
        height: size.height - 100,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Profile Image and Edit Icon
                Center(
                  child: Stack(
                    children: [
                      // User Image container
                      Container(
                        width: 100, // Explicit size for the image area
                        height: 100,
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15), // Border radius
                          child: Image.asset(
                            "assets/images/user.JPG", // Replace with valid path
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      
                      // Camera Icon - Positioned on top-right of the image
                      Positioned(
                        // Use negative offsets to slightly overlap the border
                        top: 75,
                        right: -4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 18,
                            ),
                            padding: const EdgeInsets.all(3), 
                            constraints: const BoxConstraints(),
                            iconSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),

                // Edit Profile Details Header
                const Text(
                  "Edit Profile Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 15),

                // Form Fields (Now using the fixed helper method)
                _buildTextField(
                  label: "Full Name",
                  initialValue: "John Doe",
                  // icon: Icons.person,
                ),
                const SizedBox(height: 15),

                _buildTextField(
                  label: "Date of Birth",
                  initialValue: "1990-01-01",
                  // icon: Icons.calendar_today,
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 15),

                _buildTextField(
                  label: "Email",
                  initialValue: "john.doe@example.com",
                  // icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),

                _buildTextField(
                  label: "Phone",
                  initialValue: "+1 555 123 4567",
                  // icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 40),

                // Update Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement logic to update profile data
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile Update Attempted!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      child: const Text(
                        "Update Profile",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}