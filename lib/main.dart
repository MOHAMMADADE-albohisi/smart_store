import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/prefs/shared_pref_controller.dart';
import 'package:smart_store/screens/app/Profile/Profile_screen.dart';
import 'package:smart_store/screens/app/addresses/address_view_screen.dart';
import 'package:smart_store/screens/app/addresses/addresse_screen.dart';
import 'package:smart_store/screens/app/bottom_anvigator_screen.dart';
import 'package:smart_store/screens/app/caets/card_Screen.dart';
import 'package:smart_store/screens/app/caets/mycards_screen.dart';
import 'package:smart_store/screens/app/cards/cards_screen.dart';
import 'package:smart_store/screens/app/categorie/categories_screen.dart';
import 'package:smart_store/screens/app/categorie/subcategories_screen.dart';
import 'package:smart_store/screens/app/notifications/notifications_screen.dart';
import 'package:smart_store/screens/app/orders/orderdetails_screen.dart';
import 'package:smart_store/screens/app/orders/orders%20_screen.dart';
import 'package:smart_store/screens/app/prducts/Product_details_screen.dart';
import 'package:smart_store/screens/app/prducts/prducts_screen.dart';
import 'package:smart_store/screens/app/favorite_screen.dart';
import 'package:smart_store/screens/app/home_screen.dart';
import 'package:smart_store/screens/app/settings/about_screen.dart';
import 'package:smart_store/screens/app/settings/change_password.dart';
import 'package:smart_store/screens/app/settings/edit_mobile.dart';
import 'package:smart_store/screens/app/settings/saqs_screen.dart';
import 'package:smart_store/screens/app/settings/setting_screen.dart';
import 'package:smart_store/screens/auth/forget_screen.dart';
import 'package:smart_store/screens/auth/login_screen.dart';
import 'package:smart_store/screens/auth/register_screen.dart';
import 'package:smart_store/screens/auth/reset_password_screen.dart';
import 'package:smart_store/screens/auth/verification/change_password.dart';
import 'package:smart_store/screens/auth/verification/verification_forget_screen.dart';
import 'package:smart_store/screens/core/launch_screen.dart';
import 'package:smart_store/screens/core/outboarding_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
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
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
          ],
          locale: const Locale('ar'),
          initialRoute: '/lunch_screen',
          routes: {

            '/lunch_screen': (context) => const lunch_screen(),
            '/onbressd_screen': (context) => const OnBordings_screen(),

            '/login_screen': (context) => const login_screen(),
            '/register_screen': (context) => const register_screen(),
            '/forget_screen': (context) => const forgetPassword_screen(),
            '/verification_forget_screen': (context) =>  verification_forget_screen(),
            '/resetPassword_screen': (context) => const resetPassword_screen(),
            '/home_screen': (context) => const home_screen(),
            '/categories_screen': (context) => const categories_screen(),
            '/bottomed_screen': (context) => const bottomanvigator(),
            '/Productdetails_screen': (context) =>  const Productdetails_screen(),



            '/favorite_screen': (context) => const favorite_screen(),
            '/addresses_screen': (context) => const addresses_screen(),
            '/view_address_screen': (context) => const view_address_screen(),
            '/order_screen': (context) => const order_screen(),
            '/orderdetails_screen': (context) => const orderdetails_screen(),
            '/carts_screen': (context) => const carts_screen(),
            '/notifications_screen': (context) => const notifications_screen(),
            '/change_password': (context) => const change_password(),
            '/card_screen': (context) => const CreditCard_screen(),
            '/mycards_screen': (context) => const mycards_screen(),
            '/setting_screen': (context) => const setting_screen(),
            '/EditProfileScreen': (context) => const EditProfileScreen(),
            '/ChangePasswordScreen': (context) => const ChangePasswordScreen(),
            '/EditeMobileScreen': (context) => const EditeMobileScreen(),
            '/about_screen': (context) => const bioscreen(),
            '/saqs_screen': (context) => const faqsscreen(),
          },
        );
      },
    );
  }
}
