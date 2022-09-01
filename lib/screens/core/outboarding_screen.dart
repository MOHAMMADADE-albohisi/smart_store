// ignore_for_file: camel_case_types, non_constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_store/widgets/OnBordaingContent.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: camel_case_types
class OnBordings_screen extends StatefulWidget {
  const OnBordings_screen({Key? key}) : super(key: key);

  @override
  State<OnBordings_screen> createState() => _OnBordings_screenState();
}

class _OnBordings_screenState extends State<OnBordings_screen> {
  late PageController _PageController;
  int _visible = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _PageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _PageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _visible < 2,
                replacement: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                  child: Text(
                    AppLocalizations.of(context)!.start,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    _PageController.animateToPage(2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutBack);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.skip,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: _PageController,
                onPageChanged: (int visible) {
                  setState(() => {
                        _visible = visible,
                      });
                },
                children: [
                  outbording(
                    image: 'image_2',
                    title: AppLocalizations.of(context)!.test2,
                    subtitle: AppLocalizations.of(context)!.teat1,
                  ),
                  outbording(
                    image: 'image_3',
                    title: AppLocalizations.of(context)!.test2,
                    subtitle: AppLocalizations.of(context)!.teat1,
                  ),
                  outbording(
                    image: 'image_2',
                    title: AppLocalizations.of(context)!.test2,
                    subtitle: AppLocalizations.of(context)!.teat1,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelectorIndicator(
                  backgroundColor:
                      _visible == 0 ? const Color(0xFF96E5D1) : Colors.grey,
                  borderColor:
                      _visible == 0 ? const Color(0xFFFF7750)  : Colors.transparent,
                  size: 14.h,
                ),
                TabPageSelectorIndicator(
                  backgroundColor:
                      _visible == 1 ? const Color(0xFF96E5D1) : Colors.grey,
                  borderColor:
                      _visible == 1 ? const Color(0xFFFF7750) : Colors.transparent,
                  size: 14.h,
                ),
                TabPageSelectorIndicator(
                  backgroundColor:
                      _visible == 2 ? const Color(0xFF96E5D1) : Colors.grey,
                  borderColor:
                      _visible == 2 ? const Color(0xFFFF7750) : Colors.transparent,
                  size: 14.h,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Visibility(
              visible: _visible == 2,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 3),
                          blurRadius: 6)
                    ],
                    color: const Color(0xFF96E5D1),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Text(AppLocalizations.of(context)!.start),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
