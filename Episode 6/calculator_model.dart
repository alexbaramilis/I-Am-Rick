const kMinimumHeight = 0;
const kMaximumHeight = 300;

const kMinimumWeight = 0;
const kMaximumWeight = 700;

enum ActivityLevel { Active, Sedentary }
enum FitnessGoal { MuscleGain, FatLoss, Maintenance }

class CalculatorModel {
  // INPUTS
  int height = 170;
  int weight = 70;
  List<String> activityLevelNames = ['Active', 'Sedentary'];
  List<bool> activityLevelStates = [true, false];
  List<String> fitnessGoalNames = ['Muscle Gain', 'Fat Loss', 'Maintenance'];
  List<bool> fitnessGoalStates = [true, false, false];

  // OUTPUTS
  int minimumProteinIntake;
  int maximumProteinIntake;
  int powerLifterProteinIntake;
  String minimumResultLabel;
  String maximumResultLabel;
  String maximumResultAdditionalLabel;
  String additionalInfoLabel;
  String additionalInfoAdditionalLabel;
  String units = 'grams/day';

  void calculate() {
    ActivityLevel activityLevel = parseActivityLevel();
    FitnessGoal fitnessGoal = parseFitnessGoal();

    switch (isHealthyWeight()) {
      case true:
        switch (activityLevel) {
          case ActivityLevel.Active:
            switch (fitnessGoal) {
              case FitnessGoal.MuscleGain:
                minimumProteinIntake = (1.4 * weight.toDouble()).round();
                maximumProteinIntake = (2.4 * weight.toDouble()).round();
                powerLifterProteinIntake = (3.3 * weight.toDouble()).round();
                minimumResultLabel = 'Your optimal protein intake is at least';
                maximumResultLabel = 'Intakes of up to';
                maximumResultAdditionalLabel =
                    'may provide additional benefit, based on limited evidence.';
                additionalInfoLabel = 'For experienced lifters, intakes up to';
                additionalInfoAdditionalLabel =
                    'may help minimize fat gain while bulking.';
                break;
              case FitnessGoal.FatLoss:
                minimumProteinIntake = (1.8 * weight.toDouble()).round();
                maximumProteinIntake = (2.7 * weight.toDouble()).round();
                powerLifterProteinIntake = (3.3 * weight.toDouble()).round();
                minimumResultLabel = 'Your optimal protein intake is at least';
                maximumResultLabel = 'Intakes of up to';
                maximumResultAdditionalLabel =
                    'may provide additional benefit, based on limited evidence.';
                additionalInfoLabel = 'For experienced lifters, intakes up to';
                additionalInfoAdditionalLabel =
                    'may help minimize fat gain while bulking.';
                break;
              case FitnessGoal.Maintenance:
                minimumProteinIntake = (1.4 * weight.toDouble()).round();
                maximumProteinIntake = (1.6 * weight.toDouble()).round();
                powerLifterProteinIntake = null;
                minimumResultLabel = 'Your optimal protein intake is at least';
                maximumResultLabel = 'Intakes of up to';
                maximumResultAdditionalLabel =
                    'may provide additional benefit, based on limited evidence.';
                additionalInfoLabel =
                    'People who are trying to keep the same weight but improve their body composition (more muscle, less fat) may benefit from the higher end of the range.';
                additionalInfoAdditionalLabel = null;
                break;
            }
            break;
          case ActivityLevel.Sedentary:
            minimumProteinIntake = (1.2 * weight.toDouble()).round();
            maximumProteinIntake = null;
            powerLifterProteinIntake = null;
            minimumResultLabel = 'Your optimal protein intake is at least';
            maximumResultLabel = null;
            maximumResultAdditionalLabel = null;
            additionalInfoLabel =
                'Keep in mind that you\'ll get better body composition results by adding consistent activity than merely by hitting a protein target.';
            additionalInfoAdditionalLabel = null;
            break;
        }
        break;
      case false:
        minimumProteinIntake = (1.2 * weight.toDouble()).round();
        maximumProteinIntake = (1.5 * weight.toDouble()).round();
        powerLifterProteinIntake = null;
        minimumResultLabel = 'Your optimal protein intake is at least';
        maximumResultLabel = 'Intakes of up to';
        maximumResultAdditionalLabel =
            'may provide additional benefit, based on limited evidence.';
        additionalInfoLabel = null;
        additionalInfoAdditionalLabel = null;
        break;
    }
  }

  ActivityLevel parseActivityLevel() {
    return ActivityLevel.values[activityLevelStates.indexOf(true)];
  }

  FitnessGoal parseFitnessGoal() {
    return FitnessGoal.values[fitnessGoalStates.indexOf(true)];
  }

  bool isHealthyWeight() {
    double bmi = weight.toDouble() * 10000 / (height * height).toDouble();
    bmi = double.parse(bmi.toStringAsFixed(1)); // round to 1 decimal point
    return bmi >= 25.0 ? false : true;
  }
}
