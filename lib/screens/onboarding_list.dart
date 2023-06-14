class OnBoarding {
  String title;
  String img;
  String description;
  OnBoarding(
      {required this.title, required this.description, required this.img});
}

List<OnBoarding> page1 = [
  OnBoarding(
      title: "Welcome to Zip",
      img: "assets/images/logo.png",
      description:"Quis ut dolorum architecto dolorem ipsum aperiam eligendi."),
  OnBoarding(
      title: "Move money across borders",
      img: "assets/images/logo2.png",
      description:"Quis ut dolorum architecto dolorem ipsum aperiam eligendi"),
  OnBoarding(
      title: "Collect payment from anyone",
      img: "assets/images/logo3.png",
      description:"Quis ut dolorum architecto dolorem ipsum aperiam eligendi"),

];