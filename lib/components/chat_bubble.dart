import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble(
      {super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    var currentUserColor = Theme
        .of(context)
        .colorScheme
        .primary;
    var notCurrentUserColor = Theme
        .of(context)
        .colorScheme
        .tertiary;
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: isCurrentUser ? currentUserColor : notCurrentUserColor,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Text(message, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
    );
  }
}
