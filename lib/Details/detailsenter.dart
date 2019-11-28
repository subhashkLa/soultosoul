import 'package:soultosoul/APi/pages.dart';

class Donor extends StatefulWidget {
  _Donor createState() => new _Donor();
}

class _Donor extends State<Donor> {
  String _username;
  String _fullname;
  String _phone;
  String _bloodgroup;
  String _shortaddress;
  String _city;
  String _state;
  String _searchKey;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  FrontEnd frontend = new FrontEnd();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
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
                  "Donor Details",
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
          child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: new Container(
                color: Color.fromRGBO(58, 66, 86, 1.0),
                child: new ListView(
                  controller: ScrollController(),
                  children: <Widget>[
                    new Container(
                        decoration:
                            new BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
                        height: 60.0,
                        child: new Center(
                          child: Text(
                            "Welcome",
                            style: new TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        )),
                    new Padding(
                      padding: EdgeInsets.only(
                          top: 20.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: frontend.text(
                        Icon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              labelText: "Username",
                              alignLabelWithHint: false,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 10.0)),
                          onChanged: (String username) {
                            setState(() {
                              _username = username;
                            });
                          },
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: frontend.text(
                        Icon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              labelText: "Full Name",
                              alignLabelWithHint: false,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 10.0)),
                          onChanged: (String fullname) {
                            setState(() {
                              _fullname = fullname;
                            });
                          },
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: frontend.text(
                        Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.white,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              labelText: "Phone NO",
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
                          top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: frontend.text(
                        Icon(
                          FontAwesomeIcons.tint,
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
                          top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: frontend.text(
                        Icon(
                          FontAwesomeIcons.locationArrow,
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
                          top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: frontend.text(
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
                          top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: frontend.text(
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
                    new Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: frontend.text(
                        Icon(
                          FontAwesomeIcons.city,
                          color: Colors.white,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              labelText:
                                  "Enter the First Letter of you Blood Group",
                              alignLabelWithHint: false,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 10.0)),
                          onChanged: (String searchkey) {
                            setState(() {
                              _searchKey = searchkey;
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
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                Map<String, String> data = <String, String>{
                                  "Username": _username,
                                  "Full Name": _fullname,
                                  "Email ID": snapshotss.data.email,
                                  "Blood Group": _bloodgroup,
                                  "Phone No":  _phone,
                                  "Short Address": _shortaddress,
                                  "City": _city,
                                  "State": _state,
                                  "Image": snapshotss.data.photoUrl,
                                  "searchKey": _searchKey,
                                };
                                void _add() {
                                  final DocumentReference documentReference =
                                      Firestore.instance
                                          .collection("Donor Details")
                                          .document(
                                              snapshotss.data.displayName);
                                  documentReference
                                      .setData(data)
                                      .whenComplete(() {
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
                                              context,
                                              Page(route: DonorView())));
                                    },
                                    child: new SizedBox(
                                      child: Row(
                                        children: <Widget>[
                                          new Padding(
                                            padding:
                                                EdgeInsets.only(left: 130.0),
                                          ),
                                          new Text(
                                            "INSERT",
                                            style: new TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                  ],
                ),
              )),
        ));
  }
}
