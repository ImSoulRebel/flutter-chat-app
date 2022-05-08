import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String uid;
  final AnimationController animationController;
  const ChatMessage(
      {Key? key,
      required this.uid,
      required this.text,
      required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
          sizeFactor: CurvedAnimation(
              parent: animationController, curve: Curves.easeOut),
          child: uid == "123" ? _outputMessage() : _inputMessage()),
    );
  }

  Widget _outputMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: const Color(0xff4D9EF6),
              borderRadius: BorderRadius.circular(20)),
          child: Builder(builder: (context) {
            return Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            );
          })),
    );
  }

  Widget _inputMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          margin: const EdgeInsets.only(bottom: 5, left: 5, right: 50),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: const Color(0xffE4E5E8),
              borderRadius: BorderRadius.circular(20)),
          child: Builder(builder: (context) {
            return Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black87),
            );
          })),
    );
  }
}
