import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/GetX/addres_Getx.dart';
import 'package:smart_store/api/order/order_controoler.dart';
import 'package:smart_store/api/payment_getx_controller.dart';
import 'package:smart_store/helpers/contexe_extenssion.dart';
import 'package:smart_store/model_api/order/createprder.dart';
import 'package:smart_store/model_api/paymebtCard.dart';
import 'package:smart_store/widgets/apptext.dart';
import 'package:smart_store/widgets/seel_all.dart';
import 'package:smart_store/widgets/textfield.dart';
import '../../../widgets/bootin.dart';

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

  String _paymentRadioValue = "Visa Card";

  bool _rememberCard = true;

  String addressId = "";

  List<PaymentCard> payments = [
    PaymentCard(text: "Master Card", img: "test"),
    PaymentCard(text: "Visa Card", img: "test"),
    PaymentCard(text: "Cash", img: "test"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put<PaymentGetController>(PaymentGetController());
    Get.put<AddressGetController>(AddressGetController());
    var payment = PaymentGetController.to.defaultPayment;
    _cardNameTextController = TextEditingController()..text = payment != null ? payment.holderName : "";
    _cardNumberTextController = TextEditingController()..text = payment != null ? payment.cardNumber : "";
    _cvvTextController = TextEditingController()..text = payment != null ? payment.cvv : "";
    _expireDateTextController = TextEditingController()..text = payment != null ? payment.expDate : "";
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
        title: const Text("Checkout"),
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
            title: "Delivery Address",

            onPressed: () =>
                Navigator.pushNamed(context, '/view_address_screen'),
          ),
          SizedBox(
            height: 10.h,
          ),
          GetBuilder<AddressGetController>(builder: (controller) {
            if(controller.defaultAddress == null){
              return Text('No Sdrees');
            }else{
              return Container(
                constraints: BoxConstraints(
                  maxHeight: 92.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 11.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(
                    color: Colors.red,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 16.h,
                        maxWidth: 16.w,
                      ),
                      margin: EdgeInsets.only(top: 4.h),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                          color:Colors.red,
                          width: 2.w,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.defaultAddress!.name,
                          style: GoogleFonts.nunitoSans(
                            height: 0,
                            fontSize: 14.sp,
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
                          height: 3.h,
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
          },),
          SizedBox(
            height: 18.h,
          ),
          Text(
            "Select payment system",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 85.h,
              maxWidth: 135.w,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 20.w,
                childAspectRatio: 85.h / 135.w,
              ),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return PaymentRadioButton(
                  text: payments.elementAt(index).text,
                  img: payments.elementAt(index).img,
                  value: payments[index].text,
                  groupValue: _paymentRadioValue,
                  onChange: (String value) {
                    setState(() => _paymentRadioValue = value);
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          Visibility(
            visible: _paymentRadioValue != "Cash",
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  textFiledController: _cardNameTextController,
                  labelText: "Card Name",
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextField(
                  textFiledController: _cardNumberTextController,
                  labelText: "Card Number",
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
                        labelText: "Expiration Date",
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
                        labelText: "CVV",
                      ),
                    ),
                  ],
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  activeColor: Colors.white,
                  activeTrackColor: Colors.red,
                  //************
                  inactiveTrackColor: Colors.grey,
                  inactiveThumbColor: Colors.red,
                  title: Text(
                    'Remeber My Card Details',
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
            backgroundColor: Colors.red,
            textColor: Colors.white,
            content: "Pay Now",
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
