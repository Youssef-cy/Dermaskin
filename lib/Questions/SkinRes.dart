enum SkinType {
  OILY,
  DRY,
  NORMAL,
  COMBINATION,
  SENSITIVE,
}

class SkinScore {
  static Map<SkinType, int> scores = {
    SkinType.OILY: 0,
    SkinType.DRY: 0,
    SkinType.NORMAL: 0,
    SkinType.COMBINATION: 0,
    SkinType.SENSITIVE: 0,
  };

  static void reset() {
    scores.updateAll((key, value) => 0);
  }

  static void addAnswer(int questionIndex, int optionIndex) {
    switch (questionIndex) {
      case 0:
        if (optionIndex == 0) scores[SkinType.DRY] = scores[SkinType.DRY]! + 2;
        if (optionIndex == 1) scores[SkinType.OILY] = scores[SkinType.OILY]! + 2;
        if (optionIndex == 2) scores[SkinType.COMBINATION] = scores[SkinType.COMBINATION]! + 2;
        if (optionIndex == 3) scores[SkinType.NORMAL] = scores[SkinType.NORMAL]! + 2;
        break;

      case 1:
        if (optionIndex == 0) scores[SkinType.NORMAL] = scores[SkinType.NORMAL]! + 1;
        if (optionIndex == 1) scores[SkinType.OILY] = scores[SkinType.OILY]! + 2;
        if (optionIndex == 2) scores[SkinType.COMBINATION] = scores[SkinType.COMBINATION]! + 2;
        if (optionIndex == 3) scores[SkinType.DRY] = scores[SkinType.DRY]! + 1;
        break;

      case 2:
        if (optionIndex == 0) scores[SkinType.NORMAL] = scores[SkinType.NORMAL]! + 1;
        if (optionIndex == 1) scores[SkinType.OILY] = scores[SkinType.OILY]! + 2;
        if (optionIndex == 2) scores[SkinType.COMBINATION] = scores[SkinType.COMBINATION]! + 2;
        if (optionIndex == 3) scores[SkinType.DRY] = scores[SkinType.DRY]! + 1;
        break;

      case 3:
        if (optionIndex == 0) scores[SkinType.DRY] = scores[SkinType.DRY]! + 2;
        if (optionIndex == 1) scores[SkinType.OILY] = scores[SkinType.OILY]! + 2;
        if (optionIndex == 2) scores[SkinType.COMBINATION] = scores[SkinType.COMBINATION]! + 2;
        if (optionIndex == 3) scores[SkinType.NORMAL] = scores[SkinType.NORMAL]! + 1;
        break;

      case 4:
        if (optionIndex == 0) scores[SkinType.DRY] = scores[SkinType.DRY]! + 2;
        if (optionIndex == 1) scores[SkinType.OILY] = scores[SkinType.OILY]! + 1;
        if (optionIndex == 2) scores[SkinType.COMBINATION] = scores[SkinType.COMBINATION]! + 2;
        if (optionIndex == 3) scores[SkinType.NORMAL] = scores[SkinType.NORMAL]! + 2;
        break;
    }
  }

  static SkinType getResult() {
    return scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }
}