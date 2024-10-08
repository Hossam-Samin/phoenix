import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/constans/information_onBoardList.dart';
import '../utils/logic/onboarding_cubit.dart';
import '../utils/logic/onboarding_state.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        OnBoardingCubit onBoardingCubit = OnBoardingCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                // Skip button stays at the top and does not move with the page
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, right: 10),
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: () {},
                      color: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 25, right: 25),
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontFamily: "Rubik",
                        ),
                      ),
                    ),
                  ),
                ),

                // PageView only for the image and text content
                Expanded(
                  child: PageView.builder(
                    controller: onBoardingCubit.pageController,
                    onPageChanged: (value) {
                      onBoardingCubit.onChangePage(value);
                    },
                    itemCount: onBoardingModelList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            onBoardingModelList[index].image,
                            height: 250,
                            width: 200,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 150, left: 10),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                onBoardingModelList[index].title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Rubik",
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                onBoardingModelList[index].body,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Rubik",
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // The static row containing dots and buttons stays at the bottom
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 15)),
                        ...List.generate(
                          onBoardingModelList.length,
                              (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 800),
                            margin: const EdgeInsets.only(right: 5),
                            height: 6,
                            width: onBoardingCubit.currentPosition == index ? 20 : 20,
                            decoration: BoxDecoration(
                              color: onBoardingCubit.currentPosition == index
                                  ? Colors.blueAccent.withOpacity(0.8)
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            child: IconButton(
                              onPressed: () {
                                onBoardingCubit.back(context);
                              },
                              icon: const Icon(
                                Icons.arrow_left_sharp,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.indigo,
                            ),
                            child: IconButton(
                              onPressed: () {
                                onBoardingCubit.next(context);
                              },
                              icon: const Icon(
                                Icons.arrow_right_sharp,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}