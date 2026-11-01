import 'package:flutter/material.dart';

class RoadmapScreen extends StatelessWidget {
  final int streak;
  final int unlockedLesson;
  final Function(int) onOpenLesson;
  final Function(int) onOpenMilestone;

  const RoadmapScreen({
    super.key,
    required this.streak,
    required this.unlockedLesson,
    required this.onOpenLesson,
    required this.onOpenMilestone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F7FF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '학습 (Learn)',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF1E293B)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
                    ),
                    child: Row(
                      children: [
                        Text('$streak 🔥', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepOrange)),
                        const SizedBox(width: 10),
                        const Text('🇧🇩 🇰🇷', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFE0F2FE), Color(0xFFBAE6FD)]),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFF7DD3FC), width: 1.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('오늘의 받침 퀴즈', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0C4A6E))),
                      SizedBox(height: 2),
                      Text('আজকের বাচ্চিম কুইজ ও নোট', style: TextStyle(fontSize: 14, color: Color(0xFF0369A1), fontWeight: FontWeight.w600)),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF0284C7),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {},
                    child: const Text('শুরু করুন ⏱️', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                itemCount: 60,
                itemBuilder: (context, index) {
                  final lessonNo = index + 1;
                  final isUnlocked = lessonNo <= unlockedLesson;
                  final isLeftAligned = lessonNo % 2 != 0;
                  final pct = lessonNo < unlockedLesson ? 100 : (lessonNo == unlockedLesson ? 60 : 0);

                  return Column(
                    children: [
                      Align(
                        alignment: isLeftAligned ? Alignment.centerLeft : Alignment.centerRight,
                        child: GestureDetector(
                          onTap: isUnlocked ? () => onOpenLesson(lessonNo) : null,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.82,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: isUnlocked ? Colors.white : const Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isUnlocked ? const Color(0xFF38BDF8) : const Color(0xFFCBD5E1),
                                width: 3,
                              ),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: !isUnlocked
                                      ? Colors.grey.shade400
                                      : (pct == 100 ? const Color(0xFF22C55E) : const Color(0xFFF59E0B)),
                                  child: Icon(
                                    !isUnlocked ? Icons.lock : (pct == 100 ? Icons.check : Icons.play_arrow),
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '$lessonNoম পাঠ: অধ্যায় $lessonNo',
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                                      ),
                                      const SizedBox(height: 6),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: LinearProgressIndicator(
                                          value: pct / 100,
                                          minHeight: 8,
                                          backgroundColor: const Color(0xFFE2E8F0),
                                          color: pct == 100 ? const Color(0xFF22C55E) : const Color(0xFFF59E0B),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text('$pct%', style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (lessonNo % 5 == 0)
                        GestureDetector(
                          onTap: () => onOpenMilestone(lessonNo),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 14),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [Color(0xFFFEF3C7), Color(0xFFFDE68A)]),
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: const Color(0xFFD97706), width: 2.5),
                              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
                            ),
                            child: Column(
                              children: [
                                const Icon(Icons.account_balance, size: 42, color: Color(0xFFB45309)),
                                const SizedBox(height: 6),
                                Text(
                                  'মাইলস্টোন পরীক্ষা (Milestone ${lessonNo ~/ 5}: পাঠ ${lessonNo - 4}–$lessonNo)',
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF78350F)),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF78350F),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Text(
                                    'উত্তীর্ণ হতে ৮০% প্রয়োজন (টাইমার সহ)',
                                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
