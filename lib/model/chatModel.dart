import 'package:flutter/material.dart';

class ChatModel {
  TextEditingController _messageController = TextEditingController();

  ScrollController _scrollController = ScrollController();

  String _chatId;

  ScrollController get scrollController => _scrollController;

  set scrollController(ScrollController scrollController) {
    this._scrollController = scrollController;
  }

  TextEditingController get messageController => _messageController;

  set messageController(TextEditingController messageController) {
    this._messageController = messageController;
  }

  String get chatId => _chatId;

  set chatId(String chatId) {
    this._chatId = chatId;
  }
}
