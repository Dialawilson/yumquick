import 'package:flutter/material.dart';

// ===== EMPTY STATE ======
// import 'package:flutter_svg/flutter_svg.dart';
// =======================


// ===ACTIVE STATE ======
import 'package:yumquick/widget/activeorder.dart';
// =======================

const Color kPrimaryColor = Color(0xFFE95422);
const Color kBackgroundColor = Color(0xFFF5CB58);
const Color btn = Color.fromARGB(255, 255, 207, 207);

class OrdersComponent extends StatefulWidget {
  const OrdersComponent({super.key});

  @override
  State<OrdersComponent> createState() => _OrdersComponentState();
}

class _OrdersComponentState extends State<OrdersComponent> {
  int _selectedIndex = 0; // 0 = Active, 1 = Completed, 2 = Cancelled
  String? _cancelReason;
  final TextEditingController _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔘 Buttons row with left/right padding
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // 👈 space left/right
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 110, // 👈 fixed width
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedIndex == 0 ? kPrimaryColor : btn,
                  ),
                  onPressed: () => setState(() => _selectedIndex = 0),
                  child: Text(
                    "Active",
                    style: TextStyle(
                      color: _selectedIndex == 0 ? Colors.white : kPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 111,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedIndex == 1 ? kPrimaryColor : btn,
                  ),
                  onPressed: () => setState(() => _selectedIndex = 1),
                  child: Text(
                    "Completed",
                    style: TextStyle(
                      color: _selectedIndex == 1 ? Colors.white : kPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedIndex == 2 ? kPrimaryColor : btn,
                  ),
                  onPressed: () => setState(() => _selectedIndex = 2),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: _selectedIndex == 2 ? Colors.white : kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // 📌 Content area
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              // 🟢 Active Orders
              Wrap(
                alignment: WrapAlignment.center,
                // spacing: 10,
                
                children: [


                  // ===== EMPTY STATE =====
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //           SvgPicture.asset("assets/svg/activeorders.svg", height: 150,),
                  //           SizedBox(height: 20),
                  //                Center(
                  //                  child: Text(
                  //                   "You don't have any active orders at this time",
                  //                   style: const TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.w500,
                  //                     color: kPrimaryColor,
                  //                   ),
                  //                                                  ),
                  //                ),
                      
                  //   ],
                  // ),
                  // ==========================

                // ====== Active Order Item(s) =====
                const Activeorder()
                // ==================================
              
                ],
              ),

              // ✅ Completed Orders
              Center(
                child: Text(
                  "Completed Orders will be displayed here",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // ❌ Cancel Orders
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Select a reason for cancellation:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    RadioListTile<String>(
                      title: const Text("Delayed delivery"),
                      value: "Delayed delivery",
                      groupValue: _cancelReason,
                      onChanged: (value) => setState(() => _cancelReason = value),
                    ),
                    RadioListTile<String>(
                      title: const Text("Wrong item"),
                      value: "Wrong item",
                      groupValue: _cancelReason,
                      onChanged: (value) => setState(() => _cancelReason = value),
                    ),
                    RadioListTile<String>(
                      title: const Text("Changed my mind"),
                      value: "Changed my mind",
                      groupValue: _cancelReason,
                      onChanged: (value) => setState(() => _cancelReason = value),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _reasonController,
                      decoration: const InputDecoration(
                        labelText: "Additional reason",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                        ),
                        onPressed: () {
                          final reason = _cancelReason ?? "No reason selected";
                          final extra = _reasonController.text;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Submitted: $reason | $extra")),
                          );
                        },
                        child: const Text("Submit"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
