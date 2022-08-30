import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/widgets/utils/helpers.dart';
import '../../../widgets/AppTextField.dart';

class EditeMobileScreen extends StatefulWidget {
  const EditeMobileScreen({Key? key}) : super(key: key);

  @override
  State<EditeMobileScreen> createState() => _EditeMobileScreenState();
}

class _EditeMobileScreenState extends State<EditeMobileScreen> with Helpers {

  late TextEditingController _mobileTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextController = TextEditingController();

  }
  @override
  void dispose() {
    _mobileTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEBEBEB),
      appBar: AppBar(
        title:  Text(
          'Change Mobile',
          style: GoogleFonts.cairo(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Container(
              padding: EdgeInsets.only(top: 5),
              margin: EdgeInsetsDirectional.only(bottom:10,start: 10,end: 10),
              height: 400.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,0),
                    color: Colors.black45,
                    blurRadius: 4,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Change Your Mobile',
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                    Text(
                      'Enter New Mobile',
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black45
                      ),
                    ),
                    SizedBox(height: 20.h),
                    AppTextField(
                      hint:'Enter new mobile',
                      prefixIcon: Icons.phone,
                      keyboardType: TextInputType.number,
                      controller: _mobileTextController,
                    ),
                    SizedBox(height: 20.h,),
                    ElevatedButton(
                      onPressed: ()=>{_performMobile()},
                      child: Text(
                        'Upadte Mobile',
                        style: GoogleFonts.cairo(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        primary: Colors.white,
                        minimumSize: Size(325.w, 50.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _performMobile(){
    if(CheckData()){
      login();
    }
  }

  bool CheckData(){
    if(_mobileTextController.text.isNotEmpty){
      return true ;
    }
   ShowSnakBar (context, messageerroe: 'Enter required data !',error: true);
    return false;
  }

  void login(){
    Navigator.pushNamed(context, '/virification_mobile_screen');
  }
}