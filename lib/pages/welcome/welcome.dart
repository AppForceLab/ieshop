import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ieshop/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ieshop/pages/welcome/bloc/welcome_events.dart';

import 'bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 35.h),
            width: 376.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                      index: 1,
                      context: context,
                      buttonName: 'next',
                      subTitle:
                          'Forget about a for of paper all knoladge in one learning!',
                      title: 'First See Learning',
                      imagePath: 'assets/images/reading.png',
                      pageController: pageController,
                    ),
                    _page(
                      index: 2,
                      context: context,
                      buttonName: 'next',
                      subTitle:
                          'Always keep in touch with your tutor & friend. Let\'s get onnected!',
                      title: 'Connect With Everyone',
                      imagePath: 'assets/images/boy.png',
                      pageController: pageController,
                    ),
                    _page(
                      index: 3,
                      context: context,
                      buttonName: 'get started',
                      subTitle:
                          'Anywhere, anytime. The time is at your discretion so study whenever you want.',
                      title: 'Always Fascinated Learning',
                      imagePath: 'assets/images/man.png',
                      pageController: pageController,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    position: state.page.toDouble(),
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}

Widget _page(
    {required int index,
    required BuildContext context,
    required String buttonName,
    required String title,
    required String subTitle,
    required String imagePath,
    required PageController pageController}) {
  return Column(
    children: [
      SizedBox(
        width: 345.w,
        height: 345.w,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
      Container(
        width: 375.w,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Text(
          subTitle,
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
      GestureDetector(
        onTap: () {
          if (index < 3) {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate);
          } else {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => const MyHomePage(),
            Navigator.of(context)
                .pushNamedAndRemoveUntil("signIn", (route) => false);
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 1))
              ]),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      )
    ],
  );
}
