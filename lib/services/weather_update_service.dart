class WeatherUpdateService {
  static String getWeatherAdvice(String input) {
    final q = input.toLowerCase().trim();

    /* ===================== GENERAL WEATHER ===================== */

    // ☀️ Heat / Summer
    if (q.contains('heat') || q.contains('hot') || q.contains('summer')) {
      return '☀️ Hot Weather Advisory:\n'
          '🌡️ Heat stress reduces crop growth\n'
          '💧 Increase irrigation frequency\n'
          '🌾 Use mulching to conserve moisture\n'
          '⏰ Irrigate early morning or evening';
    }

    // 🌧️ Rain
    if (q.contains('rain')) {
      return '🌧️ Rainy Weather Advisory:\n'
          '🚫 Avoid extra irrigation\n'
          '⚠️ High risk of fungal diseases\n'
          '🌱 Ensure proper drainage';
    }

    // ❄️ Cold / Frost
    if (q.contains('cold') || q.contains('frost') || q.contains('winter')) {
      return '❄️ Cold Weather Advisory:\n'
          '⚠️ Frost may damage crops\n'
          '🌫️ Light irrigation at night can reduce frost injury\n'
          '🛡️ Use protective covers if possible';
    }

    // 🌬️ Wind / Storm
    if (q.contains('wind') || q.contains('storm')) {
      return '🌬️ Wind Advisory:\n'
          '🌱 Strong winds may lodge crops\n'
          '🪵 Provide support to tall plants\n'
          '🚫 Avoid spraying pesticides';
    }

    // 🌫️ Humidity
    if (q.contains('humidity')) {
      return '🌫️ High Humidity Advisory:\n'
          '⚠️ Increased fungal disease risk\n'
          '✂️ Improve airflow\n'
          '🧪 Preventive fungicide may be needed';
    }

    /* ===================== CEREALS ===================== */

    // 🌾 Wheat
    if (q.contains('wheat')) {
      return '🌾 Wheat Weather Advisory:\n'
          '❄️ Frost during flowering is harmful\n'
          '🌧️ Rain may increase rust disease\n'
          '☀️ Heat stress reduces grain filling';
    }

    // 🍚 Rice
    if (q.contains('rice')) {
      return '🍚 Rice Weather Advisory:\n'
          '🌧️ Excess rain causes lodging\n'
          '☀️ Heat stress reduces yield\n'
          '🌬️ Wind can flatten crop';
    }

    // 🌽 Maize / Corn
    if (q.contains('maize') || q.contains('corn')) {
      return '🌽 Maize Weather Advisory:\n'
          '☀️ Heat stress during tasseling is harmful\n'
          '🌬️ Wind may lodge plants';
    }

    // 🌾 Barley
    if (q.contains('barley')) {
      return '🌾 Barley Weather Advisory:\n'
          '❄️ Sensitive to frost at flowering\n'
          '☀️ High heat shortens grain filling';
    }

    // 🌾 Sorghum
    if (q.contains('sorghum')) {
      return '🌾 Sorghum Weather Advisory:\n'
          '☀️ Tolerant to heat\n'
          '🌧️ Excess rain may cause lodging';
    }

    // 🌾 Millet
    if (q.contains('millet') || q.contains('bajra')) {
      return '🌾 Millet Weather Advisory:\n'
          '☀️ Drought tolerant crop\n'
          '🌧️ Excess rain may reduce yield';
    }

    /* ===================== PULSES ===================== */

    // 🌱 Chickpea
    if (q.contains('chickpea') || q.contains('gram')) {
      return '🌱 Chickpea Weather Advisory:\n'
          '🌧️ Excess rain causes root rot\n'
          '❄️ Frost damages flowers';
    }

    // 🌱 Pigeon pea
    if (q.contains('pigeon') || q.contains('arhar')) {
      return '🌱 Pigeon Pea Weather Advisory:\n'
          '🌧️ Waterlogging is harmful\n'
          '🌬️ Wind damages tall plants';
    }

    // 🌱 Lentil
    if (q.contains('lentil')) {
      return '🌱 Lentil Weather Advisory:\n'
          '❄️ Frost sensitive crop\n'
          '🌧️ Excess rain causes disease';
    }

    /* ===================== VEGETABLES ===================== */

    // 🍅 Tomato
    if (q.contains('tomato')) {
      return '🍅 Tomato Weather Advisory:\n'
          '🌫️ High humidity causes blight\n'
          '☀️ Heat causes flower drop\n'
          '🌬️ Wind damages branches';
    }

    // 🥔 Potato
    if (q.contains('potato')) {
      return '🥔 Potato Weather Advisory:\n'
          '❄️ Frost damages foliage\n'
          '🌧️ Excess rain increases blight risk';
    }

    // 🧅 Onion
    if (q.contains('onion')) {
      return '🧅 Onion Weather Advisory:\n'
          '🌧️ Rain during maturity causes rotting\n'
          '🌫️ Humidity increases fungal diseases';
    }

    // 🌶️ Chilli
    if (q.contains('chilli')) {
      return '🌶️ Chilli Weather Advisory:\n'
          '🌫️ High humidity causes leaf curl\n'
          '☀️ Heat reduces flowering';
    }

    // 🍆 Brinjal
    if (q.contains('brinjal') || q.contains('eggplant')) {
      return '🍆 Brinjal Weather Advisory:\n'
          '🌧️ Excess moisture increases wilt\n'
          '🌬️ Wind damages plants';
    }

    /* ===================== FRUITS ===================== */

    // 🍌 Banana
    if (q.contains('banana')) {
      return '🍌 Banana Weather Advisory:\n'
          '🌬️ Strong winds uproot plants\n'
          '🌧️ Waterlogging causes root rot';
    }

    // 🥭 Mango
    if (q.contains('mango')) {
      return '🥭 Mango Weather Advisory:\n'
          '🌧️ Rain during flowering reduces fruit set\n'
          '🌫️ Humidity increases anthracnose';
    }

    // 🍎 Apple
    if (q.contains('apple')) {
      return '🍎 Apple Weather Advisory:\n'
          '❄️ Frost damages blossoms\n'
          '🌧️ Rain increases scab disease';
    }

    // 🍇 Grapes
    if (q.contains('grape')) {
      return '🍇 Grape Weather Advisory:\n'
          '🌫️ Humidity causes powdery mildew\n'
          '🌧️ Rain affects fruit quality';
    }

    /* ===================== CASH CROPS ===================== */

    // 🌿 Cotton
    if (q.contains('cotton')) {
      return '🌿 Cotton Weather Advisory:\n'
          '🌧️ Rain during boll opening reduces quality\n'
          '☀️ Heat stress lowers yield';
    }

    // 🌱 Sugarcane
    if (q.contains('sugarcane')) {
      return '🌱 Sugarcane Weather Advisory:\n'
          '🌧️ Excess rain causes lodging\n'
          '☀️ High temperature increases water demand';
    }

    // 🌻 Sunflower
    if (q.contains('sunflower')) {
      return '🌻 Sunflower Weather Advisory:\n'
          '🌧️ Rain during flowering reduces seed set\n'
          '🌬️ Wind may lodge plants';
    }

    // 🌰 Groundnut
    if (q.contains('groundnut') || q.contains('peanut')) {
      return '🌰 Groundnut Weather Advisory:\n'
          '🌧️ Excess rain causes pod rot\n'
          '☀️ Dry weather preferred at maturity';
    }

    /* ===================== DEFAULT ===================== */

    return '🌦️ Weather Update Help:\n'
        'Tell me your crop name or weather condition (rain, heat, cold, wind) to get crop-specific advice.';
  }
}
