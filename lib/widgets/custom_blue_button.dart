import 'package:flutter/material.dart';

class CustomBlueButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const CustomBlueButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 2, shape: const StadiumBorder()),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(text,
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: Colors.white)),
          ),
        ));
  }
}
