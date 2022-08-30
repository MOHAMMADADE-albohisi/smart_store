import 'package:flutter/material.dart';

class CustomListTitleCard extends StatelessWidget {
  const CustomListTitleCard({
    Key? key,
    required this.ledingIcon,
    required this.title,
    required this.onActionPressed,
    this.marginBotem = 0,
    required this.trailingIcon,
  }) : super(key: key);
  final IconData ledingIcon;
  final String title;
  final double marginBotem;
  final void Function() onActionPressed;
  final IconData trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10, //الضل
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // اطراف الشكل
      ),
      margin: EdgeInsets.only(right: 20, left: 20, bottom: marginBotem),
      child: ListTile(
        horizontalTitleGap: 0,
        // onTap: (){
        //   print('ايقونة الايميل ');
        // }, // لجعل الايقونة بلكامل قابلة للضغط
        leading: Icon(
          ledingIcon,
        ),

        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
          ),
        ),
        trailing: IconButton(
          onPressed: onActionPressed,
          icon: Icon(trailingIcon),
        ),
      ),
    );
  }
}
