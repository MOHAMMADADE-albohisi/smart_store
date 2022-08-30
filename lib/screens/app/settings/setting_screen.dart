// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class setting_screen extends StatefulWidget {
  const setting_screen({Key? key}) : super(key: key);

  @override
  State<setting_screen> createState() => _setting_screenState();
}

class _setting_screenState extends State<setting_screen> {
  late String _language = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          SizedBox(
            height: 60,
            child: TextButton(
              onPressed: () {
                _showLanguage();
              },
              child: Row(
                children: [
                  Text(
                    'Language',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.language),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 60,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/EditProfileScreen');
              },
              child: Row(
                children: [
                  Text(
                    'Profile',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.person_outlined),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 60,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/EditeMobileScreen');
              },
              child: Row(
                children: [
                  Text(
                    'Edit mobile',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.phone_rounded),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 60,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ChangePasswordScreen');
              },
              child: Row(
                children: [
                  Text(
                    'Change password',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.lock),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 60,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/saqs_screen');
              },
              child: Row(
                children: [
                  Text(
                    'FAQS',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.question_answer),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 60,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about_screen');
              },
              child: Row(
                children: [
                  Text(
                    'About',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 60,
            child: TextButton(
              onPressed: () {
                _confirmeLogoute();
              },
              child: Row(
                children: [
                  Text(
                    'Logout',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.logout),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguage() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      context: (context),
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'languages',
                    style: GoogleFonts.cairo(
                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Chose language',
                    style: GoogleFonts.cairo(
                        height: 1.0,
                        fontSize: 14.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.w300),
                  ),
                  const Divider(),
                  RadioListTile<String>(
                    title: Text(
                      'English',
                      style: GoogleFonts.cairo(),
                    ),
                    value: 'en',
                    groupValue: _language,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() => _language = value);
                        Navigator.pop(context, 'en');
                      }
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(
                      'العربية',
                      style: GoogleFonts.cairo(),
                    ),
                    value: 'ar',
                    groupValue: _language,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() => _language = value);
                        Navigator.pop(context, 'ar');
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _confirmeLogoute() async {
    bool? test = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Conform Logout',
            style: GoogleFonts.cairo(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          content: Text(
            'Are you suer?',
            style: GoogleFonts.cairo(
              fontSize: 13,
              color: Colors.black45,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'Conform',
                style: GoogleFonts.cairo(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.cairo(
                  fontSize: 12,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        );
      },
    );
    if (test ?? false) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }

}
