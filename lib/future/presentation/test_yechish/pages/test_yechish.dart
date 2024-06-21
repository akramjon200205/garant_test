import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_garant/future/common/app_colors.dart';
import 'package:test_garant/future/common/app_text_styles.dart';
import 'package:test_garant/future/common/assets.dart';
import 'package:test_garant/future/common/enums/bloc_status.dart';
import 'package:test_garant/future/presentation/data/model/test_model.dart';
import 'package:test_garant/future/presentation/home/home_page.dart';
import 'package:test_garant/future/presentation/main/main_menu.dart';
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
                        onTap: () {
                          _showAlertDialog(context);
                        },
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
                listData: state.testModel?.resoult?.data ?? [],
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
                      data: state.testModel?.resoult?.data?[index],
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

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Column(
            children: [
              SvgPicture.asset(Assets.icons.alertIcon),
              const SizedBox(height: 16),
              Text(
                'Haqiqatda ham testni yakunlashni hohlaysizmi?',
                textAlign: TextAlign.center,
                style: AppTextStyles.body15w4.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                'Belgilanmagan test javoblari xato deb hisobga olinadi',
                textAlign: TextAlign.center,
                style: AppTextStyles.body14w5.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Qaytish',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {                
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MainPage(initialPage: 0);
                    },
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Yakunlash',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
