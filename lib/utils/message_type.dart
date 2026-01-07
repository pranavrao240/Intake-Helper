enum MessageType { user, ai }

class ChatMessage {
  final String text;
  final MessageType type;

  ChatMessage(this.text, this.type);
}
