import 'package:flutter/material.dart';
import 'package:test_garant/future/common/app_colors.dart';
import 'package:test_garant/future/common/app_text_styles.dart';
import 'package:test_garant/future/common/material_button.dart';
import 'package:test_garant/future/presentation/data/model/test_model.dart';

// ignore: must_be_immutable
class TestItemWidget extends StatefulWidget {
  TestItemWidget({
    super.key,
    required this.activeIndex,
    required this.listData,
  });

  final int activeIndex;
  Data? listData;

  @override
  State<TestItemWidget> createState() => _TestItemWidgetState();
}

class _TestItemWidgetState extends State<TestItemWidget>
    with AutomaticKeepAliveClientMixin {
  bool isChoose = false;

  @override
  void initState() {
    super.initState();
  }

  int activeIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 18,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Savol:",
                    style: AppTextStyles.body20w6.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    widget.listData?.question ?? '',
                    style: AppTextStyles.body15w4.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Javoblar",
              style: AppTextStyles.body15w4.copyWith(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return OptionsWidget(
                  option: widget.listData?.options?[index].option,

                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemCount: 3,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  List<String> _shuffleList(List<String> list) {
    List<String> result = [];
    result.addAll(list);
    result.shuffle();
    return result;
  }

  @override
  bool get wantKeepAlive => true;
}

class OptionsWidget extends StatefulWidget {
  String? option;  
  OptionsWidget({super.key, this.option});

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  bool isChoose = false;
  @override
  Widget build(BuildContext context) {
    return MaterialInkWellButton(
      color: isChoose == true
          // ignore: unrelated_type_equality_checks
          ? AppColors.green
          : AppColors.white,
      function: () {
        setState(() {
          isChoose = true;
        });
        
      },
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      borderRadius: BorderRadius.circular(10),
      child: Text(
        widget.option ?? '',
        style: AppTextStyles.body16w7.copyWith(
          color: AppColors.textColor,
        ),
        maxLines: 5,
      ),
    );
  }
}
