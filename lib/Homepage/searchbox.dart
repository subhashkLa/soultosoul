import 'package:soultosoul/APi/pages.dart';

class SearchBoxes extends StatefulWidget {
  _SearchBoxes createState() => new _SearchBoxes();
}

class _SearchBoxes extends State<SearchBoxes> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['Blood Group'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text('Search For Donor '),
        ),
        body: new Container(
            color: Color.fromRGBO(58, 66, 86, 1.0),
            child: ListView(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: (val) {
                    initiateSearch(val);
                  },
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back),
                        iconSize: 20.0,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      contentPadding: EdgeInsets.only(left: 25.0),
                      fillColor: Colors.white,
                      labelText: 'Search by Blood Group',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0))),
                ),
              ),
              SizedBox(height: 10.0),
              GridView.count(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  primary: false,
                  shrinkWrap: true,
                  children: tempSearchStore.map((element) {
                    return buildResultCard(context, element);
                  }).toList())
            ])));
  }
}

Widget buildResultCard(BuildContext context, data) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2.0,
      child: Container(
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Center(
              child: Column(
            children: <Widget>[
              GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OtherProfile(
                            bloodGroup: data['Blood Group'],
                            username: data['Username'],
                            email: data['Email ID'],
                            state: data['State'],
                            city: data['City'],
                            fullname: data['Full Name'],
                            phoneno: data['Phone No'],
                            image: data['Image'],
                            shortaddress: data['Short Address'],
                          ))),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: new CircleAvatar(
                            backgroundImage: NetworkImage(data['Image'])),
                      ),
                      Divider(color: Colors.white,),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: new Text(data['Username']),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: new Text(data['Blood Group']),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: new Text(data['Phone No']),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: new Text(data['Short Address']),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: new Text(data['City']),
                      ),
                    ],
                  )),
            ],
          ))));
}
