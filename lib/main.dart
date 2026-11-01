import 'package:flutter/material.dart';
import 'screens/roadmap_screen.dart';
import 'screens/lesson_screen.dart';
import 'screens/grammar_tab_screen.dart';

void main() {
  runApp(const EpsTopikBanglaApp());
}

class EpsTopikBanglaApp extends StatefulWidget {
  const EpsTopikBanglaApp({super.key});

  @override
  State<EpsTopikBanglaApp> createState() => _EpsTopikBanglaAppState();
}

class _EpsTopikBanglaAppState extends State<EpsTopikBanglaApp> {
  int _currentTab = 0;
  int? _activeLessonId;
  String? _highlightedGrammarId;

  bool _showColorCode = true;
  bool _showBanglaPron = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EPS-TOPIK Bangla',
      theme: ThemeData(useMaterial3: true, fontFamily: 'sans-serif'),
      home: _activeLessonId != null
          ? LessonScreen(
              lessonId: _activeLessonId!,
              showColorCode: _showColorCode,
              showBanglaPron: _showBanglaPron,
              onBack: () => setState(() => _activeLessonId = null),
              onBistaritoJanun: (grammarId) {
                setState(() {
                  _activeLessonId = null;
                  _highlightedGrammarId = grammarId;
                  _currentTab = 1;
                });
              },
            )
          : Scaffold(
              body: IndexedStack(
                index: _currentTab,
                children: [
                  RoadmapScreen(
                    streak: 12,
                    unlockedLesson: 8,
                    onOpenLesson: (id) => setState(() => _activeLessonId = id),
                    onOpenMilestone: (mId) {},
                  ),
                  GrammarTabScreen(
                    selectedGrammarId: _highlightedGrammarId,
                    onClearSelection: () => setState(() => _highlightedGrammarId = null),
                  ),
                  Scaffold(
                    appBar: AppBar(title: const Text('সেটিংস / Settings')),
                    body: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        SwitchListTile(
                          title: const Text('কালার-কোডেড শব্দ ও গ্রামার হাইলাইট'),
                          subtitle: const Text('অফ করলে সাধারণ টেক্সট দেখাবে'),
                          value: _showColorCode,
                          onChanged: (v) => setState(() => _showColorCode = v),
                        ),
                        SwitchListTile(
                          title: const Text('কোরিয়ান শব্দের বাংলা উচ্চারণ দেখান'),
                          subtitle: const Text('ডিফল্টভাবে বন্ধ থাকবে'),
                          value: _showBanglaPron,
                          onChanged: (v) => setState(() => _showBanglaPron = v),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentTab,
                onTap: (i) => setState(() => _currentTab = i),
                selectedItemColor: const Color(0xFF0284C7),
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.map), label: 'পাঠ (Roadmap)'),
                  BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'গ্রামার'),
                  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'সেটিংস'),
                ],
              ),
            ),
    );
  }
}
