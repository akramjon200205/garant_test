import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_garant/future/common/assets.dart';
import 'package:test_garant/future/presentation/test_yechish/bloc/test_bloc.dart';

// ignore: must_be_immutable
class BackNextWidgetOnTest extends StatelessWidget {
  final Function()? nextFunction;
  final Function()? backFunction;
  int activeIndex;
  BackNextWidgetOnTest({
    super.key,
    this.nextFunction,
    this.backFunction,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backFunction == null
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: backFunction,
                  icon: SvgPicture.asset(
                    Assets.icons.backIcon,
                  ),
                ),
          Text(
              "${activeIndex+=1}/${(context.read<TestBloc>().state.testModel?.resoult?.data?.length ?? 0)}"),
          nextFunction == null
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: nextFunction,
                  icon: SvgPicture.asset(
                    Assets.icons.nextIcon,
                  ),
                ),
        ],
      ),
    );
  }
}
