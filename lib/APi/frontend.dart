import 'package:soultosoul/APi/pages.dart';

class FrontEnd {
  Widget text(Icon icon, Widget child) {
    return Container(
      width: 350.0,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0))),
            child: icon,
          ),
          Expanded(
            flex: 1,
            child: child
          )
        ],
      ),
    );
  }

  Future navigator(BuildContext context, routes) {
    return Navigator.of(context).pushReplacementNamed(routes);
  }
}

class Page extends PageRouteBuilder {
  final Widget route;

  Page({this.route})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return route;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return new SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 1000),
        );
}
