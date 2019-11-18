import 'dart:io';

import 'package:desktopia/desktopia.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'conf.dart';

class _DesktopPageState extends State<DesktopPage> {
  bool _ready = false;

  @override
  void initState() {
    initConf();
    super.initState();
    onConfReady.then((_) => setState(() => _ready = true));
  }

  @override
  Widget build(BuildContext context) {
    final zStore = Provider.of<AppZoneStore>(context);
    return Scaffold(
        body: _ready
            ? Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                        color: const Color(0xffcecece),
                        child: Column(children: <Widget>[
                          MenuBar(MenuBarData(menuItems: <MenuItem>[
                            MenuItem(
                                context: context,
                                title: "About",
                                action: () => null),
                            MenuItem(
                                context: context,
                                title: "Quit",
                                action: () => exit(0))
                          ])),
                          Container(
                              height: 1.0,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey[400],
                              child: const Text("")),
                          /* Row(
                            children: <Widget>[
                              Expanded(
                                child: zStore.widgetForZone("appBar"),
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 0, 30.0, 0),
                                    child: zStore.widgetForZone("status"),
                                  )
                                ],
                              )
                            ],
                          ),*/
                          Container(
                              height: 1.0,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey[400],
                              child: const Text("")),
                        ])),
                    Expanded(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                                flex: 2,
                                child: SingleChildScrollView(
                                    child: zStore.widgetForZone("sidebar"))),
                            DesktopVerticalDivider(),
                            Expanded(
                              flex: 5,
                              child: SingleChildScrollView(
                                  child: zStore.widgetForZone("main")),
                            ),
                          ]),
                    ),
                  ],
                ))
            : const Center(child: CircularProgressIndicator()));
  }
}

class DesktopPage extends StatefulWidget {
  @override
  _DesktopPageState createState() => _DesktopPageState();
}
