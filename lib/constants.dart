class Constants {
  static double padding = 20;
  static double avatarRadius = 45;

  static List<String> routineActions = [
    "exercise",
    "meditation",
    "meals",
    "drinks",
    "snacks",
  ];

  static List<String> medsAndSymptoms = [
    "supplements",
    "medication",
    "symptoms",
  ];

  static List<String> autoEvaluationQuantifiedParameters = [
    "sleepQuality",
    "energyLevel",
    "mood",
  ];

  static bool needsTimePicker(parameter) => {
        "meditation": true,
        "exercise": true,
        "medication": true,
        "supplements": true,
        "meals": true,
        "drinks": true,
        "snacks": true,
        "symptoms": false,
      }[parameter] as bool;

  static bool needsTwoTimePickers(parameter) => {
        "meditation": true,
        "exercise": true,
        "medication": false,
        "supplements": false,
        "meals": true,
        "drinks": false,
        "snacks": false,
        "symptoms": false,
      }[parameter] as bool;

  static bool needsQualitySlider(parameter) => {
        "meditation": true,
        "exercise": true,
        "medication": false,
        "supplements": false,
        "meals": false,
        "drinks": false,
        "snacks": false,
        "symptoms": true,
      }[parameter] as bool;

  static Map<String, List<String>> allItems = {
    "meditation": typesOfMeditation,
    "exercise": [...aerobicExercises, ...anaerobicExercises],
    "medication": typesOfMedicaments,
    "supplements": typesOfSupplements,
    "meals": foodIngredients,
    "drinks": typesOfDrinks,
    "snacks": typesOfSnacks,
    "symptoms": symptoms,
  };

  static Map<String, String> dailyRegisterToUIString = {
    "registerCreationDate": "Register Created at",
    "description": "Description",
    "sleepQuality": "Sleep Quality",
    "energyLevel": "Energy Level",
    "weight": "Weight",
    "mood": "Mood",
    "supplements": "Supplements",
    "medication": "Medication",
    "symptoms": "Symptoms",
    "exercise": "Exercise",
    "meditation": "Meditation",
    "meals": "Meals",
    "drinks": "Drinks",
    "snacks": "Snacks"
  };

  static List<String> symptoms = [
    "Leg Pain",
    "Chest Pain",
    "Abdominal Pain",
    "Diarrhea",
    "Obstipation",
    "Bad vision",
    "Weakness",
    "Dizziness",
    "Brain Fog",
    "Fatigue",
  ];

  static List<String> typesOfMeditation = [
    "mindfulness meditation",
    "spiritual meditation",
    "focused meditation",
    "movement meditation",
    "mantra meditation",
    "transcendental meditation",
    "progressive relaxation",
    "loving-kindness meditation",
    "visualization meditation",
  ];

  static List<String> foodIngredients = ["cabbage", "carrot"];

  static List<String> typesOfDrinks = ["water", "wine", "coke"];

  static List<String> typesOfSnacks = [
    "Cookies",
    "Cakes",
    "Pastries",
    "Fruits and vegetables",
    "Seeds, nuts, grains and legumes",
    "Bars",
    "Bread/sandwiches",
  ];

  static List<String> typesOfSupplements = [
    "Calcium",
    "Collagen",
    "Magnesium",
    "Omega 3s",
    "Probiotics",
    "Vitamin D",
    "Vitamin C",
    "Vitamin K",
    "Multivitamins",
    "B-Complex",
    "B-12",
    "Melatonin",
    "Zinc",
    "Fish Oil",
    "Algae Oil",
    "Curcumin",
    "Turmeric"
  ];

  static List<String> typesOfMedicaments = [
    "Bruffen",
    "Eutirox",
    "Ben-u-ron",
    "Aspirin",
    "Metformin"
  ];

  static List<String> aerobicExercises = [
    "Aerobics",
    "Circuit training",
    "Cycling",
    "Hiking",
    "Running",
    "Skipping rope",
    "Swimming",
    "Walking",
  ];

  static List<String> anaerobicExercises = [
    "Bodybuilding",
    "Eccentric training",
    "Functional training",
    "Sprinting",
    "Weight training",
  ];
}
