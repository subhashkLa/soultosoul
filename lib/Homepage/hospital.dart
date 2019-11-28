import 'package:soultosoul/APi/pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Hospital extends StatefulWidget {
  _Hospital createState() => new _Hospital();
}

class _Hospital extends State<Hospital> {
  @override
  Widget build(BuildContext context) {
    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(context, Page(route: Homepage()));
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.hospital, color: Colors.white),
              onPressed: () {
                Navigator.push(context, Page(route: Hospital()));
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.tint, color: Colors.white),
              onPressed: () {
                Navigator.push(context, Page(route: Donors()));
              },
            ),
          ],
        ),
      ),
    );
    GoogleSignIn _googlesign = new GoogleSignIn();
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: new Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            new Text(
              "Soul to Soul",
              style: new TextStyle(fontSize: 20.0),
            ),
            new Text(
              "Hospital",
              style: new TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        centerTitle: true,
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
      bottomNavigationBar: makeBottom,
      body: new Container(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: StreamBuilder(
          stream: Firestore.instance.collection('Hospital').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return const Text("No Data........");
            return ListView.builder(
              itemExtent: 150.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildItem(context, snapshot.data.documents[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, DocumentSnapshot documents) {
    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(new ClipboardData(text: "documents['Phone No']"));
        Fluttertoast.showToast(
            msg: "This is Center Short Toast",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        child: Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
              child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 1.0, color: Colors.white24))),
                    child: new CircleAvatar(
                      backgroundImage: NetworkImage(documents['Image']),
                    ),
                  ),
                  title: Text(
                    "Donor Details",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.user,
                            color: Colors.yellowAccent,
                            size: 10.0,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(documents['Name'],
                                  style: TextStyle(color: Colors.white)))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.tint,
                            color: Colors.yellowAccent,
                            size: 10.0,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("documents['Blood Group']",
                                  style: TextStyle(color: Colors.white)))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.phone,
                            color: Colors.yellowAccent,
                            size: 10.0,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("documents['Phone No']",
                                  style: TextStyle(color: Colors.white)))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            color: Colors.yellowAccent,
                            size: 10.0,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("documents['Short Address']",
                                  style: TextStyle(color: Colors.white)))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            color: Colors.yellowAccent,
                            size: 10.0,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text("documents['City']",
                                  style: TextStyle(color: Colors.white)))
                        ],
                      )
                    ],
                  ),
                  trailing: new GestureDetector(
                      onTap: () => Navigator.push(context, Page()),
                      child: Icon(Icons.keyboard_arrow_right,
                          color: Colors.white, size: 30.0)))),
        ),
      ),
    );
  }
}
