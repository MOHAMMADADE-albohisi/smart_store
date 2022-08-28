import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class order_screen extends StatefulWidget {
  const order_screen({Key? key}) : super(key: key);

  @override
  State<order_screen> createState() => _order_screenState();
}

class _order_screenState extends State<order_screen> {
  RangeValues _RangeValues = const RangeValues(10, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/orderdetails_screen');
            },
            child: Container(
              height: 138.w,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              padding: EdgeInsetsDirectional.only(start: 15.w, end: 5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: Colors.black54,
                      blurRadius: 4,
                    )
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Oreder ID: ',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFF8B8B97),
                          ),
                        ),
                        Text(
                          '2324252627',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFF16162E),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '25 Nov',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFF8B8B97),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Status: ',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFF8B8B97),
                          ),
                        ),
                        RangeSlider(
                          activeColor: Colors.red,
                          values: _RangeValues,
                          onChanged: (RangeValues value) {
                            setState(() => _RangeValues = value);
                          },
                          min: 10,
                          max: 30,
                          divisions: 10,
                          labels: RangeLabels(_RangeValues.start.toString(),
                              _RangeValues.end.toString()),
                        ),
                      ],
                    ),
                    Divider(color: Colors.black),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.delete_outline))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
