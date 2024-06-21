import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_garant/future/common/app_colors.dart';
import 'package:test_garant/future/common/app_text_styles.dart';
import 'package:test_garant/future/common/assets.dart';
import 'package:test_garant/future/common/enums/bloc_status.dart';
import 'package:test_garant/future/presentation/data/model/test_model.dart';
import 'package:test_garant/future/presentation/test_yechish/bloc/test_bloc.dart';
import 'package:test_garant/future/presentation/test_yechish/widgets/back_next_widget_on_test.dart';
import 'package:test_garant/future/presentation/test_yechish/widgets/navigation_button_widget.dart';
import 'package:test_garant/future/presentation/test_yechish/widgets/test_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestYechishPage extends StatefulWidget {
  const TestYechishPage({super.key});

  @override
  State<TestYechishPage> createState() => _TestYechishPageState();
}

class _TestYechishPageState extends State<TestYechishPage> {
  late PageController pageController;
  late ScrollController indicatorController;
  int activeIndex = 0;

  

  @override
  void initState() {
    super.initState();
    context.read<TestBloc>().add(const GetTestEvent());
    pageController = PageController();
    indicatorController = ScrollController();
    pageController.addListener(
      () {
        _onPageChanged(pageController.page ?? 1);
        setState(
          () {
            final int index = pageController.page!.ceil();
            if (activeIndex != index) {
              activeIndex = index;
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightWhite,
      body: BlocConsumer<TestBloc, TestState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.getAllTestStatus == BlocStatus.inProgress) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.black,
              ),
            );
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18)
                    .copyWith(top: 80),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          Assets.icons.close,
                        ),
                      ),
                      SvgPicture.asset(
                        Assets.icons.message,
                      ),
                      SvgPicture.asset(
                        Assets.icons.mode,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          color: AppColors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.icons.timer),
                            Text(
                              "19:59",
                              style: AppTextStyles.body15w4.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              NavigateButtonsWidget(
                scrollController: indicatorController,
                activeIndex: activeIndex,
                pageController: pageController,
                indexCount: state.testModel?.resoult?.data?.length ?? 0,
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: List.generate(
                    state.testModel?.resoult?.data?.length ?? 0,
                    (index) => TestItemWidget(
                      activeIndex: activeIndex,
                      listData: state.testModel?.resoult?.data?[index],                      
                    ),
                  ),
                ),
              ),
              BackNextWidgetOnTest(
                backFunction: !(activeIndex >= 1)
                    ? null
                    : () {
                        if (activeIndex >= 1) {
                          _animateToPage(--activeIndex);
                        }
                      },
                nextFunction: (activeIndex ==
                        (state.testModel?.resoult?.data?.length ?? 0) - 1)
                    ? null
                    : () {
                        if (activeIndex <
                            (state.testModel?.resoult?.data?.length ?? 0)) {
                          _animateToPage(++activeIndex);
                        }
                      },
                      activeIndex: activeIndex,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.home),
            label: "Asosiy",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.qoidalar),
            label: "Qoidalar",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.test),
            label: "Test",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.profile),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  void _onPageChanged(double index) {
    // Scroll to the corresponding indicator
    indicatorController.animateTo(
      index * 50.0, // Adjust the value based on your indicator width
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  _animateToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
