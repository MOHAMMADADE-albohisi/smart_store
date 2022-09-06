// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/auth_api_controller.dart';
import 'package:smart_store/helpers/contexe_extenssion.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class registration_verification_screen extends StatefulWidget {
  registration_verification_screen(
      {Key? key, required this.mobile, required this.code})
      : super(key: key);

  @override
  State<registration_verification_screen> createState() =>
      _registration_verification_screenState();
  final String mobile;
  final int code;
}

class _registration_verification_screenState
    extends State<registration_verification_screen> with Helpers {
  late TextEditingController _mobile;

  @override
  void initState() {
    super.initState();
    _mobile = TextEditingController()..text = widget.code.toString();
  }

  @override
  void dispose() {
    _mobile.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.verification,
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 200),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  AppLocalizations.of(context)!.verificationamaseeg,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: AppTextField(
                    hint: AppLocalizations.of(context)!.hinttext,
                    prefixIcon: (Icons.phone_android_rounded),
                    keyboardType: TextInputType.number,
                    controller: _mobile,
                  )),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () => performaLogin(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: const Size(
                    327,
                    56,
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.submit,
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void performaLogin() {
    if (checkData()) {
      activate();
    }
  }

  bool checkData() {
    if (_mobile.text.isNotEmpty) {
      return true;
    }
    ShowSnakBar(context,
        messageerroe: AppLocalizations.of(context)!.error_data, error: true);

    return false;
  }

  Future<void> activate() async {
    ApiResponse apiResponse =
        await AuthApiController().activate(widget.mobile, widget.code);
    if (apiResponse.success) {
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
    // ignore: use_build_context_synchronously
    context.ShowSnakBar(
        message: "${apiResponse.message}", error: !apiResponse.success);
  }

// void _confirmeLogoute() async {
//   bool? test = await showDialog<bool>(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 60),
//             child: Column(
//               children: [
//                 Image.asset('images/image_11.png'),
//               ],
//             )),
//         content: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Text(
//             AppLocalizations.of(context)!.verificatinsucc,
//             style: GoogleFonts.cairo(
//               fontSize: 13,
//               color: Colors.black45,
//             ),
//           ),
//         ),
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 50,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.grey,
//                 ),
//                 child: TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/login_screen');
//                     },
//                     child: Text(
//                       'Done',
//                       style: GoogleFonts.cairo(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                         color: Colors.black,
//                       ),
//                     )),
//               ),
//             ],
//           )
//         ],
//       );
//     },
//   );
//   if (test ?? false) {
//     //
//   }
// }
}
