import 'package:flutter/material.dart';
import 'package:flutter_application_api/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_application_api/features/home/presentation/view/home_data/home_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDataScrene extends StatefulWidget {
  const HomeDataScrene({super.key});

  @override
  State<HomeDataScrene> createState() => _HomeDataScreneState();
}

class _HomeDataScreneState extends HomeDataWigets {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        builder: (context, state) {
          if (state is HomeLordingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoadedState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: loadedView(state: state),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget loadedView({required HomeLoadedState state}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textField(),
        categoriesView(state: state),
        sliderView(state: state),
        sizedbox(),
        bestsellersView(state: state),
        hotDealsView(state: state),
        SizedBox(height: 15.h),
        justInView(state: state),
        SizedBox(height: 13.h),
        topPicksView(state: state),
        sizedbox(),
        giftingWidgetView(state: state),
        sizedbox(),
        referFriendView(state: state),
        sizedbox(),
        superSaversView(state: state),
        sizedbox(),
        newlylaunchedSection(state: state),
        SizedBox(height: 14.h),
        thisThatSection(state: state),
        sizedbox(),
        skincareBasicsSection(state: state),
        sizedbox(),
        sugarWidgets(state: state),
        sizedbox(),
        merchStation(state: state),
        sizedbox(),
        exploreWidget(state: state),
        SizedBox(height: 30.h),
      ],
    );
  }

  SizedBox sizedbox({double? height}) => SizedBox(height: height ?? 10.h);
}
