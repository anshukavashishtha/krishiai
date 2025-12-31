class GeminiService {
  static Future<Map<String, dynamic>> analyzeCropText({
    required String crop,
    required String symptoms,
  }) async {
    final s = symptoms.toLowerCase();

    String disease = 'Healthy Crop';
    String recommendation =
        'No immediate action required. Maintain proper irrigation and nutrition.';
    int confidence = 65;

    // 🌾 CEREALS
    if (crop == 'Wheat') {
      if (s.contains('yellow') || s.contains('rust')) {
        disease = 'Yellow Rust';
        recommendation =
            'Apply rust-resistant fungicide and remove infected plants.';
        confidence = 85;
      } else if (s.contains('powder')) {
        disease = 'Powdery Mildew';
        recommendation =
            'Use sulfur fungicide and ensure proper airflow.';
        confidence = 80;
      }
    }

    if (crop == 'Rice') {
      if (s.contains('brown') || s.contains('spot')) {
        disease = 'Brown Spot';
        recommendation =
            'Use balanced fertilization and fungicide spray.';
        confidence = 82;
      } else if (s.contains('blast')) {
        disease = 'Rice Blast';
        recommendation =
            'Apply tricyclazole and avoid excess nitrogen.';
        confidence = 88;
      }
    }

    if (crop == 'Maize') {
      if (s.contains('rot') || s.contains('brown')) {
        disease = 'Maize Ear Rot';
        recommendation =
            'Remove infected ears and reduce moisture stress.';
        confidence = 84;
      } else if (s.contains('spots')) {
        disease = 'Northern Corn Leaf Blight';
        recommendation =
            'Apply fungicide and practice crop rotation.';
        confidence = 80;
      }
    }

    if (crop == 'Barley') {
      if (s.contains('stripe')) {
        disease = 'Barley Stripe Disease';
        recommendation =
            'Use certified seeds and seed treatment fungicide.';
        confidence = 78;
      }
    }

    // 🌱 VEGETABLES
    if (crop == 'Tomato') {
      if (s.contains('white') || s.contains('powder')) {
        disease = 'Powdery Mildew';
        recommendation =
            'Apply sulfur fungicide and improve ventilation.';
        confidence = 80;
      } else if (s.contains('black') || s.contains('spot')) {
        disease = 'Early Blight';
        recommendation =
            'Remove infected leaves and use copper fungicide.';
        confidence = 83;
      }
    }

    if (crop == 'Potato') {
      if (s.contains('late') || s.contains('blight')) {
        disease = 'Late Blight';
        recommendation =
            'Apply fungicide immediately and destroy infected plants.';
        confidence = 90;
      }
    }

    if (crop == 'Onion') {
      if (s.contains('purple')) {
        disease = 'Purple Blotch';
        recommendation =
            'Use mancozeb spray and avoid overhead irrigation.';
        confidence = 82;
      }
    }

    if (crop == 'Chilli') {
      if (s.contains('curl')) {
        disease = 'Leaf Curl Virus';
        recommendation =
            'Control whiteflies and remove infected plants.';
        confidence = 87;
      }
    }

    if (crop == 'Brinjal') {
      if (s.contains('wilt')) {
        disease = 'Bacterial Wilt';
        recommendation =
            'Practice crop rotation and soil sterilization.';
        confidence = 85;
      }
    }

    if (crop == 'Cabbage' || crop == 'Cauliflower') {
      if (s.contains('yellow')) {
        disease = 'Yellows Disease';
        recommendation =
            'Use resistant varieties and maintain soil health.';
        confidence = 78;
      }
    }

    // 🌿 CASH CROPS
    if (crop == 'Cotton') {
      if (s.contains('boll') || s.contains('rot')) {
        disease = 'Boll Rot';
        recommendation =
            'Improve drainage and use recommended fungicide.';
        confidence = 82;
      }
    }

    if (crop == 'Sugarcane') {
      if (s.contains('red') || s.contains('rot')) {
        disease = 'Red Rot';
        recommendation =
            'Remove affected canes and plant resistant varieties.';
        confidence = 88;
      }
    }

    if (crop == 'Soybean') {
      if (s.contains('rust')) {
        disease = 'Soybean Rust';
        recommendation =
            'Apply fungicide early and monitor crop regularly.';
        confidence = 84;
      }
    }

    if (crop == 'Groundnut') {
      if (s.contains('leaf') && s.contains('spot')) {
        disease = 'Leaf Spot';
        recommendation =
            'Use chlorothalonil fungicide and rotate crops.';
        confidence = 80;
      }
    }

    if (crop == 'Mustard') {
      if (s.contains('white') || s.contains('rust')) {
        disease = 'White Rust';
        recommendation =
            'Remove infected plants and apply fungicide.';
        confidence = 83;
      }
    }

    // 🍎 FRUITS
    if (crop == 'Apple') {
      if (s.contains('scab')) {
        disease = 'Apple Scab';
        recommendation =
            'Apply fungicide and prune affected branches.';
        confidence = 85;
      }
    }

    if (crop == 'Banana') {
      if (s.contains('yellow') || s.contains('wilt')) {
        disease = 'Panama Disease';
        recommendation =
            'Remove infected plants and improve soil drainage.';
        confidence = 90;
      }
    }

    if (crop == 'Mango') {
      if (s.contains('black') || s.contains('spot')) {
        disease = 'Anthracnose';
        recommendation =
            'Use copper fungicide and prune infected areas.';
        confidence = 82;
      }
    }

    if (crop == 'Grapes') {
      if (s.contains('powder')) {
        disease = 'Powdery Mildew';
        recommendation =
            'Apply sulfur fungicide and maintain air circulation.';
        confidence = 88;
      }
    }

    if (crop == 'Orange') {
      if (s.contains('canker')) {
        disease = 'Citrus Canker';
        recommendation =
            'Remove infected branches and apply copper spray.';
        confidence = 86;
      }
    }

    // 🌱 FALLBACK
    if (disease == 'Healthy Crop' && s.isNotEmpty) {
      disease = 'Possible Fungal Infection';
      recommendation =
          'Monitor crop closely and consult an agricultural officer.';
      confidence = 60;
    }

    return {
      'disease': disease,
      'confidence': confidence,
      'recommendation': recommendation,
    };
  }
}
