import 'package:soultosoul/APi/pages.dart';

class Walkthroughs extends StatelessWidget {
  
  final List<Walkthrough> list = [
    Walkthrough(
      title: "WELCOME",
      content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      imageIcon: Icons.directions_walk,
    ),
    Walkthrough(
      title: "Donor",
      content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      imageIcon: Icons.search,
    ),
    Walkthrough(
      title: "Hospital",
      content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      imageIcon: Icons.local_hospital,
    ),
    Walkthrough(
      title: "Event",
      content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      imageIcon: Icons.event,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new IntroScreen(
      list,
      new MaterialPageRoute(builder: (context) => new SignIn()),
    );
  }
}