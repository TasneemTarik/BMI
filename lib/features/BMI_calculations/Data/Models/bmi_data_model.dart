class BmiDataModel {
  final String height;
  final String weight;
  final double bmi;
  final String risk;
  final String summary;
  final String recommendation;

  BmiDataModel({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.risk,
    required this.summary,
    required this.recommendation,
  });

  factory BmiDataModel.fromjson(Map<String, dynamic> json) {
    return BmiDataModel(
      height: json['height'],
      weight: json['weight'],
      bmi: json['bmi'],
      risk: json['risk'],
      summary: json['summary'],
      recommendation: json['recommendation'],
    );
  }
}

// Map<String, dynamic> datamodel = {
//   "status": "ok",
//   "error": null,
//   "data": {
//     "height": "170 cm",
//     "weight": "70 kg",
//     "bmi": 24.221453287197235,
//     "risk": "Low risk",
//     "summary": "This weight is normal and you are healthy.",
//     "recommendation":
//         "A BMI between 18.5 and 24.9 falls within the 'normal' weight range according to the World Health Organization. This range is associated with the lowest health risk for conditions such as heart disease, diabetes, and certain cancers. However, it's important to note that BMI is not a perfect measure as it does not account for muscle mass, bone density, overall body composition, and racial and sex differences. Therefore, while it's a useful starting point, it should not be the only measure of one's health.",
//   },
// };
