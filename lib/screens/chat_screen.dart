import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isWriting = false;
  final List<ChatMessage> _messages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Column(children: [
          CircleAvatar(
            child: Text("Te", style: Theme.of(context).textTheme.bodySmall),
            backgroundColor: Colors.lightBlueAccent,
            maxRadius: 14,
          ),
          const SizedBox(height: 3),
          Text(
            "Orlando",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.black87),
          ),
        ]),
      ),
      body: Column(
        children: [
          Flexible(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (_, index) {
              return _messages[index];
            },
          )),
          const Divider(height: 10),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: 50,
            child: _inputChat(),
          )
        ],
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                  controller: _textController,
                  focusNode: _focusNode,
                  onSubmitted: _handleSubmit,
                  onChanged: (text) {
                    setState(() {});
                    text.trim().isNotEmpty
                        ? _isWriting = true
                        : _isWriting = false;
                  },
                  decoration: const InputDecoration.collapsed(
                      hintText: "Enviar mensaje")),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: const Text("Enviar"),
                      onPressed: _isWriting
                          ? () => _handleSubmit(_textController.text.trim())
                          : null)
                  : Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      child: IconButton(
                          color: Colors.blue,
                          disabledColor: Colors.grey,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: const Icon(Icons.send),
                          onPressed: _isWriting
                              ? () => _handleSubmit(_textController.text.trim())
                              : null),
                    ),
            )
          ],
        ),
      ),
    );
  }

  void _handleSubmit(String text) {
    if (text.isEmpty) return;
    _textController.clear();
    _focusNode.requestFocus();
    final outputMessage = ChatMessage(
        uid: "123",
        text: text,
        animationController: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 400)));
    _messages.insert(0, outputMessage);
    outputMessage.animationController.forward();
    setState(() {
      _isWriting = false;
    });
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
