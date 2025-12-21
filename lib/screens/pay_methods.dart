import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/widget/card.dart';

// Constants for colors
const Color kBackgroundColor = Color(0xFFF5CB58);
const Color kPrimaryColor = Color(0xFFE95422);

class PayMethods extends StatefulWidget {
  const PayMethods({super.key});

  @override
  State<PayMethods> createState() => _PayMethodsState();
}

class _PayMethodsState extends State<PayMethods> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> payMethods = [
    {"method": "*** *** **** 4242", "icon": Icons.credit_card, "type": "Card"},
    {
      "method": "PayPal",
      "icon": Icons.account_balance_wallet,
      "type": "Paypal",
    },
    {"method": "Apple Pay", "icon": Icons.phone_iphone, "type": "Apple"},
    {"method": "Google Pay", "icon": Icons.android, "type": "Google"},
  ];

  // Logic to determine button text
  String getButtonText() {
    final type = payMethods[_selectedIndex]['type'];
    if (type == "Card") {
      return "Add Card";
    } else if (type == "Paypal") {
      return "Add Pay Account";
    } else if (type == "Apple") {
      return "Add Apple Pay";
    } else if (type == "Google") {
      return "Add Google Pay";
    }
    return "Add Payment Method";
  }

  String getSetupRoute() {
    final type = payMethods[_selectedIndex]['type'];
    if (type == "Card") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CardPay()),
      );
    } else if (type == "Paypal") {
      return "/add_paypal";
    } else if (type == "Apple") {
      return "/add_applepay";
    } else if (type == "Google") {
      return "/add_googlepay";
    }
    return "/";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        toolbarHeight: 100,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Payment Methods",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset("assets/svg/BackIcon.svg", height: 24),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            // The List of payment methods
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: payMethods.length,
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Color(0xFFEEEEEE),
                  ),
                  itemBuilder: (context, index) {
                    final method = payMethods[index];
                    final isSelected = _selectedIndex == index;
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 8,
                      ),
                      leading: Icon(
                        method['icon'],
                        color: isSelected ? kPrimaryColor : Colors.black87,
                      ),
                      title: Text(
                        method['method'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        isSelected
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: isSelected ? kPrimaryColor : Colors.grey,
                      ),
                      onTap: () => setState(() => _selectedIndex = index),
                    );
                  },
                ),
              ),
            ),

            // The Dynamic Button at the bottom
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to your next page here
                  getSetupRoute();

                  print(
                    "Navigating to setup for:\n ${payMethods[_selectedIndex]['method']}",
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  getButtonText(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
