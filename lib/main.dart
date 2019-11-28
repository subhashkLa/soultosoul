import 'package:soultosoul/APi/pages.dart';

void main() {
  FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
    Widget _launchWidget = (user == null) ? new RegisterSplash() : new MainSplash();
    print('launching main');
    runApp(new MaterialApp(
      title: 'My App',
      home: _launchWidget,
    ));
  }).catchError((e) => print('FirebaseAuth error: ' + e.toString()));
} 

// void main(){
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget{
//   _MyApp createState() => new _MyApp();
// }

// class _MyApp extends State<MyApp>{
//   Widget build(BuildContext context){
//     return MaterialApp(
//       // theme: new ThemeData(accentColor: Colors.red),
//       home: new Donor(),
//       routes: <String, WidgetBuilder>{

//       },  
//     );
//   }
// }

