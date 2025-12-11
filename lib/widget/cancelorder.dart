import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/widget/bottomNav.dart';
import 'package:yumquick/widget/closeorder.dart';

// --- Constants ---
const Color kPrimaryColor = Color(0xFFE95422);
const Color kBackgroundColor = Color(0xFFF5CB58);

const List<String> kCancelReasons = [
  "Delay in delivery",
  "Incorrect order details",
  "Change of mind",
  "Found better option",
  "Other (Please specify)",
];

// --- Mock Closeorder ---

// --- Cancelorder Screen ---
class Cancelorder extends StatefulWidget {
  const Cancelorder({super.key});

  @override
  State<Cancelorder> createState() => _CancelorderState();
}

class _CancelorderState extends State<Cancelorder> {
  String? _selectedReason;
  final TextEditingController _otherReasonController = TextEditingController();

  @override
  void dispose() {
    _otherReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      // -------------------- APP BAR --------------------
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        elevation: 0,
        

        toolbarHeight: 100,
        title: const Text(
          "Cancel Order",
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset("assets/svg/BackIcon.svg", height: 24),
        ),
      ),

      // -------------------- BODY --------------------
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // dismiss keyboard
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30,
              ),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Please select the primary reason for canceling your order. Your feedback helps us improve our service.",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 35.0),
                    child: Divider(color: kPrimaryColor, thickness: 0.5),
                  ),

                  // -------------------- RADIO BUTTONS --------------------
                  for (final reason in kCancelReasons)
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedReason = reason;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              children: [
                                // TEXT FIRST
                                Expanded(
                                  child: Text(
                                    reason,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),

                                // RADIO ON RIGHT
                                Radio<String>(
                                  value: reason,
                                  groupValue: _selectedReason,
                                  activeColor: kPrimaryColor,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedReason = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (reason != kCancelReasons.last)
                          const Divider(color: kPrimaryColor, height: 1.5),
                      ],
                    ),

                  // -------------------- OTHER TEXT FIELD --------------------
                  if (_selectedReason == "Other (Please specify)")
                    TextField(
                      controller: _otherReasonController,
                      maxLines: 3,
                      onChanged: (_) =>
                          setState(() {}), // enable button on type
                      decoration: InputDecoration(
                        labelText: "Other Reasons",
                        alignLabelWithHint: true,
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),

                  const SizedBox(height: 30),

                  // -------------------- SUBMIT BUTTON --------------------
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        if (_canSubmit()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Closeorder(),
                            ),
                          );
                        }
                      },
                         
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Submit Cancellation",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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

      bottomNavigationBar: BottomNav(),
      
    );
  }

  bool _canSubmit() {
    if (_selectedReason == null) return false;

    if (_selectedReason == "Other (Please specify)") {
      return _otherReasonController.text.trim().isNotEmpty;
    }

    return true;
  }
}
