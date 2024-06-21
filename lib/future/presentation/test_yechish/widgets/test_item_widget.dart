import 'package:flutter/material.dart';
import 'package:test_garant/future/common/app_colors.dart';
import 'package:test_garant/future/common/app_text_styles.dart';
import 'package:test_garant/future/common/enums/option_status.dart';
import 'package:test_garant/future/presentation/data/model/test_model.dart';
import 'package:test_garant/future/presentation/test_yechish/widgets/option_widget.dart';

// ignore: must_be_immutable
class TestItemWidget extends StatefulWidget {
  TestItemWidget({
    super.key,
    required this.activeIndex,
    required this.data,
  });

  final int activeIndex;
  Data? data;

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
                    widget.data?.question ?? '',
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
            widget.data != null
                ? AllOptionsWidget(
                    data: widget.data!,
                  )
                : const SizedBox.shrink(),
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

class AllOptionsWidget extends StatefulWidget {
  const AllOptionsWidget({
    super.key,
    required this.data,
  });

  final Data data;

  @override
  State<AllOptionsWidget> createState() => _AllOptionsWidgetState();
}

class _AllOptionsWidgetState extends State<AllOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OptionsWidget(
          option: widget.data.options?[index].option,
          onTap: () {
            setState(() {
              widget.data.selectedOption = widget.data.options?[index];
            });
            if (widget.data.selectedOption == null) {}
          },
          optionStatus: getOptionStatus(widget.data.options?[index]),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 12,
        );
      },
      itemCount: 3,
    );
  }

  OptionStatus getOptionStatus(Options? option) {
    if (widget.data.selectedOption == null) {
      return OptionStatus.empty;
    } else {
      if (option?.status == "1") {
        return OptionStatus.correct;
      } else if (widget.data.selectedOption?.option == option?.option) {
        if (option?.status == "1") {
          return OptionStatus.correct;
        } else {
          return OptionStatus.inCorrect;
        }
      }
    }

    return OptionStatus.empty;
  }
}
