import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/ui/components/text_with_background.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/nav.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
import 'package:popover/popover.dart';

Future<void> showProfileConnectionRequest(BuildContext context) {
  return showPopover(
    context: context,
    backgroundColor: Cr.colorPrimary,
    barrierDismissible: true,
    bodyBuilder: (context) => MouseRegion(
      onExit: (_) => Nav.pop(context),
      child: Center(
        child: ListView(
          children: [
            Container(
              width: 200,
              color: Cr.colorPrimary,
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: Di.PSS),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "CONNECTION REQUEST",
                          style: h5Bold.copyWith(color: Cr.whiteColor),
                        ),
                        Di.SBWES,
                        const TextWithBackground(
                          text: "2",
                          textColor: Cr.darkBlue9,
                          padding: 0,
                          paddingHorizantal: 4,
                          backgroundColor: Cr.darkBlue5,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextWithBackground(
                          icon: const Icon(
                            Icons.mail,
                            color: Cr.whiteColor,
                            size: 16,
                          ),
                          sizedBoxBetweenIconText: Di.SBWES,
                          text: "Invite people to join",
                          backgroundColor: Cr.whiteColorWithOpacity(.07),
                          textStyle: h5Bold.copyWith(color: Cr.whiteColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Di.SBHES,
            const ConnectionRequestAppbarComponent(),
            const ConnectionRequestAppbarComponent(),
            Container(
              color: Cr.whiteColor,
              padding: const EdgeInsets.only(
                top: Di.PSS,
                bottom: Di.PSS,
                left: Di.PSD,
              ),
              child: Text(
                "View all connections",
                style: h5Bold.copyWith(
                  color: Cr.accentBlue1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    direction: PopoverDirection.bottom,
    height: 240,
    width: 460,
    arrowHeight: 10,
    arrowWidth: 10,
  );
}

class ConnectionRequestAppbarComponent extends StatelessWidget {
  const ConnectionRequestAppbarComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cr.whiteColor,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/avatar.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Di.SBWD,
          SizedBox(
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      "Sarah Lee",
                      style: h4Bold,
                    ),
                    Di.SBWES,
                    Text(
                      "MHL",
                      style: dividerTextSmall,
                    )
                  ],
                ),
                Text(
                  "General Manager, One & Only Hotel",
                  style: bodySmallRegular.copyWith(
                    color: Cr.darkGrey1,
                  ),
                ),
                Text(
                  "3 hours ago",
                  style: bodySmallRegular.copyWith(
                    color: Cr.darkGrey1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Future<Object?> showProfileHoverSubmenu(BuildContext context) {
//   return showPopover(
//     backgroundColor: Cr.colorPrimary,
//     context: context,
//     barrierDismissible: true,
//     bodyBuilder: (context) => MouseRegion(
//       onExit: (_) => Nav.pop(context),
//       child:
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: Di.PSES),
//         child: ListView(
//           children: [
//             _SubMenuWidget(
//               text: "View profile",
//             ),
//             _SubMenuWidget(
//               text: "Account settings",
//             ),
//             _SubMenuWidget(
//               text: "Privacy settings",
//             ),
//             _SubMenuWidget(
//               text: "Log out",
//             ),
//           ],
//         ),
//       ),
//     ),
//     direction: PopoverDirection.bottom,
//     height: null,
//     width: 160,
//     arrowHeight: 10,
//     arrowWidth: 10,
//   );
// }

// class _SubMenuWidget extends StatelessWidget {
//   const _SubMenuWidget({
//     Key? key,
//     required this.text,
//   }) : super(key: key);
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return OnHover(
//       builder: (bool isHovered) {
//         return Container(
//           color: isHovered ? Cr.whiteColorWithOpacity(.07) : Cr.colorPrimary,
//           child: ListTile(
//             title: Text(text,
//                 style: defaultRegular.copyWith(
//                   color: Cr.grey1,
//                   fontWeight: isHovered ? FontWeight.w500 : null,
//                 )
//                 //  TextStyle(
//                 //   color: Cr.grey1,
//                 //   fontWeight: isHovered ? FontWeight.w500 : null,
//                 // ),
//                 ),
//           ),
//         );
//       },
//     );
//   }
// }
