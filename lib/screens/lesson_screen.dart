import 'package:flutter/material.dart';
import '../models/lesson_models.dart';
import '../services/tts_service.dart';

class LessonScreen extends StatefulWidget {
  final int lessonId;
  final bool showColorCode;
  final bool showBanglaPron;
  final VoidCallback onBack;
  final Function(String grammarId) onBistaritoJanun;

  const LessonScreen({
    super.key,
    required this.lessonId,
    required this.showColorCode,
    required this.showBanglaPron,
    required this.onBack,
    required this.onBistaritoJanun,
  });

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  WordSegment? activeSegment;

  Color _getTextColor(String type) {
    if (!widget.showColorCode) return const Color(0xFF0F172A);
    switch (type) {
      case 'word':
        return const Color(0xFF0369A1);
      case 'grammar':
        return const Color(0xFF15803D);
      case 'change':
        return const Color(0xFFC2410C);
      default:
        return const Color(0xFF0F172A);
    }
  }

  Color _getBgColor(String type) {
    if (!widget.showColorCode) return Colors.transparent;
    switch (type) {
      case 'word':
        return const Color(0xFFE0F2FE);
      case 'grammar':
        return const Color(0xFFDCFCE7);
      case 'change':
        return const Color(0xFFFFEDD5);
      default:
        return Colors.transparent;
    }
  }

  void _show3DotSheet(String title) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('⋮ অপশন: $title', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.bookmark, color: Color(0xFF0284C7)),
              title: const Text('Bookmark (বুকমার্ক করে রাখুন)'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.edit_note, color: Color(0xFFD97706)),
              title: const Text('Personal Note (ব্যক্তিগত নোট যোগ করুন)'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E567C),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: widget.onBack),
        title: const Text(
          '08 가족과 친구 (পরিবার ও বন্ধু)',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(14),
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF4FB),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF93C5FD)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('학습 안내 (শেখার উদ্দেশ্য)', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A))),
                    SizedBox(height: 4),
                    Text('• পরিবার ও বন্ধুদের সম্পর্কে জিজ্ঞাসা করা এবং উত্তর দেওয়া।'),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              const Text('대화 1 (কথোপকথন ১)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...sampleLesson8Dialogues.map((dlg) => Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(dlg.speaker, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF475569))),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.volume_up, color: Color(0xFF0284C7)),
                                  onPressed: () => TtsService.speakKorean(
                                    context,
                                    dlg.segments.map((s) => s.text).join(),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.more_vert),
                                  onPressed: () => _show3DotSheet(dlg.meaningBn),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 4,
                          runSpacing: 6,
                          children: dlg.segments.map((seg) => GestureDetector(
                                onTap: () {
                                  if (widget.showColorCode) {
                                    setState(() => activeSegment = seg);
                                  } else {
                                    TtsService.speakKorean(context, seg.text);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: _getBgColor(seg.type),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    seg.text,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: _getTextColor(seg.type),
                                    ),
                                  ),
                                ),
                              )).toList(),
                        ),
                        if (widget.showBanglaPron)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(dlg.pronBn, style: const TextStyle(color: Colors.teal, fontStyle: FontStyle.italic)),
                          ),
                        const SizedBox(height: 6),
                        Text(dlg.meaningBn, style: const TextStyle(fontSize: 16, color: Color(0xFF1E293B))),
                      ],
                    ),
                  )),
              const SizedBox(height: 16),
              const Text('어휘 1 가족 (শব্দার্থ ১: পরিবার)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.05,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: sampleLesson8Vocab.length,
                itemBuilder: (context, idx) {
                  final v = sampleLesson8Vocab[idx];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 24),
                            Text(v.icon, style: const TextStyle(fontSize: 40)),
                            GestureDetector(
                              onTap: () => _show3DotSheet('${v.kr} (${v.bn})'),
                              child: const Icon(Icons.more_vert, size: 20),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(v.kr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text(v.bn, style: const TextStyle(fontSize: 14, color: Color(0xFF475569))),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.volume_up, color: Color(0xFF0284C7)),
                              onPressed: () => TtsService.speakKorean(context, v.kr),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
          if (activeSegment != null)
            Positioned(
              bottom: 24,
              left: 20,
              right: 20,
              child: Material(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${activeSegment!.text} (${activeSegment!.meaningBn})',
                            style: const TextStyle(color: Color(0xFFFDBA74), fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.white70),
                            onPressed: () => setState(() => activeSegment = null),
                          ),
                        ],
                      ),
                      Text(
                        activeSegment!.ruleBn,
                        style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () => TtsService.speakKorean(context, activeSegment!.text),
                            icon: const Icon(Icons.volume_up, color: Colors.lightBlueAccent),
                            label: const Text('উচ্চারণ শুনুন', style: TextStyle(color: Colors.lightBlueAccent)),
                          ),
                          if (activeSegment!.grammarId != null)
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0284C7),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                final gId = activeSegment!.grammarId!;
                                setState(() => activeSegment = null);
                                widget.onBistaritoJanun(gId);
                              },
                              icon: const Icon(Icons.menu_book, size: 18),
                              label: const Text('বিস্তারিত জানুন →', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
