// ignore_for_file: camel_case_types, non_constant_identifier_names, duplicate_ignore
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/auth_api_controller.dart';
import 'package:smart_store/helpers/contexe_extenssion.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/login.dart';
import 'package:smart_store/screens/auth/verification/registration_verification_screen.dart';
import 'package:smart_store/widgets/AppTextField.dart';
import 'package:smart_store/widgets/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class register_screen extends StatefulWidget {
  const register_screen({Key? key}) : super(key: key);

  @override
  State<register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> with Helpers {
  late TextEditingController _name;
  late TextEditingController _mobile;
  late TextEditingController _password;
  late TapGestureRecognizer _click;
  bool _viewpassword = true;
  int? cityId;

  String? _gender = 'M';

  List<City> list = [];

  @override
  void initState() {
    super.initState();
    _getCities();
    _name = TextEditingController();
    _mobile = TextEditingController();
    _password = TextEditingController();
    _click = TapGestureRecognizer();
    _click.onTap = createnewacountclick;
  }

  void _getCities() async {
    var apiResponse = await AuthApiController().getCities();
    setState(() => list = apiResponse.data == null ? [] : apiResponse.data!);
    print("test size ${list.length}");
  }

  @override
  void dispose() {
    _name.dispose();
    _mobile.dispose();
    _password.dispose();
    _click.dispose();
    super.dispose();
  }

  void createnewacountclick() {
    Navigator.pushNamed(context, '/login_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: 375.w,
            height: 100.h,
            decoration: const BoxDecoration(
              color: Color(0xFF96E5D1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login_screen');
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                SizedBox(width: 60.w),
                Text(
                  AppLocalizations.of(context)!.register,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 17.h,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFFFFF),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.nameregester),
                AppTextField(
                  hint: AppLocalizations.of(context)!.number,
                  obscureText: false,
                  prefixIcon: Icons.person_outlined,
                  keyboardType: TextInputType.text,
                  controller: _name,
                ),
                SizedBox(height: 20.h),
                Text(AppLocalizations.of(context)!.mobilregister),
                AppTextField(
                  hint: AppLocalizations.of(context)!.number,
                  obscureText: false,
                  prefixIcon: Icons.phone_android_rounded,
                  keyboardType: TextInputType.number,
                  controller: _mobile,
                ),
                SizedBox(height: 20.h),
                Text(AppLocalizations.of(context)!.password),
                AppTextField(
                  hint: AppLocalizations.of(context)!.password,
                  obscureText: true,
                  prefixIcon: Icons.lock,
                  keyboardType: TextInputType.text,
                  controller: _password,
                  sufficIcon: IconButton(
                    onPressed: () {
                      setState(() => {_viewpassword = !_viewpassword});
                    },
                    icon: Icon(_viewpassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(AppLocalizations.of(context)!.city),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: DropdownButton<int>(
                      isExpanded: true,
                      hint: Text(AppLocalizations.of(context)!.selectcountry),
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                      ),
                      onChanged: (int? value) {
                        setState(() => cityId = value);
                      },
                      borderRadius: BorderRadius.circular(20),
                      dropdownColor: Colors.grey.shade200,
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      itemHeight: 48,
                      menuMaxHeight: 250,
                      underline: const Divider(
                        color: Colors.transparent,
                      ),
                      value: cityId,
                      selectedItemBuilder: (BuildContext cotext) {
                        return cityId != null? list.map((e) => Align(alignment: AlignmentDirectional.centerStart,
                                    child: Text( list.firstWhere((element) => element.id == cityId).nameAr,
                                      style: GoogleFonts.montserrat(
                                          color: Colors.black),
                                    ),
                                  ),
                                )
                                .toList()
                            : [];
                      },
                      items: list.map(
                        // ignore: non_constant_identifier_names
                        (Countrysss) {
                          return DropdownMenuItem<int>(
                            value: Countrysss.id,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Countrysss.nameAr),
                                const Divider(
                                  thickness: 0.5,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(height: 20.h),
                Text(AppLocalizations.of(context)!.gender),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                      child: RadioListTile<String>(
                        title: Text(
                          AppLocalizations.of(context)!.male,
                          style: GoogleFonts.cairo(),
                        ),
                        value: 'M',
                        groupValue: _gender,
                        onChanged: (String? value) {
                          setState(() => _gender = value);
                        },
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                      child: RadioListTile<String>(
                        title: Text(
                          AppLocalizations.of(context)!.female,
                          style: GoogleFonts.cairo(),
                        ),
                        value: 'F',
                        groupValue: _gender,
                        onChanged: (String? value) {
                          setState(() => _gender = value);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 53.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.h),
                  child: ElevatedButton(
                    onPressed: () => performaLogin(),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF96E5D1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.register,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 53.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!.register_login,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 13.h,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF8D9AC9),
                      ),
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.sing_in,
                          recognizer: _click,
                          style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.h,
                            color: const Color(0xFF2FA9FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void performaLogin() {
    if (checkData()) {
      register();
    }
  }

  bool checkData() {
    if (_name.text.isNotEmpty &&
        _mobile.text.isNotEmpty &&
        _password.text.isNotEmpty) {
      return true;
    }

    context.ShowSnakBar(
        message: AppLocalizations.of(context)!.snacks, error: true);
    return false;
  }

  Future<void> register() async {
    ApiResponse<int> apiResponse = await AuthApiController().register(login);
    if (apiResponse.success) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => registration_verification_screen(
            mobile: _mobile.text,
            code: apiResponse.data!,
          ),
        ),
      );
    }
    // ignore: use_build_context_synchronously
    context.ShowSnakBar(
        message: "${apiResponse.message} ${apiResponse.data.toString()}",
        error: !apiResponse.success);
  }

  Login get login {
    Login login = Login();
    login.name = _name.text;
    login.mobile = _mobile.text;
    login.gender = _gender!;
    login.cityId = cityId.toString();
    login.password = _password.text;
    return login;
  }
}
