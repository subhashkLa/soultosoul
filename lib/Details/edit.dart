import 'package:soultosoul/APi/pages.dart';

class Edits extends StatefulWidget {
  _Edits createState() => new _Edits();
}

class _Edits extends State<Edits> {
  FrontEnd frontEnd = new FrontEnd();
  String text;
  String _phoneno;
  String _bloodgroup;
  String _shortaddress;
  String _city;
  String _state;

  void initState() {
    super.initState();
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: new Text(
                  "Soul to Soul",
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(bottom: 0.0),
                child: new Text(
                  "Donor Detail Edit",
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: new Container(
            child: ListView(
          controller: ScrollController(),
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 20.0, right: 20.0, left: 20.0),
              child: frontEnd.text(
                Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      labelText: "Phone No",
                      alignLabelWithHint: false,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10.0)),
                  onChanged: (String phoneno) {
                    setState(() {
                      _phoneno = phoneno;
                    });
                  },
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 20.0, right: 20.0, left: 20.0),
              child: frontEnd.text(
                Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      labelText: "Blood Group",
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
                  top: 10.0, bottom: 20.0, right: 20.0, left: 20.0),
              child: frontEnd.text(
                Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      labelText: "Short Address",
                      alignLabelWithHint: false,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10.0)),
                  onChanged: (String shortaddress) {
                    setState(() {
                      _shortaddress = shortaddress;
                    });
                  },
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 20.0, right: 20.0, left: 20.0),
              child: frontEnd.text(
                Icon(
                  FontAwesomeIcons.user,
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
                  top: 10.0, bottom: 20.0, right: 20.0, left: 20.0),
              child: frontEnd.text(
                Icon(
                  FontAwesomeIcons.user,
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
                      stream: Firestore.instance
                          .collection('Donor Details')
                          .document(snapshotss.data.displayName)
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snap) {
                        return StreamBuilder(
                          stream: FirebaseAuth.instance.onAuthStateChanged,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            Map<String, String> data = <String, String>{
                              "Blood Group": _bloodgroup,
                              "Phone No": _phoneno,
                              "Short Address": _shortaddress,
                              "City": _city,
                              "State": _state,
                            };
                            void _add() {
                              final DocumentReference documentReference =
                                  Firestore.instance
                                      .collection("Donor Details")
                                      .document(snapshotss.data.displayName);
                              documentReference
                                  .updateData(data)
                                  .whenComplete(() {
                                print("Data Updated");
                              }).catchError((e) => print(e));
                            }

                            return new ButtonTheme(
                              minWidth: 350.0,
                              height: 50.0,
                              child: new RaisedButton(
                                onPressed: () {
                                  _add();
                                },
                                child: new SizedBox(
                                  child: Row(
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.only(left: 130.0),
                                      ),
                                      new Text(
                                        "Update",
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
                      },
                    );
                  }),
            ),
          ],
        )));
  }
}
