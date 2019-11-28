import 'package:soultosoul/APi/pages.dart';

class Event extends StatefulWidget {
  _Event createState() => new _Event();
}

class _Event extends State<Event> {
  FrontEnd frontEnd = new FrontEnd();
  String _bloodgroup;
  String _phone;
  String _landmark;
  String _city;
  String _state;

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Scaffold(
        appBar: new AppBar(
          title: new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: new Text("Soul to Soul"),
              ),
              new Padding(
                padding: EdgeInsets.only(bottom: 0.0),
                child: new Text("Event"),
              ),
            ],
          ),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(context, Page(route: Edits())),
              child: new Icon(FontAwesomeIcons.edit),
            )
          ],
        ),
        body: new Container(
          color: Color.fromRGBO(58, 66, 86, 1.0),
            child: ListView(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, right: 20.0, left: 20.0),
              child: frontEnd.text(
                Icon(
                  FontAwesomeIcons.city,
                  color: Colors.white,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      labelText: "Required Blood Group",
                      alignLabelWithHint: false,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10.0)),
                  onChanged: (String bloodgroup) {
                    setState(() {
                      _bloodgroup = bloodgroup;
                    });
                  },
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, right: 20.0, left: 20.0),
              child: frontEnd.text(
                Icon(
                  FontAwesomeIcons.city,
                  color: Colors.white,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      labelText: "Phone No",
                      alignLabelWithHint: false,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10.0)),
                  onChanged: (String phone) {
                    setState(() {
                      _phone = phone;
                    });
                  },
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, right: 20.0, left: 20.0),
              child: frontEnd.text(
                Icon(
                  FontAwesomeIcons.city,
                  color: Colors.white,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      labelText: "LandMark",
                      alignLabelWithHint: false,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10.0)),
                  onChanged: (String landmark) {
                    setState(() {
                      _landmark = landmark;
                    });
                  },
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, right: 20.0, left: 20.0),
              child: frontEnd.text(
                Icon(
                  FontAwesomeIcons.city,
                  color: Colors.white,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      labelText: "City",
                      alignLabelWithHint: false,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10.0)),
                  onChanged: (String city) {
                    setState(() {
                      _city = city;
                    });
                  },
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, right: 20.0, left: 20.0),
              child: frontEnd.text(
                Icon(
                  FontAwesomeIcons.city,
                  color: Colors.white,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      labelText: "State",
                      alignLabelWithHint: false,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10.0)),
                  onChanged: (String state) {
                    setState(() {
                      _state = state;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 40.0, right: 20.0, left: 20.0),
              child: StreamBuilder(
                  stream: FirebaseAuth.instance.onAuthStateChanged,
                  builder: (BuildContext context,
                      AsyncSnapshot<FirebaseUser> snapshotss) {
                    return StreamBuilder(
                      stream: FirebaseAuth.instance.onAuthStateChanged,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        Map<String, String> data = <String, String>{
                          "Username": snapshotss.data.displayName,
                          "Required BG": _bloodgroup,
                          "Phone No": _phone,
                          "Short Address": _landmark,
                          "City": _city,
                          "State": _state,
                          "Image": snapshotss.data.photoUrl,
                        };
                        void _add() {
                          final DocumentReference documentReference = Firestore
                              .instance
                              .collection("Event")
                              .document();
                          documentReference.setData(data).whenComplete(() {
                            print("Added the data");
                          }).catchError((e) => print(e));
                        }
                        return new ButtonTheme(
                          minWidth: 350.0,
                          height: 50.0,
                          child: new RaisedButton(
                            onPressed: () {
                              _add();
                              Timer(
                                  Duration(seconds: 2),
                                  () => Navigator.pushReplacement(
                                      context, Page(route: Homepage())));
                            },
                            child: new SizedBox(
                              child: Row(
                                children: <Widget>[
                                  new Padding(
                                    padding: EdgeInsets.only(left: 130.0),
                                  ),
                                  new Text(
                                    "Event",
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
                        );
                      },
                    );
                  }),
            ),
          ],
        )));
  }
}
