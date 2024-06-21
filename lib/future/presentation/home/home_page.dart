import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:test_garant/future/common/app_colors.dart';
import 'package:test_garant/future/common/app_text_styles.dart';
import 'package:test_garant/future/common/assets.dart';
import 'package:test_garant/future/presentation/data/model/test_model.dart';
import 'package:test_garant/future/presentation/main/main_menu.dart';
import 'package:test_garant/future/presentation/test_yechish/bloc/test_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double percent = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;

  @override
  void initState() {
    super.initState();
    _calculateResults();
  }

  void _calculateResults() {
    List<Data> testData = [];
    context.read<TestBloc>().state.testModel?.resoult?.data?.forEach((element) {
      testData.add(element);
    });
    int correct = 0;
    int incorrect = 0;

    for (var data in testData) {
      if (data.selectedOption != null) {
        if (data.selectedOption!.status == "1") {
          correct++;
        } else {
          incorrect++;
        }
      } else {
        incorrect++;
      }
    }

    setState(() {
      correctAnswers = correct;
      incorrectAnswers = incorrect;
      percent = testData.isEmpty ? 0 : correct / testData.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 64.0,
              lineWidth: 13.0,
              animation: true,
              percent: percent,
              center: Text(
                "${(percent * 100).toStringAsFixed(1)}%",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: percent < 0.5
                  ? Colors.red
                  : percent < 0.9
                      ? Colors.orange
                      : Colors.green,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Yakunlandi",
              style: AppTextStyles.body24w5.copyWith(
                color: AppColors.black,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Afsuski sizga ball taqdim etilmadi",
              style: AppTextStyles.body15w4.copyWith(
                color: const Color(0xff575757),
              ),
            ),
            Text(
              "Ja’mi to’plangan ballaringiz soni: 0 ta",
              style: AppTextStyles.body15w4.copyWith(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Umumiy testlar soni: ${context.read<TestBloc>().state.testModel?.resoult?.data?.length ?? 0}",
                style: AppTextStyles.body13w4.copyWith(
                  color: const Color(0xff575757),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffE1FFED),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$correctAnswers",
                        style: AppTextStyles.body24w5.copyWith(
                          color: AppColors.green,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "To'g'ri javob",
                        style: AppTextStyles.body15w4.copyWith(
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffFFE6E6),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$incorrectAnswers",
                        style: AppTextStyles.body24w5.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Noto'g'ri javob",
                        style: AppTextStyles.body15w4.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.icons.timer,
                  color: AppColors.orange,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "20:00 / 11:34",
                  style:
                      AppTextStyles.body15w4.copyWith(color: AppColors.orange),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.refresh,
                      color: AppColors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Qayta urinish",
                      style: AppTextStyles.body14w5.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.lightWhite,
                ),
                child: Text(
                  "Qayta urinish",
                  style: AppTextStyles.body14w5.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
