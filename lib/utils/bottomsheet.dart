import 'package:flutter/material.dart';

import 'media.dart';

class Bottoms extends StatefulWidget {
  const Bottoms({Key? key}) : super(key: key);

  @override
  State<Bottoms> createState() => _BottomsState();
}

class _BottomsState extends State<Bottoms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Wrap(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
              height: height / 1.3,
            ),
          ],
        );
      }),
    );
  }

}
