// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screens/model_ui/country.dart';
import 'package:smart_store/widgets/textfilde.dart';
import 'package:smart_store/widgets/utils/helpers.dart';

class addresses_screen extends StatefulWidget {
  const addresses_screen({Key? key}) : super(key: key);

  @override
  State<addresses_screen> createState() => _addresses_screenState();
}

class _addresses_screenState extends State<addresses_screen> with Helpers {
  int? _selectedcountryid;
  late TextEditingController name;
  late TextEditingController info;
  late TextEditingController contact;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    info = TextEditingController();
    contact = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    name.dispose();
    info.dispose();
    contact.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  final List<Country> _Countryss = <Country>[
    Country(id: 1, title: 'palestine'),
    Country(id: 2, title: 'Gaza'),
    Country(id: 3, title: 'Egypt'),
    Country(id: 4, title: 'Morocco'),
    Country(id: 5, title: 'Rafa'),
    Country(id: 6, title: 'Dair Al Balah'),
    Country(id: 7, title: 'Khan Younes'),
    Country(id: 8, title: 'Beit Lahia'),
    Country(id: 9, title: 'Jabalia'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('addresses'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'ADD NEW ADDRESSE',
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            page_textfilde_widget(
              hint: 'Name',
              prefixIcon: Icons.drive_file_rename_outline,
              keporderTybe: TextInputType.text,
              controller: name,
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: page_textfilde_widget(
                    hint: 'Info',
                    prefixIcon: (Icons.info),
                    keporderTybe: TextInputType.text,
                    controller: info,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: page_textfilde_widget(
                    hint: 'count',
                    prefixIcon: (Icons.numbers),
                    keporderTybe: const TextInputType.numberWithOptions(
                        signed: false, decimal: true),
                    controller: contact,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: DropdownButton<int>(
                  isExpanded: true,
                  hint: const Text(
                    'Select Country',
                  ),
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  onChanged: (int? value) {
                    setState(() => _selectedcountryid = value);
                  },
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor: Colors.grey,
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  itemHeight: 48,
                  menuMaxHeight: 250,
                  underline: const Divider(
                    color: Colors.transparent,
                  ),
                  value: _selectedcountryid,
                  selectedItemBuilder: (BuildContext cotext) {
                    return _selectedcountryid != null
                        ? _Countryss.map(
                            (e) => Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                _Countryss.firstWhere((element) =>
                                    element.id == _selectedcountryid).title,
                                style:
                                    GoogleFonts.montserrat(color: Colors.black),
                              ),
                            ),
                          ).toList()
                        : [];
                  },

                  items: _Countryss.map(
                    // ignore: non_constant_identifier_names
                    (Countrysss) {
                      return DropdownMenuItem<int>(
                        value: Countrysss.id,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Countrysss.title),
                            const Divider(
                              thickness: 0.8,
                              color: Colors.black,
                            )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () => performaLogin(),
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

  void performaLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (name.text.isNotEmpty &&
        info.text.isNotEmpty &&
        contact.text.isNotEmpty) {
      _controolervalue();
      return true;
    }

    ShowSnakBar(context, messageerroe: 'Enter Required data ', error: true);
    return false;
  }

  void _controolervalue() {}

  void login() {
    Navigator.pushNamed(context, '/view_address_screen');
  }
}
