import 'package:flutter/material.dart';
import 'package:test_garant/future/common/app_text_styles.dart';
import 'package:test_garant/future/common/enums/option_status.dart';
import 'package:test_garant/future/common/material_button.dart';

import '../../../common/app_colors.dart';

class OptionsWidget extends StatelessWidget {
  OptionsWidget({
    super.key,
    this.option,
    required this.onTap,
    this.optionStatus = OptionStatus.empty,
  });
  final String? option;
  final Function() onTap;
  final OptionStatus optionStatus;

  bool isChoose = false;
  @override
  Widget build(BuildContext context) {
    return MaterialInkWellButton(
      color: getStatusColor(),
      function: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      borderRadius: BorderRadius.circular(10),
      child: Text(
        option ?? '',
        style: AppTextStyles.body16w7.copyWith(
          color: AppColors.textColor,
        ),
        maxLines: 5,
      ),
    );
  }

  Color getStatusColor() {
    switch (optionStatus) {
      case OptionStatus.empty:
        return AppColors.white;
      case OptionStatus.correct:
        return AppColors.green;
      case OptionStatus.inCorrect:
        return AppColors.red;
      default:
        return AppColors.white;
    }
  }
}
