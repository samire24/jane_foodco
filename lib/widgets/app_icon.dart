import 'package:flutter/cupertino.dart';
import 'package:jane_foodco/utils/dimension.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backGroundColor;
  final double size;
  final double iconSize;

  const AppIcon(
      {Key? key,
        required this.icon,
        this.iconColor= const Color(0xFF756d54) ,
        this.backGroundColor = const Color(0xFFfcf4e4),
        this.size = 40, this.iconSize = 16
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backGroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
