import 'package:soultosoul/APi/pages.dart';

class DonorView extends StatefulWidget {
  _DonorView createState() => new _DonorView();
}

class _DonorView extends State<DonorView> {
  FrontEnd frontEnd = new FrontEnd();

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

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
                  "Donor Detail View",
                  style: new TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(context, Page(route: Edits())),
              child: Icon(FontAwesomeIcons.edit),
            )
          ],
        ),
        body: new Container(
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: StreamBuilder(
              stream: FirebaseAuth.instance.onAuthStateChanged,
              builder: (BuildContext context,
                  AsyncSnapshot<FirebaseUser> snapshotss) {
                return StreamBuilder(
                    stream: Firestore.instance
                        .collection('Donor Details')
                        .document(snapshotss.data.displayName)
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData)
                        return const CircularProgressIndicator();
                      return _buildListItem(
                        context,
                        snapshot.data,
                      );
                    });
              }),
        ));
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return new Container(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            new Center(
                child: new Container(
              margin: EdgeInsets.only(left: 100.0),
              child: new UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(58, 66, 86, 1.0),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: new NetworkImage(document['Image']),
                ),
                accountName: new Text(document['Username']),
                accountEmail: new Text(document['Email ID']),
              ),
            )),
            Divider(
              color: Colors.white,
            ),
            Padding(
                padding: EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
                child: Card(
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Icon(FontAwesomeIcons.userAlt,
                              color: Colors.yellow),
                        ),
                        title: Text(
                          document['Username'],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                      )),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                child: Card(
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child:
                              Icon(FontAwesomeIcons.user, color: Colors.yellow),
                        ),
                        title: Text(
                          document['Full Name'],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                      )),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                child: Card(
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Icon(FontAwesomeIcons.envelope,
                              color: Colors.yellow),
                        ),
                        title: Text(
                          document['Email ID'],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                      )),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                child: Card(
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Icon(FontAwesomeIcons.phone,
                              color: Colors.yellow),
                        ),
                        title: Text(
                          document['Phone No'],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                      )),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                child: Card(
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child:
                              Icon(FontAwesomeIcons.tint, color: Colors.yellow),
                        ),
                        title: Text(
                          document['Blood Group'],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                      )),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                child: Card(
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Icon(FontAwesomeIcons.locationArrow,
                              color: Colors.yellow),
                        ),
                        title: Text(
                          document['Short Address'],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                      )),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                child: Card(
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child:
                              Icon(FontAwesomeIcons.city, color: Colors.yellow),
                        ),
                        title: Text(
                          document['City'],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                      )),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: 10.0, right: 10.0, left: 10.0, bottom: 20.0),
                child: Card(
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child:
                              Icon(FontAwesomeIcons.city, color: Colors.yellow),
                        ),
                        title: Text(
                          document['State'],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                      )),
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: 30.0, right: 15.0, left: 15.0, bottom: 30.0),
              child: new ButtonTheme(
                minWidth: 350.0,
                height: 50.0,
                child: new RaisedButton(
                  onPressed: () {
                    Timer(Duration(seconds: 1),
                        () => Navigator.push(context, Page(route: Homepage())));
                  },
                  child: new SizedBox(
                    child: Row(
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.only(left: 100.0),
                        ),
                        new Text(
                          "Everything Ok!",
                          style: new TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w900,
                              foreground: Paint()..shader = linearGradient),
                        )
                      ],
                    ),
                  ),
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            )
          ],
        ));
  }
}
