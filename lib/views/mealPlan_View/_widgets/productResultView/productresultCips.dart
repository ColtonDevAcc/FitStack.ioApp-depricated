import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:openfoodfacts/model/EnvironmentImpactLevels.dart';
import 'package:openfoodfacts/model/IngredientsAnalysisTags.dart';
import 'package:openfoodfacts/model/NutrientLevels.dart';
import '../../../../theme/theme.dart';

class NutrientsLevelsChip extends StatelessWidget {
  const NutrientsLevelsChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final Level? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsLevelColor = {
      Level.LOW: Colors.green,
      Level.MODERATE: Colors.orange,
      Level.HIGH: Colors.red,
      Level.UNDEFINED: Colors.grey,
      null: Colors.grey,
    };
    Map nutrientsLevelIcons = {
      Level.LOW: LineIcons.check,
      Level.MODERATE: LineIcons.exclamation,
      Level.HIGH: LineIcons.skull,
      Level.UNDEFINED: LineIcons.question,
      null: LineIcons.question,
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsLevelColor[value],
        child: Icon(
          nutrientsLevelIcons[value],
          color: Colors.white,
          size: 20,
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsLevelColor[value],
        ),
      ),
    );
  }
}

class VeganStatusChip extends StatelessWidget {
  const VeganStatusChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final VeganStatus? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsLevelColor = {
      VeganStatus.VEGAN: Colors.green,
      VeganStatus.MAYBE_VEGAN: Colors.orange,
      VeganStatus.NON_VEGAN: Colors.red,
      VeganStatus.VEGAN_STATUS_UNKNOWN: Colors.grey,
      null: Colors.grey,
    };
    Map nutrientsLevelIcons = {
      VeganStatus.VEGAN: LineIcons.check,
      VeganStatus.MAYBE_VEGAN: LineIcons.exclamation,
      VeganStatus.NON_VEGAN: LineIcons.skull,
      VeganStatus.VEGAN_STATUS_UNKNOWN: LineIcons.question,
      null: LineIcons.question,
    };
    Map veganStatusLabel = {
      VeganStatus.VEGAN: 'Vegan',
      VeganStatus.MAYBE_VEGAN: 'Maybe Vegan',
      VeganStatus.NON_VEGAN: 'Non-Vegan',
      VeganStatus.VEGAN_STATUS_UNKNOWN: 'Uknown',
      null: 'Uknown',
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsLevelColor[value],
        child: Icon(
          nutrientsLevelIcons[value],
          color: Colors.white,
          size: 20,
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label - ${veganStatusLabel[value]}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsLevelColor[value],
        ),
      ),
    );
  }
}

class NutritionSCoreChip extends StatelessWidget {
  const NutritionSCoreChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsScoreColor = {
      'a': Colors.green,
      'b': Colors.green.shade200,
      'c': Colors.yellow.shade600,
      'd': Colors.orange,
      'e': Colors.red,
      'null': Colors.grey,
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsScoreColor[value],
        child: Text(
          value == 'null' ? '?' : '${value!.toUpperCase()}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label - ${value!.toUpperCase()}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsScoreColor[value],
        ),
      ),
    );
  }
}

class PalmOilStatusChip extends StatelessWidget {
  const PalmOilStatusChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final PalmOilFreeStatus? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsScoreColor = {
      PalmOilFreeStatus.PALM_OIL_FREE: Colors.green,
      PalmOilFreeStatus.MAY_CONTAIN_PALM_OIL: Colors.orange,
      PalmOilFreeStatus.PALM_OIL: Colors.red,
      PalmOilFreeStatus.PALM_OIL_CONTENT_UNKNOWN: Colors.grey,
      null: Colors.grey,
    };

    Map palmOilLabel = {
      PalmOilFreeStatus.PALM_OIL_FREE: 'Palm Oil Free',
      PalmOilFreeStatus.MAY_CONTAIN_PALM_OIL: 'May Contain Palm Oil',
      PalmOilFreeStatus.PALM_OIL: 'Contains Palm Oil',
      PalmOilFreeStatus.PALM_OIL_CONTENT_UNKNOWN: 'Unknown',
      null: 'Unknown',
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsScoreColor[value],
        child: Icon(
          LineIcons.paw,
          color: Colors.white,
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label - ${palmOilLabel[value].toString().toUpperCase()}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsScoreColor[value],
        ),
      ),
    );
  }
}

class VegetarianStatusChip extends StatelessWidget {
  const VegetarianStatusChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final VegetarianStatus? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsScoreColor = {
      VegetarianStatus.VEGETARIAN: Colors.green,
      VegetarianStatus.MAYBE_VEGETARIAN: Colors.orange,
      VegetarianStatus.NON_VEGETARIAN: Colors.red,
      VegetarianStatus.VEGETARIAN_STATUS_UNKNOWN: Colors.grey,
      null: Colors.grey,
    };

    Map palmOilLabel = {
      VegetarianStatus.VEGETARIAN: 'Vegetarian',
      VegetarianStatus.MAYBE_VEGETARIAN: 'Maybe Vegetarian',
      VegetarianStatus.NON_VEGETARIAN: 'Non-Vegetarian',
      VegetarianStatus.VEGETARIAN_STATUS_UNKNOWN: 'Unknown',
      null: 'Unknown',
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsScoreColor[value],
        child: Icon(
          LineIcons.egg,
          size: 18,
          color: Colors.white,
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label - ${palmOilLabel[value].toString().toUpperCase()}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsScoreColor[value],
        ),
      ),
    );
  }
}

class EnviromentStatusChip extends StatelessWidget {
  const EnviromentStatusChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsScoreColor = {
      EnvironmentImpactLevels: Colors.green,
      VegetarianStatus.MAYBE_VEGETARIAN: Colors.orange,
      VegetarianStatus.NON_VEGETARIAN: Colors.red,
      'unknown': Colors.grey,
      null: Colors.grey,
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsScoreColor[value],
        child: Icon(
          LineIcons.leaf,
          color: Colors.white,
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label - ${value}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsScoreColor[value],
        ),
      ),
    );
  }
}

class NovaGroupChip extends StatelessWidget {
  const NovaGroupChip({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final int? value;

  @override
  Widget build(BuildContext context) {
    Map nutrientsScoreColor = {
      1: Colors.green,
      2: Colors.green.shade300,
      3: Colors.orange,
      4: Colors.red,
      null: Colors.grey
    };

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 3,
      avatar: CircleAvatar(
        backgroundColor: nutrientsScoreColor[value],
        child: Icon(
          LineIcons.heartAlt,
          size: 15,
          color: Colors.white,
        ),
      ),
      backgroundColor: Apptheme.mainCardColor,
      label: Text(
        '$label - ${value}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: nutrientsScoreColor[value],
        ),
      ),
    );
  }
}
