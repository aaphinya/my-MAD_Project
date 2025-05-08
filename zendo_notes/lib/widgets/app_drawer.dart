import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/providers/auth.dart';
import '/screens/text_to_speech_screen.dart';

// ignore: must_be_immutable
class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});
  Divider divider = const Divider(color: Colors.white);
//โปรไฟล์เรา
  final imageUrl =
      // 'https://as1.ftcdn.net/v2/jpg/06/83/94/48/1000_F_683944847_DhBNwvUdDDKNT5IFzn8uKK0Jux3pSm9L.jpg';
      //'https://img.freepik.com/free-vector/hand-drawn-illustration-spring-season-celebration_52683-158590.jpg';
      //'https://cdn-icons-png.freepik.com/512/11886/11886054.png';
      //'https://cdn-icons-png.freepik.com/512/8832/8832485.png';
      'https://img.freepik.com/free-psd/3d-render-avatar-character_23-2150611737.jpg';

  Widget cutomListTile({
    required BuildContext ctx,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      tileColor: Colors.grey[200],
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 30,
      ),
      title: Text(
        title,
        style: GoogleFonts.mavenPro(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.white,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          divider,
          cutomListTile(
            ctx: context,
            title: 'เพิ่มการบันทึกใหม่',
            icon: Icons.note_add_rounded,
            onTap: () {
              Scaffold.of(context).closeDrawer();
              Navigator.of(context).pushNamed(TextToSpeechScreen.routeName);
            },
          ),
          divider,
          cutomListTile(
            ctx: context,
            title: 'ออกจากระบบ',
            icon: Icons.logout,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('คุณแน่ใจ?'),
                    content: const Text('คุณต้องการออกจากระบบใช่ไหม ?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('ไม่'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Provider.of<Auth>(context, listen: false).logout();
                        },
                        child: const Text('ใช่'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
