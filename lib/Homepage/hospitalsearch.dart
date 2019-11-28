import 'package:soultosoul/APi/pages.dart';

class HospitalSearch extends StatefulWidget {
  _HospitalSearch createState() => new _HospitalSearch();
}

class _HospitalSearch extends State<HospitalSearch> {
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
      HSearchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['Blood Group1'].startsWith(capitalizedValue)) {
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
          title: Text('Search For Donor'),
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
                // onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => Profile(
                //           bloodGroup: data['Blood Group'],
                //           username: data['Username'],
                //         ))),
                child: Text(
                  data['Name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ))));
}
