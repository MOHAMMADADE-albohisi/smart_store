import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screens/app/addresses/address_view_screen.dart';
import 'package:smart_store/screens/app/addresses/addresse_screen.dart';
import 'package:smart_store/screens/app/bottom_anvigator_screen.dart';
import 'package:smart_store/screens/app/caets/card_Screen.dart';
import 'package:smart_store/screens/app/categorie/categories_screen.dart';
import 'package:smart_store/screens/app/categorie/subcategories_screen.dart';
import 'package:smart_store/screens/app/prducts/Product_details_screen.dart';
import 'package:smart_store/screens/app/prducts/prducts_screen.dart';
import 'package:smart_store/screens/app/favorite_screen.dart';
import 'package:smart_store/screens/app/home_screen.dart';
import 'package:smart_store/screens/app/settings/setting_screen.dart';
import 'package:smart_store/screens/auth/forget_screen.dart';
import 'package:smart_store/screens/auth/homelogin_screen.dart';
import 'package:smart_store/screens/auth/login_screen.dart';
import 'package:smart_store/screens/auth/register_screen.dart';
import 'package:smart_store/screens/auth/reset_password_screen.dart';
import 'package:smart_store/screens/auth/verification/registration_verification_screen.dart';
import 'package:smart_store/screens/auth/verification/verification_forget_screen.dart';
import 'package:smart_store/screens/core/launch_screen.dart';
import 'package:smart_store/screens/core/outboarding_screen.dart';

void main() {
  runApp(const smart_store());
}

// ignore: camel_case_types
class smart_store extends StatelessWidget {
  const smart_store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              centerTitle: true,
              elevation: 0,
              color: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.black54),

              titleTextStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.black54,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates:const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('ar'),
            Locale('en'),
          ],
          locale: Locale('en'),

          initialRoute: '/lunch_screen',
          routes: {
            '/lunch_screen': (context) => const lunch_screen(),
            '/onbressd_screen': (context) => const onbressd_screen(),
            '/homelogin_screen': (context) => const homelogin_screen(),
            '/login_screen': (context) => const login_screen(),
            '/register_screen': (context) => const register_screen(),
            '/forget_screen': (context) => const forgetPassword_screen(),
            '/verification_forget_screen': (context) => const verification_forget_screen(),
            '/resetPassword_screen': (context) => const resetPassword_screen(),
            '/registration_verification_screen': (context) => const registration_verification_screen(),
            '/home_screen': (context) => const home_screen(),
            '/bottoma_screen': (context) => const bottomanvigator(),
            '/favorite_screen': (context) => const favorite_screen(),
            '/categories_screen': (context) => const categories_screen(),
            '/subcategories_screen': (context) => const subcategories(),
            '/prducts_screen': (context) => const prducts_screen(),
            '/Productdetails_screen': (context) => const Productdetails_screen(),
            '/addresses_screen': (context) => const addresses_screen(),
            '/view_address_screen': (context) => const view_address_screen(),
            '/card_screen': (context) =>  CreditCard_screen(),

            '/setting_screen': (context) => const setting_screen(),

          },
        );
      },
    );
  }
}
