import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class see_all extends StatelessWidget {
  const see_all({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: const Color(0xFF36596A),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppLocalizations.of(context)!.see_all,
            style: GoogleFonts.nunitoSans(),
          ),
        )
      ],
    );
  }
}
