import 'package:soultosoul/APi/pages.dart';

class SignIn extends StatefulWidget {
  _SignIn createState() => new _SignIn();
}

class _SignIn extends State<SignIn> {
  FrontEnd frontend = new FrontEnd();
  Backend sign = new Backend();

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

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
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: new AssetImage('image/app_icon.png'),
                        radius: 100.0,
                        foregroundColor: Colors.white,
                      ),
                      width: 200.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    Text("SOUL TO SOUL",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(40.0),
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                    ),
                    new ButtonTheme(
                      minWidth: 350.0,
                      height: 50.0,
                      child: new RaisedButton(
                        onPressed: () {
                          sign.handleSignIn();
                          Timer(
                              Duration(seconds: 8),
                              () => Navigator.push(
                                  context, Page(route: new Donor())));
                        },
                        child: new SizedBox(
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    new AssetImage('image/Google.png'),
                              ),
                              new Padding(
                                padding: EdgeInsets.only(left: 75.0),
                              ),
                              new Text(
                                "GOOGLE",
                                style: new TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w900,
                                    foreground: Paint()
                                      ..shader = linearGradient),
                              )
                            ],
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    new Text("By Logging in you agree to out privacy policy")
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
