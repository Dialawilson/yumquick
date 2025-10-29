import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SetPassword extends StatelessWidget{
  const SetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5CB58),
      appBar: PreferredSize(preferredSize: const Size.fromHeight(120), 
      child: AppBar(
        backgroundColor: const Color(0xFFF5CB58),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: SvgPicture.asset("assets/svg/BackIcon.svg",
                  height: 24,)
        ),
        title: const Text(
          "Set Password",
          style: TextStyle(
            fontSize: 26,
            color:Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      )
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
              const SizedBox(height: 25),
              const Text(
                "New Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your new password',
                  fillColor: const Color(0xFFF5CB58),
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Confirm Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Re-enter your new password',
                  fillColor: const Color(0xFFF5CB58),
                  filled: true,
                ),
                ),
              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFE95422),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Set Password',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}