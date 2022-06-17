import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.iconData,
    this.icon,
    this.showNotification = false,
  }) : super(key: key);

  final IconData? iconData;
  final Widget? icon;
  final bool showNotification;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 45,
      child: Stack(
        children: [
          Center(
            child: icon ??
                Icon(
                  iconData,
                  color: Cr.darkBlue9,
                  size: 20,
                ),
          ),
          showNotification
              ? Positioned(
                  right: 0,
                  top: 4,
                  child: Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                      color: Cr.redTextColor,
                      borderRadius: BorderRadius.circular(Di.RSETS),
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Cr.whiteColor,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
