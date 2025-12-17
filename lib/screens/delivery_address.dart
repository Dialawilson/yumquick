import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color kBackgroundColor = Color(0xFFF5CB58);
const kPrimaryColor = Color(0xFFE95422);
class AddressSelection extends StatefulWidget{
  const AddressSelection({super.key});

  @override
  State<AddressSelection> createState() => _AddressSelectionState();

}

class _AddressSelectionState extends State<AddressSelection>{
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> addresses = [
    {
      "title":"My Home",
      "address" : "12 Admiralty way, leki, lagos",
      'icon': Icons.home,
    },
    {
      "title":"My Ofice",
      "address" : "5 Allen Avenue Ikeja, Lagos",
      'icon': Icons.business,
    },
    {
      "title":"Parents House",
      "address" : "35 chibykie Avenue ejaforce, port harcourt",
      'icon': Icons.family_restroom,
    }

  ];

  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index){
        final item = addresses[index];
        return Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kBackgroundColor,
            toolbarHeight: 100,
            centerTitle: true,
            title: const Text("Delivery Address",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 22
            ),),
            leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: SvgPicture.asset("assets/svg/BackIcon.svg", height: 24,)),
          ),
          body: Container(
            height: size.height - 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white
            ),
          ),
        );
      });
  }
}