import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class setting_screen extends StatefulWidget {
  const setting_screen({Key? key}) : super(key: key);

  @override
  State<setting_screen> createState() => _setting_screenState();
}

class _setting_screenState extends State<setting_screen> {
  bool _notifications = true;
  late String _language='en';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            inactiveThumbColor: Colors.grey,
            title: Text(
              'Notifications',
              style: GoogleFonts.montserrat(),
            ),
            subtitle: Text(
              'Turn Notifications On/Off',
              style: GoogleFonts.montserrat(),
            ),
            value: _notifications,
            onChanged: (bool value) {
              setState(() => _notifications = value);
            },
          ),
          Container(
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
                  Spacer(),
                  Icon(Icons.language),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 60,
            child: TextButton(
              onPressed: () {
               //
              },
              child: Row(
                children: [
                  Text(
                    'Edit Profile',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.person_outlined),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 60,
            child: TextButton(
              onPressed: () {
               //
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
                  Spacer(),
                  Icon(Icons.phone_rounded),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 60,
            child: TextButton(
              onPressed: () {
               //
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
                  Spacer(),
                  Icon(Icons.lock),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 60,
            child: TextButton(
              onPressed: () {
               //
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
                  Spacer(),
                  Icon(Icons.question_answer),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 60,
            child: TextButton(
              onPressed: () {
               //
              },
              child: Row(
                children: [
                  Text(
                    'Addresses',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.location_on_outlined),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 60,
            child: TextButton(
              onPressed: () {
               //
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
          SizedBox(height: 15),
          Container(
            height: 60,
            child: TextButton(
              onPressed: () {
                //
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
                  Spacer(),
                  Icon(Icons.logout),
                ],
              ),
            ),
          ),




        ],
      ),
    );
  }

  void _showLanguage()  {
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
              padding:
              EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
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
}
