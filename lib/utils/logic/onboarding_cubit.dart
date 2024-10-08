import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoenix/utils/logic/onboarding_state.dart';

import '../constans/information_onBoardList.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(InitBoarding());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  PageController pageController = PageController();
  int currentPosition = 0;

  next(context) {
    if(currentPosition < onBoardingModelList.length){
      currentPosition++;
      pageController.animateToPage(currentPosition,
        duration:  const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    if (currentPosition == onBoardingModelList.length) {
      Navigator.pushNamed(context, '/LoginScreen');
    }
  }

  back(context) {
    if (currentPosition > 0) {
      currentPosition--;
      pageController.animateToPage(
        currentPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(SuccessNextPage());
    }
  }

  onChangePage(int index) {
    currentPosition = index;
    emit(SuccessChangePage());
  }
}