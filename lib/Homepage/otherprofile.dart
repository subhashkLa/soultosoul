import 'package:soultosoul/APi/pages.dart';

class OtherProfile extends StatelessWidget {
  var image;
  String username;
  String fullname;
  String email;
  String phoneno;
  String bloodGroup;
  String shortaddress;
  String city;
  String state;

  OtherProfile({
    this.image,
    this.email,
    this.fullname,
    this.username,
    this.bloodGroup,
    this.city,
    this.phoneno,
    this.shortaddress,
    this.state,
  });
  FrontEnd frontEnd = new FrontEnd();

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    GoogleSignIn _googlesign = new GoogleSignIn();

    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          title: new Column(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: new Text(
                  "Soul to Soul",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(bottom: 0.0),
                child: new Text(
                  "Blog",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(context, Page(route: SearchBoxes())),
              child: new Icon(FontAwesomeIcons.search),
            )
          ],
        ),
        drawer: Drawer(
          child: new Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(58, 66, 86, 1.0),
            ),
            child: new ListView(
              children: <Widget>[
                StreamBuilder(
                  stream: FirebaseAuth.instance.onAuthStateChanged,
                  builder: (BuildContext context,
                      AsyncSnapshot<FirebaseUser> snapshot) {
                    return Container(
                      child: UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(58, 66, 86, 1.0),
                        ),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data.photoUrl),
                        ),
                        accountEmail: new Text(snapshot.data.email),
                        accountName: new Text(snapshot.data.displayName),
                      ),
                    );
                  },
                ),
                Divider(
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.userAlt,
                      color: Colors.yellow,
                      size: 20.0,
                    ),
                    title: new Text(
                      "Profile",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.home,
                      color: Colors.yellow,
                      size: 20.0,
                    ),
                    title: new Text(
                      "HomePage",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.hospitalAlt,
                      color: Colors.yellow,
                      size: 20.0,
                    ),
                    title: new Text(
                      "Hospital",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.tint,
                      color: Colors.yellow,
                      size: 20.0,
                    ),
                    title: new Text(
                      "Donor",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                  child: ListTile(
                    onTap: () {
                      _googlesign.signOut();
                      Timer(
                          Duration(seconds: 2),
                          () => Navigator.pushReplacement(
                              context, Page(route: SignIn())));
                    },
                    leading: Icon(
                      FontAwesomeIcons.signOutAlt,
                      color: Colors.yellow,
                      size: 20.0,
                    ),
                    title: new Text(
                      "Sign Out",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                  backgroundImage: new NetworkImage(image),
                ),
                accountName: new Text(username),
                accountEmail: new Text(email),
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
                          username,
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
                          child: Icon(FontAwesomeIcons.user,
                              color: Colors.yellow),
                        ),
                        title: Text(
                          fullname,
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
                          email,
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
                          phoneno,
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
                          child: Icon(FontAwesomeIcons.tint,
                              color: Colors.yellow),
                        ),
                        title: Text(
                          bloodGroup,
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
                          shortaddress,
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
                          child: Icon(FontAwesomeIcons.city,
                              color: Colors.yellow),
                        ),
                        title: Text(
                          city,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                      )),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0, bottom: 20.0),
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
                          child: Icon(FontAwesomeIcons.city,
                              color: Colors.yellow),
                        ),
                        title: Text(
                          state,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                      )),
                )),
          ],
        ));
  }
}
