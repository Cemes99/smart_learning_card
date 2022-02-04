
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_learning_card/app/feature/home/views/home_screen.dart';
import 'package:smart_learning_card/app/screens/profile_details_screen.dart';
import '../../global/global.dart';

class ButtonProfile extends StatelessWidget {
  const ButtonProfile({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        height: 50,
        width: width,
        child: TextButton(
          onPressed: () {
            if(name == 'Xem thông tin người dùng') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileDetails()
                  ),
              );
            }
            if(name == 'Đăng xuất') {
              global = false;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen()
                ),
                (Route<dynamic> route) => false
              );
            }
          },
          child: Text(
            name,
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}
