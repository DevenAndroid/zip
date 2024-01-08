class OnBoarding {
  String title;
  String img;
  String description;

  OnBoarding(
      {required this.title, required this.description, required this.img});
}

List<OnBoarding> page1 = [
  OnBoarding(
      title:
          "Welcome to ZIP                                                     ",
      img: "assets/images/logo.png",
      description: "Introducing a new way to manage your finances."),
  OnBoarding(
      title: "Move money\nacross borders",
      img: "assets/images/logo2.png",
      description:
          "Moving money has never been easier with our digital wallet."),
  OnBoarding(
      title: "Collect payment\nfrom anyone",
      img: "assets/images/logo3.png",
      description:
          "Be ready to receive money in matter of minutes with a simple link from the app."),
];
