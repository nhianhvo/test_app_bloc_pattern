import 'package:flutter/material.dart';

class ButtonAppWidget extends StatelessWidget {
  final Function()? ontap;
  const ButtonAppWidget({
    Key? key,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
          fixedSize: MaterialStateProperty.all<Size>(const Size.fromHeight(58)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), side: BorderSide.none),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: ontap,
        child: const Text(
          'Change Widget',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
