class WordSegment {
  final String text;
  final String type; // 'word' | 'grammar' | 'change'
  final String meaningBn;
  final String ruleBn;
  final String? grammarId; // 'বিস্তারিত জানুন' বাটনের মাধ্যমে সরাসরি গ্রামার ট্যাবে যাওয়ার আইডি

  WordSegment({
    required this.text,
    required this.type,
    required this.meaningBn,
    required this.ruleBn,
    this.grammarId,
  });
}

class DialogueLine {
  final String id;
  final String speaker;
  final String track;
  final List<WordSegment> segments;
  final String meaningBn;
  final String meaningEn;
  final String pronBn;

  DialogueLine({
    required this.id,
    required this.speaker,
    required this.track,
    required this.segments,
    required this.meaningBn,
    required this.meaningEn,
    required this.pronBn,
  });
}

class VocabItem {
  final String id;
  final String kr;
  final String bn;
  final String en;
  final String pronBn;
  final String icon;

  VocabItem({
    required this.id,
    required this.kr,
    required this.bn,
    required this.en,
    required this.pronBn,
    required this.icon,
  });
}

class GrammarTopic {
  final String id;
  final String title;
  final String subtitleBn;
  final String formulaLeft;
  final String formulaRight;
  final List<DialogueLine> examples1To5;

  GrammarTopic({
    required this.id,
    required this.title,
    required this.subtitleBn,
    required this.formulaLeft,
    required this.formulaRight,
    required this.examples1To5,
  });
}

final List<DialogueLine> sampleLesson8Dialogues = [
  DialogueLine(
    id: 'd1',
    speaker: '투안 (তুয়ান)',
    track: 'Track 28',
    segments: [
      WordSegment(
        text: '리한 씨, ',
        type: 'word',
        meaningBn: 'রিহান সাহেব,',
        ruleBn: 'নামের শেষে সম্মান জানাতে 씨 যুক্ত হয়।',
      ),
      WordSegment(
        text: '가족',
        type: 'word',
        meaningBn: 'পরিবার',
        ruleBn: 'মূল বিশেষ্য শব্দ (Family)।',
      ),
      WordSegment(
        text: '이 ',
        type: 'grammar',
        meaningBn: '(সাবজেক্ট পার্টিকেল)',
        ruleBn: 'বাচ্চিম থাকলে শব্দের শেষে সাবজেক্ট পার্টিকেল -이 বসে।',
        grammarId: 'g_subject',
      ),
      WordSegment(
        text: '몇 명',
        type: 'word',
        meaningBn: 'কতজন',
        ruleBn: 'মানুষ গণনার একক 명।',
      ),
      WordSegment(
        text: '이에요?',
        type: 'change',
        meaningBn: 'আছে / হয়?',
        ruleBn: 'বাচ্চিম থাকায় ইয়েয়ো (이에요) যুক্ত হয়েছে।',
        grammarId: 'g_ieyo',
      ),
    ],
    meaningBn: 'রিহান সাহেব, আপনার পরিবারে সদস্য কতজন?',
    meaningEn: 'Rihan, how many family members do you have?',
    pronBn: 'রিহান শ্শি, গাজোগি মিয়ত মিয়ঙিয়েয়ো?',
  ),
  DialogueLine(
    id: 'd2',
    speaker: '리한 (রিহান)',
    track: 'Track 28',
    segments: [
      WordSegment(
        text: '아버님',
        type: 'change',
        meaningBn: 'বাবা (সম্মানসূচক)',
        ruleBn: '아버지-এর উচ্চ সম্মানসূচক রূপ 아버님।',
        grammarId: 'g_honorific',
      ),
      WordSegment(
        text: '께서 ',
        type: 'grammar',
        meaningBn: '(সম্মানসূচক কর্তৃ কারক)',
        ruleBn: 'সম্মানিত ব্যক্তি কর্তা হলে 이/가-এর বদলে 께서 বসে।',
        grammarId: 'g_honorific',
      ),
      WordSegment(
        text: '키',
        type: 'word',
        meaningBn: 'উচ্চতা',
        ruleBn: 'মূল বিশেষ্য শব্দ (Height)।',
      ),
      WordSegment(
        text: '가 ',
        type: 'grammar',
        meaningBn: '(পার্টিকেল)',
        ruleBn: 'স্বরবর্ণের পরে সাবজেক্ট পার্টিকেল -가 বসে।',
        grammarId: 'g_subject',
      ),
      WordSegment(
        text: '크시네요.',
        type: 'change',
        meaningBn: 'বেশ লম্বা দেখছি!',
        ruleBn: '크다 (লম্বা) + -(으)시- (সম্মানসূচক) + -네요 = 크시네요।',
        grammarId: 'g_honorific',
      ),
    ],
    meaningBn: 'আপনার বাবা তো বেশ লম্বা দেখছি!',
    meaningEn: 'Your father is very tall!',
    pronBn: 'আবনিম-ক্কেস খিগা খৃশিনেয়ো।',
  ),
];

