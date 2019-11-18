import 'package:flutter/material.dart';

/// Home page
class PageIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Chartflo")),
        body: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: <Widget>[
                _ExampleTile(
                  title: "Simple",
                  iconData: Icons.select_all,
                  route: "/simple",
                ),
                _ExampleTile(
                  title: "Resample",
                  iconData: Icons.date_range,
                  route: "/resample",
                ),
                _ExampleTile(
                  title: "Sparkline",
                  iconData: Icons.show_chart,
                  route: "/sparkline",
                ),
                _ExampleTile(
                  title: "Radar",
                  iconData: Icons.call_split,
                  route: "/radar",
                ),
                _ExampleTile(
                  title: "Stock",
                  iconData: Icons.business,
                  route: "/stock",
                ),
              ],
            )));
  }
}

class _ExampleTile extends StatelessWidget {
  const _ExampleTile(
      {@required this.iconData, @required this.title, @required this.route});

  final IconData iconData;
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(children: <Widget>[
        Icon(iconData, size: 65.0, color: Colors.grey),
        Padding(padding: const EdgeInsets.all(5.0), child: Text(title)),
      ]),
      onTap: () => Navigator.of(context).pushNamed(route),
    );
  }
}
