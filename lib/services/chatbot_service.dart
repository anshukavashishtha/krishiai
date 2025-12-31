class ChatbotService {
  static String getReply(String input) {
    final q = input.toLowerCase().trim();

    // 👋 Greetings
    if (q == 'hi' || q == 'hello' || q == 'hey') {
      return '👋 Hey! How can I help you today?\n\n'
          'You can ask me about crop diseases, '
          'fertilizers, irrigation, and pest control.';
    }

    // 🙏 Thanks
    if (q.contains('thank')) {
      return '😊 You’re welcome!\nCan I help you with anything else?';
    }

    // ✅ Yes
    if (q == 'yes') {
      return 'Great 👍\nPlease tell me your crop name or problem 🌱';
    }

    // ❌ No
    if (q == 'no') {
      return 'Alright 😊\nHope you liked KrishiAI.\n'
          'Wishing you healthy crops 🌾';
    }

    /* ===================== CROPS ===================== */

    // 🌾 Wheat
    if (q.contains('wheat')) {
      if (q.contains('yellow')) {
        return '🌾 Wheat leaves turning yellow may indicate **Yellow Rust**.\n'
            '🧪 Use fungicide\n'
            '🌿 Fertilizer: Urea + DAP\n'
            '💧 Avoid excess irrigation';
      }
      return '🌾 Wheat crop care:\n'
          '🌿 Fertilizer: Urea, DAP\n'
          '💧 Moderate irrigation';
    }

    // 🍚 Rice
    if (q.contains('rice')) {
      if (q.contains('brown') || q.contains('spot')) {
        return '🍚 Brown Spot disease detected.\n'
            '🧪 Apply fungicide\n'
            '🌿 Fertilizer: NPK + Zinc';
      }
      return '🍚 Rice crop needs standing water and balanced NPK fertilizer.';
    }

    // 🌽 Maize
    if (q.contains('maize') || q.contains('corn')) {
      return '🌽 Maize recommendations:\n'
          '🌿 Fertilizer: Urea + DAP\n'
          '🐛 Watch for leaf blight';
    }

    // 🍅 Tomato
    if (q.contains('tomato')) {
      if (q.contains('black')) {
        return '🍅 Black spots = Early Blight.\n'
            '🧪 Copper fungicide\n'
            '🌿 Fertilizer: NPK';
      }
      return '🍅 Tomato care:\n'
          '🌿 Fertilizer: NPK\n'
          '☀️ Good sunlight & airflow';
    }

    // 🥔 Potato
    if (q.contains('potato')) {
      return '🥔 Potato care:\n'
          '🧪 Protect from blight\n'
          '🌿 Fertilizer: Potash rich';
    }

    // 🍌 Banana
    if (q.contains('banana')) {
      return '🍌 Banana crop:\n'
          '🌿 Fertilizer: Urea + Potash\n'
          '💧 Proper drainage required';
    }

    // 🌿 Cotton
    if (q.contains('cotton')) {
      return '🌿 Cotton care:\n'
          '🐛 Control bollworms\n'
          '🌿 Fertilizer: NPK + Potash';
    }

    /* ===================== GENERAL ===================== */

    // 💧 Irrigation
    if (q.contains('irrigation') || q.contains('water')) {
      return '💧 Irrigation tips:\n'
          '❌ Overwatering → root rot\n'
          '✅ Follow crop-based schedule';
    }

    // 🌿 Fertilizer
    if (q.contains('fertilizer')) {
      return '🌿 Common fertilizers:\n'
          '• Urea – Nitrogen\n'
          '• DAP – Phosphorus\n'
          '• NPK – Balanced growth\n'
          '• Potash – Quality & strength';
    }

    // 🐛 Pest
    if (q.contains('pest') || q.contains('insect')) {
      return '🐛 Pest control:\n'
          '• Neem oil\n'
          '• Avoid excess chemicals\n'
          '• Use IPM methods';
    }

    // 🌦 Weather
    if (q.contains('rain') || q.contains('weather')) {
      return '🌦 Rain increases fungal disease risk.\n'
          '👀 Monitor crops regularly';
    }

    // 🤖 Default
    return '🤖 I can help with:\n'
        '🌱 Crop diseases\n'
        '🌿 Fertilizers\n'
        '💧 Irrigation\n'
        '🐛 Pests\n\n'
        'Please tell me your crop and issue.';
  }
}