final List<VocabItem> sampleLesson8Vocab = [
  VocabItem(id: 'v1', kr: '할아버지', bn: 'দাদা / নানা', en: 'Grandfather', pronBn: 'হালআবজি', icon: '👴'),
  VocabItem(id: 'v2', kr: '할머니', bn: 'দাদি / নানি', en: 'Grandmother', pronBn: 'হালমনি', icon: '👵'),
  VocabItem(id: 'v3', kr: '아버지', bn: 'বাবা', en: 'Father', pronBn: 'আবজি', icon: '👨'),
  VocabItem(id: 'v4', kr: '어머니', bn: 'মা', en: 'Mother', pronBn: 'অমনি', icon: '👩'),
  VocabItem(id: 'v5', kr: '집 / 댁', bn: 'বাড়ি (সম্মানার্থে)', en: 'House', pronBn: 'জিপ / দেক', icon: '🏠'),
  VocabItem(id: 'v6', kr: '주무시다', bn: 'ঘুমানো (সম্মানার্থে)', en: 'To sleep', pronBn: 'জুমুশিদা', icon: '🛌'),
];

final List<GrammarTopic> allGrammarTopics = [
  GrammarTopic(
    id: 'g_honorific',
    title: '-(으)시- (সম্মানসূচক প্রত্যয়)',
    subtitleBn: 'বাক্যের কর্তা বয়সে বড় বা সম্মানিত ব্যক্তি হলে ক্রিয়া বা বিশেষণের সাথে -(으)시- যুক্ত হয়।',
    formulaLeft: 'বাচ্চিম না থাকলে: -시-
가다 -> 가시다',
    formulaRight: 'বাচ্চিম থাকলে: -으시-
읽다 -> 읽으시다',
    examples1To5: [
      DialogueLine(
        id: 'ex1',
        speaker: 'উদাহরণ ১',
        track: '',
        segments: [
          WordSegment(text: '할아버지께서 ', type: 'word', meaningBn: 'দাদা', ruleBn: 'সম্মানিত কর্তা'),
          WordSegment(text: '가십니다.', type: 'change', meaningBn: 'যাচ্ছেন।', ruleBn: '가다 + 시 + ㅂ니다', grammarId: 'g_honorific'),
        ],
        meaningBn: '১. দাদা/নানা যাচ্ছেন।',
        meaningEn: '1. Grandfather is going.',
        pronBn: 'হালআবজি-ক্কেস গাশিমনিদা।',
      ),
      DialogueLine(
        id: 'ex2',
        speaker: 'উদাহরণ ২',
        track: '',
        segments: [
          WordSegment(text: '아버님께서 ', type: 'word', meaningBn: 'বাবা', ruleBn: 'সম্মানিত কর্তা'),
          WordSegment(text: '책을 ', type: 'word', meaningBn: 'বই', ruleBn: 'কর্ম কারক'),
          WordSegment(text: '읽으십니다.', type: 'change', meaningBn: 'পড়ছেন।', ruleBn: '읽다 (বাচ্চিম আছে) + 으시 + ㅂ니다', grammarId: 'g_honorific'),
        ],
        meaningBn: '২. বাবা বই পড়ছেন।',
        meaningEn: '2. Father is reading a book.',
        pronBn: 'আবনিম-ক্কেস ছেগুল ইলগৃশিমনিদা।',
      ),
      DialogueLine(
        id: 'ex3',
        speaker: 'উদাহরণ ৩',
        track: '',
        segments: [
          WordSegment(text: '어머니께서 ', type: 'word', meaningBn: 'মা', ruleBn: 'সম্মানিত কর্তা'),
          WordSegment(text: '지금 ', type: 'word', meaningBn: 'এখন', ruleBn: 'সময়'),
          WordSegment(text: '식사를 하십니다.', type: 'change', meaningBn: 'খাবার খাচ্ছেন।', ruleBn: '식사하다 + 시 + ㅂ니다', grammarId: 'g_honorific'),
        ],
        meaningBn: '৩. মা এখন খাবার খাচ্ছেন।',
        meaningEn: '3. Mother is having a meal now.',
        pronBn: 'অমনি-ক্কেস জিগুম শিকসারূল হাশিমনিদা।',
      ),
      DialogueLine(
        id: 'ex4',
        speaker: 'উদাহরণ ৪',
        track: '',
        segments: [
          WordSegment(text: '사장님께서 ', type: 'word', meaningBn: 'মালিক/বস্', ruleBn: 'সম্মানিত কর্তা'),
          WordSegment(text: '우리에게 ', type: 'grammar', meaningBn: 'আমাদেরকে', ruleBn: 'ব্যক্তিবাচক পার্টিকেল 에게'),
          WordSegment(text: '이야기하십니다.', type: 'change', meaningBn: 'কথা বলছেন।', ruleBn: '이야기하다 + 시 + ㅂ니다', grammarId: 'g_honorific'),
        ],
        meaningBn: '৪. মালিক আমাদের সাথে কথা বলছেন।',
        meaningEn: '4. The boss is speaking to us.',
        pronBn: 'সাজাংনিম-ক্কেস উরিয়েগে ইয়াগিহাশিমনিদা।',
      ),
      DialogueLine(
        id: 'ex5',
        speaker: 'উদাহরণ ৫',
        track: '',
        segments: [
          WordSegment(text: '선생님께서 ', type: 'word', meaningBn: 'শিক্ষক', ruleBn: 'সম্মানিত কর্তা'),
          WordSegment(text: '교실에서 ', type: 'grammar', meaningBn: 'শ্রেণীকক্ষে', ruleBn: 'স্থানবাচক পার্টিকেল 에서'),
          WordSegment(text: '한국어를 ', type: 'word', meaningBn: 'কোরিয়ান ভাষা', ruleBn: 'কর্ম কারক'),
          WordSegment(text: '가르치십니다.', type: 'change', meaningBn: 'শেখাচ্ছেন।', ruleBn: '가르치다 + 시 + ㅂ니다', grammarId: 'g_honorific'),
        ],
        meaningBn: '৫. শিক্ষক শ্রেণীকক্ষে কোরিয়ান ভাষা শেখাচ্ছেন।',
        meaningEn: '5. The teacher is teaching Korean in the classroom.',
        pronBn: 'সনসেংনিম-ক্কেস গিওশিরেস হানগুগরূল গারৃছিশিমনিদা।',
      ),
    ],
  ),
  GrammarTopic(
    id: 'g_subject',
    title: '이 / 가 এবং 께서 (সাবজেক্ট পার্টিকেল)',
    subtitleBn: 'বাক্যের কর্তা বা সাবজেক্ট চিহ্নিত করতে শব্দের শেষে 이/가 এবং সম্মানিত ব্যক্তির ক্ষেত্রে 께서 বসে।',
    formulaLeft: 'বাচ্চিম থাকলে: -이
가족 + 이 = 가족이',
    formulaRight: 'স্বরবর্ণ হলে: -가
키 + 가 = 키가',
    examples1To5: [],
  ),
  GrammarTopic(
    id: 'g_ieyo',
    title: '-이에요 / -예요 (হয় / আছি)',
    subtitleBn: 'বিশেষ্য পদের শেষে যুক্ত হয়ে পরিচয় বা বিবৃতি প্রকাশ করে।',
    formulaLeft: 'বাচ্চিম থাকলে: -이에요
학생이에요',
    formulaRight: 'বাচ্চিম না থাকলে: -예요
의사예요',
    examples1To5: [],
  ),
];
