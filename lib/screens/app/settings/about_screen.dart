// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/widgets/utils/about_castom.dart';

class bioscreen extends StatelessWidget {
  const bioscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'About',
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.topEnd,
            colors: [
              Colors.grey,
              Color(0xFFD6EFED),
            ],
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
             Container(
              width: 250,
              height: 150,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(25),
               ),
               child: Image.asset('images/image_1.png'),
            ),

            const SizedBox(height: 10), // بعد الصورة عن النص

            Text(
              'Smart Store',
              style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              thickness: 0.6,
              color: Color(0xFF898AA6),
              indent: 40,
              endIndent: 40,
              height: 50,
            ),
            CustomListTitleCard(
              ledingIcon: Icons.facebook,
              title: 'FaceBook',
              onActionPressed: () {
               //
              },
              trailingIcon: Icons.send,
              marginBotem: 10,
            ),

            CustomListTitleCard(
              ledingIcon: Icons.whatsapp,
              title: 'Whatsapp',
              onActionPressed: () {
                //
              },
              trailingIcon: Icons.send,
              marginBotem: 10,
            ),

            CustomListTitleCard(
              ledingIcon: Icons.email,
              title: 'Email',
              onActionPressed: () {
              //
              },
              trailingIcon: Icons.send,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
              children: const [
                Text(
                  'Dev: Mohammad Albohisi',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black38,
                  ),
                ),
                Spacer(),
                Text(
                  'UCASIT',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black38,
                  ),
                ),
              ],
          ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

}
