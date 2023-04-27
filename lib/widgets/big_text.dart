import 'package:flutter/material.dart';
import 'package:jane_foodco/utils/dimension.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  double size;
  TextOverflow overflow;

   BigText({
    Key? key,
    required this.text,
    this.color= const Color(0xFF332d2b),
    this.size = 0.0,
    this.overflow = TextOverflow.ellipsis,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: FontWeight.w400,
        fontFamily:'Roboto'
      ),
    );
  }
}
