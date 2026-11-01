import 'package:flutter/material.dart';
import '../models/lesson_models.dart';
import '../services/tts_service.dart';

class GrammarTabScreen extends StatelessWidget {
  final String? selectedGrammarId;
  final VoidCallback? onClearSelection;

  const GrammarTabScreen({
    super.key,
    this.selectedGrammarId,
    this.onClearSelection,
  });

  @override
  Widget build(BuildContext context) {
    final topics = selectedGrammarId != null
        ? allGrammarTopics.where((g) => g.id == selectedGrammarId).toList()
        : allGrammarTopics;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: const Text('문법 라이브러리 (গ্রামার ট্যাব)', style: TextStyle(color: Colors.white, fontSize: 18)),
        actions: [
          if (selectedGrammarId != null && onClearSelection != null)
            TextButton(
              onPressed: onClearSelection,
              child: const Text('সব গ্রামার দেখুন', style: TextStyle(color: Colors.amberAccent)),
            ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: topics.length,
        itemBuilder: (context, idx) {
          final topic = topics[idx];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFCBD5E1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEDD5),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFF97316)),
                  ),
                  child: Text(
                    topic.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF9A3412)),
                  ),
                ),
                const SizedBox(height: 10),
                Text(topic.subtitleBn, style: const TextStyle(fontSize: 15, color: Color(0xFF1E293B))),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F2FE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text(topic.formulaLeft, style: const TextStyle(fontWeight: FontWeight.bold))),
                      Container(width: 1, height: 40, color: Colors.blueGrey.shade200),
                      const SizedBox(width: 10),
                      Expanded(child: Text(topic.formulaRight, style: const TextStyle(fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
                if (topic.examples1To5.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  const Text('১ থেকে ৫ ধারাবাহিক উদাহরণ:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  ...topic.examples1To5.map((ex) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          ex.segments.map((s) => s.text).join(),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color(0xFF0369A1)),
                        ),
                        subtitle: Text(ex.meaningBn, style: const TextStyle(fontSize: 14)),
                        trailing: IconButton(
                          icon: const Icon(Icons.volume_up, color: Color(0xFF0284C7)),
                          onPressed: () => TtsService.speakKorean(
                            context,
                            ex.segments.map((s) => s.text).join(),
                          ),
                        ),
                      )),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
