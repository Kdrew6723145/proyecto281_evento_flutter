/* import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const 

     Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 90.0,
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "assets/icons/ico_explore.svg",
              color: AppColors.kBase,
            ),
            SvgPicture.asset("assets/icons/ico_play.svg",
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 0, 68, 255), BlendMode.srcIn)),
            const CircleAvatar(
              backgroundColor: AppColors.kBase,
              child: Icon(Icons.add, color: Colors.white),
            ),
            SvgPicture.asset(
              "assets/icons/ico_live.svg",
              color: AppColors.kSecondary,
            ),
            SvgPicture.asset(
              "assets/icons/ico_square.svg",
              color: AppColors.kSecondary,
            ),
          ],
        ),
      ),
    );

  }
}
 */