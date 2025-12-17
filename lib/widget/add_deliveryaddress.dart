import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Constants for colors
const Color kBackgroundColor = Color(0xFFF5CB58);
const Color kPrimaryColor = Color(0xFFE95422);

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({super.key});

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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
          "Add New Address",
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SvgPicture.asset("assets/svg/homedp.svg"),
                  ),

                  const SizedBox(height: 30),

                  // Address Title
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: "Address Title",
                      hintText: "e.g Home, Office",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter address title";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Address Details
                  TextFormField(
                    controller: addressController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: "Address",
                      hintText: "Enter full delivery address",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your address";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Access values
                          final title = titleController.text;
                          final address = addressController.text;

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Address saved successfully"),
                            ),
                          );

                          // TODO: send to backend / state management
                        }
                      },
                      child: const Text(
                        "Save Address",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
