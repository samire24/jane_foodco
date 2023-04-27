import 'package:flutter/material.dart';
import 'package:jane_foodco/widgets/small_text.dart';

import '../utils/dimension.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  IconAndTextWidget(
      {Key? key,
        required this.icon,
        required this.text,
        required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: Dimensions.iconSize24,),
        SizedBox(width: 5,),
        SmallText(text: text,)
      ],
    );
  }
}
