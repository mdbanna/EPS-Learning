import 'package:flutter/material.dart';

class TtsService {
  static void speakKorean(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🔊 উচ্চারণ বাজানো হচ্ছে (ko-KR): "$text"'),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFF0284C7),
      ),
    );
  }
}
