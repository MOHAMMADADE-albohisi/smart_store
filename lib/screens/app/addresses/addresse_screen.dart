import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/GetX/addres_Getx.dart';
import 'package:smart_store/api/auth_api_controller.dart';
import 'package:smart_store/helpers/contexe_extenssion.dart';
import 'package:smart_store/model_api/addres.dart';
import 'package:smart_store/model_api/api_response.dart';
import 'package:smart_store/model_api/login.dart';
import 'package:smart_store/widgets/textfilde.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewAddressScreen extends StatefulWidget {
  NewAddressScreen({Key? key, this.address}) : super(key: key);

  Address? address;

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  late TextEditingController _addressNameTextController;
  late TextEditingController _phoneNumberTextController;
  late TextEditingController _addressInfoTextController;

  int? cityId;
  List<City> list = [];

  bool isDefault = false;

  int? _selectedCityId;


  void _getCities() async {
    var apiResponse = await AuthApiController().getCities();
    setState(() => list = apiResponse.data == null ? [] : apiResponse.data!);
  }

  @override
  void initState() {
    super.initState();
    _getCities();
    _addressNameTextController = TextEditingController()
      ..text = widget.address != null ? widget.address!.name : "";
    _phoneNumberTextController = TextEditingController()
      ..text = widget.address != null ? widget.address!.contactNumber : "";
    _addressInfoTextController = TextEditingController()
      ..text = widget.address != null ? widget.address!.info : "";
    _selectedCityId = widget.address != null ? widget.address!.cityId : null;
  }

  @override
  void dispose() {
    _addressNameTextController.dispose();
    _phoneNumberTextController.dispose();
    _addressInfoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("New Address"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(21.r),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26.h),
          children: [
            page_textfilde_widget(
              hint: 'Name Address',
              prefixIcon: (Icons.drive_file_rename_outline),
              keporderTybe: TextInputType.text,
              controller: _addressNameTextController,
            ),
            SizedBox(
              height: 20.h,
            ),
            page_textfilde_widget(
              hint: 'Info',
              prefixIcon: (Icons.info),
              keporderTybe: TextInputType.text,
              controller: _addressInfoTextController,
            ),
            SizedBox(
              height: 20.h,
            ),
            page_textfilde_widget(
              hint: 'phone Number',
              prefixIcon: (Icons.numbers),
              keporderTybe: TextInputType.number,
              controller: _phoneNumberTextController,
            ),
            SizedBox(
              height: 20.h,
            ),
            FutureBuilder<ApiResponse<List<City>>>(
              future: AuthApiController().getCities(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: DropdownButton<int>(
                      isExpanded: true,
                      underline: const SizedBox(),
                      hint: const Text('City'),
                      style: GoogleFonts.nunitoSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      onChanged: (int? value) {
                        setState(() => _selectedCityId = value!);
                      },
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        print('Tapped');
                      },
                      dropdownColor: Colors.grey,
                      elevation: 1,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.black54,
                      ),
                      value: _selectedCityId,
                      items: [],
                    ),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: DropdownButton<int>(
                      isExpanded: true,
                      underline: const SizedBox(),
                      hint: const Text('City'),
                      style: GoogleFonts.nunitoSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      onChanged: (int? value) {
                        setState(() => _selectedCityId = value!);
                      },
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        print('Tapped');
                      },
                      dropdownColor: Colors.grey,
                      elevation: 1,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.black54,
                      ),
                      value: _selectedCityId,
                      items: snapshot.data!.data!.map(
                            (city) {
                          return DropdownMenuItem<int>(
                            value: city.id,
                            child: Text(
                              city.nameAr,
                              style: GoogleFonts.nunitoSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 30.w,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () => _performCreateAddress(),
                child: Text(
                  'Save',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performCreateAddress() {
    if (_checkData()) {
      _createAddress();
    }
  }

  bool _checkData() {
    if (_phoneNumberTextController.text.isNotEmpty &&
        _addressInfoTextController.text.isNotEmpty &&
        _addressInfoTextController.text.isNotEmpty &&
        _selectedCityId != null) {
      return true;
    }
    context.ShowSnakBar(message: 'Enter required data', error: true);
    return false;
  }

  void _createAddress() async {
    final Apiresponse response;
    var address = Address(
      name: _addressNameTextController.text,
      info: _addressInfoTextController.text,
      contactNumber: _phoneNumberTextController.text,
      cityId: _selectedCityId!,
    );
    if (widget.address == null) {
      response = (await AddressGetController.to.createNewAddress(address));
    } else {
      address.id = widget.address!.id;
      response = (await AddressGetController.to.updateAddress(address));
    }
    // ignore: use_build_context_synchronously
    context.ShowSnakBar(message: response.message, error: !response.status);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}

List<DropdownMenuItem<T>> toDropDownItemsList<T>(List<City> list) {
  return list
      .map(
        (e) => DropdownMenuItem<T>(
          value: e.id as T,
          child: Text(
            e.nameAr,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black54,
            ),
          ),
        ),
      )
      .toList();
}
