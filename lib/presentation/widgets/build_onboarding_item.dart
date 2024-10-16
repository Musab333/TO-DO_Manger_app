import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../view/onboarding/on_boarding_data.dart';

// ignore: must_be_immutable
class BuildOnBoardingItem extends StatelessWidget {
  OnBoardingData onBoardingData;

  BuildOnBoardingItem({
    required this.onBoardingData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SvgPicture.asset(
            onBoardingData.image,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          textAlign: TextAlign.center,
          onBoardingData.titleDecription,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'Cairo',
            //fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          textAlign: TextAlign.center,
          onBoardingData.subTitleDecription,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
