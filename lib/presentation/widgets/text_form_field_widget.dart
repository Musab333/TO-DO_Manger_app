import 'package:flutter/material.dart';
import 'package:todo/shared/styles/color_app.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.textController,
    required this.text,
    required this.keyPadType,
    required this.prefixIcon,
    this.suffixIcon,
    this.isPassword,
    this.enabled,
    this.suffixPressed,
    this.validate,
    this.onTop,
  });

  final TextEditingController textController;
  final String text;
  final bool? isPassword;
  final TextInputType keyPadType;
  final Icon prefixIcon;
  final IconData? suffixIcon;
  final bool? enabled;
  final String? Function(String?)? validate;
  final Function()? suffixPressed;
  final Function()? onTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: TextFormField(
        controller: textController,
        obscureText: isPassword!,
        keyboardType: keyPadType,
        //textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: text,

          hintStyle: const TextStyle(
            color: primaryColor,
            fontFamily: 'Cairo',
            //fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffixIcon,
                    //color: AppColors.defaultColors,
                  ),
                )
              : null,
          //border: OutlineInputBorder(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onTap: onTop,
        enabled: enabled,
        validator: validate,
      ),
    );
  }
}
