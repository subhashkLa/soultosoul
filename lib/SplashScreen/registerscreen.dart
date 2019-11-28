import 'package:soultosoul/APi/pages.dart';

class RegisterSplash extends StatefulWidget {
  _RegisterSplash createState() => _RegisterSplash();
}

class _RegisterSplash extends State<RegisterSplash> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.push(context, Page(route: Walkthroughs())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Container(
          color: Color.fromRGBO(58, 66, 86, 1.0),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: new AssetImage('image/app_icon.png'),
                        radius: 50.0,
                      ),
                      width: 100.0,
                      height: 100.0,
                      padding: const EdgeInsets.all(2.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    SizedBox(
                      child: FadeAnimatedTextKit(
                          isRepeatingAnimation: false,
                          text: ['Soul to Soul'],
                          duration: Duration(seconds: 4),
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 32.0,
                              fontFamily: "Bobbers"),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional.topStart),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
