import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/widget/add_deliveryaddress.dart';
import 'package:yumquick/widget/bottomNav.dart';

const Color kBackgroundColor = Color(0xFFF5CB58);
const Color kPrimaryColor = Color(0xFFE95422);
const Color kCardColor = Color(0xFFF8F8F8);
const Color kSelectedCardColor = Color(0xFFFFF2E8);

class AddressSelection extends StatefulWidget {
  const AddressSelection({super.key});

  @override
  State<AddressSelection> createState() => _AddressSelectionState();
}

class _AddressSelectionState extends State<AddressSelection> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> addresses = [
    {
      "title": "My Home",
      "address": "12 Admiralty Way, Lekki, Lagos",
      "icon": Icons.home,
    },
    {
      "title": "My Office",
      "address": "5 Allen Avenue, Ikeja, Lagos",
      "icon": Icons.business,
    },
    {
      "title": "Parents House",
      "address": "35 Chibykie Avenue, Port Harcourt",
      "icon": Icons.family_restroom,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        toolbarHeight: 100,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Delivery Address",
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

      // 🔹 BODY
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            // 🔹 ADDRESS LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 16),
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final item = addresses[index];
                  final isSelected = _selectedIndex == index;

                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? kSelectedCardColor
                          : kCardColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? kPrimaryColor
                            : Colors.transparent,
                        width: 1.2,
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(item['icon'], size: 28),
                      title: Text(
                        item['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(item['address']),
                      trailing: Radio<int>(
                        value: index,
                        groupValue: _selectedIndex,
                        activeColor: kPrimaryColor,
                        onChanged: (value) {
                          setState(() {
                            _selectedIndex = value!;
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            // 🔹 BOTTOM BUTTON
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddDeliveryAddress(),
                      ),
                    );
                  },
                  child: const Text(
                    "add new address",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
