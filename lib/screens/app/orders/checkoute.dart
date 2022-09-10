import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/GetX/addres_Getx.dart';
import 'package:smart_store/api/order/order_controoler.dart';
import 'package:smart_store/api/payment_getx_controller.dart';
import 'package:smart_store/helpers/contexe_extenssion.dart';
import 'package:smart_store/model_api/order/createprder.dart';
import 'package:smart_store/widgets/seel_all.dart';
import 'package:smart_store/widgets/textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../widgets/bootin.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({Key? key, required this.cart}) : super(key: key);

  List<CartObj> cart;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late TextEditingController _cardNameTextController,
      _cardNumberTextController,
      _expireDateTextController,
      _cvvTextController;

  final String _paymentRadioValue = "Visa Card";

  bool _rememberCard = true;

  String addressId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put<PaymentGetController>(PaymentGetController());
    Get.put<AddressGetController>(AddressGetController());
    var payment = PaymentGetController.to.defaultPayment;
    _cardNameTextController = TextEditingController()
      ..text = payment != null ? payment.holderName : "";
    _cardNumberTextController = TextEditingController()
      ..text = payment != null ? payment.cardNumber : "";
    _cvvTextController = TextEditingController()
      ..text = payment != null ? payment.cvv : "";
    _expireDateTextController = TextEditingController()
      ..text = payment != null ? payment.expDate : "";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cardNameTextController.dispose();
    _cardNumberTextController.dispose();
    _cvvTextController.dispose();
    _expireDateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.checkout,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF96E5D1),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        children: [
          see_all(
            title: AppLocalizations.of(context)!.delivery_address,
            onPressed: () =>
                Navigator.pushNamed(context, '/view_address_screen'),
          ),
          SizedBox(
            height: 10.h,
          ),
          GetBuilder<AddressGetController>(
            builder: (controller) {
              if (controller.defaultAddress == null) {
                return Text(
                  AppLocalizations.of(context)!.no_address,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                );
              } else {
                return Container(
                  constraints: BoxConstraints(
                    maxHeight: 120.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF96E5D1),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.defaultAddress!.name,
                            style: GoogleFonts.nunitoSans(
                              height: 0,
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            controller.defaultAddress!.contactNumber,
                            style: GoogleFonts.nunitoSans(
                              height: 0,
                              fontSize: 14.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            controller.defaultAddress!.info,
                            style: GoogleFonts.nunitoSans(
                              height: 0,
                              fontSize: 14.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: 50.h,
          ),
          Visibility(
            visible: _paymentRadioValue != "Cash",
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  textFiledController: _cardNameTextController,
                  labelText: AppLocalizations.of(context)!.cart_name,
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextField(
                  textFiledController: _cardNumberTextController,
                  labelText:  AppLocalizations.of(context)!.cart_number,
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: AppTextField(
                        textFiledController: _expireDateTextController,
                        labelText: AppLocalizations.of(context)!.cart_expand,
                        inputType: TextInputType.datetime,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: AppTextField(
                        textFiledController: _cvvTextController,
                        inputType: TextInputType.number,
                        labelText: AppLocalizations.of(context)!.cvv,
                      ),
                    ),
                  ],
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xFF96E5D1),
                  title: Text(
                    AppLocalizations.of(context)!.remember_cart,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      height: 0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  value: _rememberCard,
                  onChanged: (bool value) {
                    setState(() => _rememberCard = value);
                  },
                ),
              ],
            ),
          ),
          AppButton(
            backgroundColor: const Color(0xFF96E5D1),
            textColor: Colors.white,
            content: AppLocalizations.of(context)!.pay_now,
            onPressed: () => _createOrder(),
          ),
        ],
      ),
    );
  }

  void _createOrder() async {
    var response = await OrderApiController().createOrder(
      order: CreateOrder(
        paymentType: "Cash",
        addressId: AddressGetController.to.defaultAddress!.id.toString(),
        cart: widget.cart,
      ),
    );
    // ignore: use_build_context_synchronously
    context.ShowSnakBar(message: response.message, error: !response.status);
  }
}
