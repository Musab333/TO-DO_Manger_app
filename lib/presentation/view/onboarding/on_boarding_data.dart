class OnBoardingData {
  final String image;
  final String titleDecription;
  final String subTitleDecription;

  OnBoardingData({
    required this.image,
    required this.titleDecription,
    required this.subTitleDecription,
  });
}

//Lottie.asset('assets/images/note.json'),
List<OnBoardingData> onBoardingDataList = [
  OnBoardingData(
    image: 'assets/images/onboarding_3.svg',
    titleDecription: 'أضافة المهام اليومية',
    subTitleDecription: 'قم بضافة كل المهام الجديد التي تريد ان تقوم بها',
    //قائمة مهام بسيطة وذكية تجعل من السهل تخطيط يومك
  ),
  OnBoardingData(
    image: "assets/images/onboarding_2.svg",
    titleDecription: 'أنهاء مهامك اليومية',
    subTitleDecription: 'يمكنك انهاء مهامك اليومية وقائمة المهام بكل سهولة',
  ),
  OnBoardingData(
    image: "assets/images/onboarding_1.svg",
    titleDecription: 'الاحتفاظ بالمهام',
    subTitleDecription: 'قم بالاحتفاط بكل المهام التي قمت بها في قسم الارشفة',
  ),
];
