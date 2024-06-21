import 'package:flutter/material.dart';
import 'package:test_garant/future/common/app_colors.dart';
import 'package:test_garant/future/common/app_text_styles.dart';

class NavigateButtonsWidget extends StatelessWidget {
  const NavigateButtonsWidget({
    super.key,
    required this.activeIndex,
    required this.pageController,
    required this.scrollController,
    required this.indexCount,
  });

  final int activeIndex;
  final int indexCount;
  final PageController pageController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        controller: scrollController,
        padding: EdgeInsets.zero.copyWith(left: 30, right: 30),
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: indexCount,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final bool isSelected = false;
          return InkWell(
            onTap: () {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
              );
            },
            child: Container(
              width: 40,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isSelected
                    ? AppColors.blue
                    : (activeIndex == index
                        ? AppColors.green
                        : AppColors.white),
              ),
              child: Text(
                "${index + 1}",
                style: AppTextStyles.body16w4.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
