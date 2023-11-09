import 'package:flutter/material.dart';
class DefaultTextForm extends StatelessWidget {
  DefaultTextForm({super.key,this.suffix,this.colorIcon,this.pressIcon, this.controller, this.tap, this.submit, this.validate, required this.type, this.secure = false, required this.hint});
  final TextEditingController? controller;
  final void Function()? tap;
  final void Function(String?)? submit;
  final String? Function(String?)? validate;
  final TextInputType type;
  final bool? secure ;
  final String hint;
  IconData? suffix;
  Color? colorIcon;
  void Function()? pressIcon;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: TextFormField(

          style: const TextStyle(
            color: Colors.black,
          ),
          controller: controller,
          onFieldSubmitted: submit,
          validator: validate,
          keyboardType: type,
          obscureText:secure! ,
          decoration:  InputDecoration(
            errorStyle: const TextStyle(
              color: Colors.red,
            ),

            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color:Colors.white,
                )
            ),
            suffixIcon: IconButton( onPressed: pressIcon, icon: Icon(suffix  ,color: colorIcon,)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                    color: Colors.grey,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                    color:Colors.grey,
                )),
            hintText: hint,
            hintStyle: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );

  }
}
