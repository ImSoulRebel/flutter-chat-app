import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String route;
  final String text;
  final String linkedText;
  const Labels({
    Key? key,
    required this.route,
    required this.text,
    required this.linkedText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, route),
          child: Text(linkedText,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.blue)),
        ),
      ],
    );
  }
}
