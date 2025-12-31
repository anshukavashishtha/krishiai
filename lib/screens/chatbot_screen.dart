import 'dart:async';
import 'package:flutter/material.dart';
import '../services/chatbot_service.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen>
    with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  final List<_ChatMessage> _messages = [
    _ChatMessage(
      role: 'bot',
      text: '👋 Hey! I am KrishiAI.\nHow can I help you today? 🌱',
    )
  ];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(_ChatMessage(role: 'user', text: text));
      _controller.clear();
      _isTyping = true;
    });

    Timer(const Duration(milliseconds: 900), () {
      final reply = ChatbotService.getReply(text);
      setState(() {
        _messages.add(_ChatMessage(role: 'bot', text: reply));
        _isTyping = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KrishiAI Chatbot')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (_isTyping && index == _messages.length) {
                  return const _TypingIndicator();
                }

                final msg = _messages[index];
                return _AnimatedBubble(
                  key: ValueKey('$index-${msg.role}'),
                  isUser: msg.role == 'user',
                  text: msg.text,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ask your farming question...',
                      filled: true,
                      fillColor: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF1F1F1F)
                          : Colors.green.shade50,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: _sendMessage,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ===================== MODELS ===================== */

class _ChatMessage {
  final String role;
  final String text;
  _ChatMessage({required this.role, required this.text});
}

/* ===================== TYPING INDICATOR ===================== */

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2C2C2C) : Colors.green.shade100,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          'KrishiAI is typing...',
          style: TextStyle(
            fontSize: 13,
            color: isDark ? Colors.white70 : Colors.black87,
          ),
        ),
      ),
    );
  }
}

/* ===================== ANIMATED BUBBLE ===================== */

class _AnimatedBubble extends StatefulWidget {
  final bool isUser;
  final String text;

  const _AnimatedBubble({
    super.key,
    required this.isUser,
    required this.text,
  });

  @override
  State<_AnimatedBubble> createState() => _AnimatedBubbleState();
}

class _AnimatedBubbleState extends State<_AnimatedBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 260))
          ..forward();

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: widget.isUser ? const Offset(0.2, 0) : const Offset(-0.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Align(
          alignment:
              widget.isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(10),
            constraints: const BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              color: widget.isUser
                  ? (isDark ? Colors.green.shade700 : Colors.green.shade600)
                  : (isDark ? const Color(0xFF2C2C2C) : Colors.green.shade100),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 14,
                color: widget.isUser
                    ? Colors.white
                    : (isDark ? Colors.white70 : Colors.black87),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
