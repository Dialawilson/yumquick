import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/screens/signup.dart';


class SignUp extends StatelessWidget{
  const SignUp({super.key});

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
        title: const Text(
          "New Account",
          style: TextStyle(
            fontSize: 26,
            color:Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: SvgPicture.asset("assets/svg/BackIcon.svg",
                  height: 24,)),

      )
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Full Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your full name',
                  fillColor: const Color(0xFFF5CB58),
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your password',
                  fillColor: const Color(0xFFF5CB58),
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Email Address",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your email address',
                  fillColor: const Color(0xFFF5CB58),
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              Text("Mobile Number",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              const SizedBox(height:10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: '+1 234 567 8900',
                  fillColor: const Color(0xFFF5CB58),
                  filled: true,
                ),
              ),
              const SizedBox(height: 10,),
              Text("Date of birth",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'MM/DD/YYYY',
                  fillColor: const Color(0xFFF5CB58),
                  filled: true,
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Text("By continuing, you agree to",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],),
                ),
              ),
              GestureDetector(
                onTap: (){
                  // Handle terms and conditions tap
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Terms of Use",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xEEE95322),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text(" and "),
                    Text("Privacy Policy.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xEEE95322),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),  )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: SizedBox(
                  width:250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE95422),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Handle signup action
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "or sign in with",
                    style: TextStyle(
                      color: Color.fromARGB(255, 18, 18, 18),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFDECF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SvgPicture.asset('assets/svg/Gmail.svg', height: 30, width: 30,)
                    ),
                  const SizedBox(width: 20,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFDECF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SvgPicture.asset('assets/svg/Facebook.svg', height: 30,)
                    ),
                  const SizedBox(width: 20,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFDECF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SvgPicture.asset('assets/svg/Mark.svg', height: 30,)
                    ),
              ],),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      // Add navigation to login page here
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        color: Color(0xFFE95422),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              // Add more widgets here for the signup form
            ],
          ),
        ),
      ),
    );
  }
}