import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color IconBg = Color(0xFFF3E9B5);

class CategoryIcon extends StatelessWidget{
  const  CategoryIcon({super.key, required this.svgPath});
  final String svgPath;
  
  // const _CategoryIcon({required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: IconBg,
        borderRadius: BorderRadius.circular(30) 
      ),
      child: SvgPicture.asset(
        svgPath,
        height: 50,
        width: 20,
      )
    );
  }
}