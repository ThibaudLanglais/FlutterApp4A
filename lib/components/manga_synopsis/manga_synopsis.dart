import 'package:flutter/material.dart';

class MangaSynopsis extends StatefulWidget {
  const MangaSynopsis({super.key, required this.synopsis});

  final String synopsis;

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<MangaSynopsis> {
  var controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        mytext = controller.text;
      });
    });
    controller.text = widget.synopsis;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String mytext = "";
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    int maxLines = 3;

    return Column(
      children: <Widget>[
        LayoutBuilder(builder: (context, size) {
          // Build the textspan
          var span = TextSpan(
            text: widget.synopsis,
          );

          // Use a textpainter to determine if it will exceed max lines
          var tp = TextPainter(
            maxLines: isExpanded ? 500 : maxLines,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            text: span,
          );

          // trigger it to layout
          tp.layout(maxWidth: size.maxWidth);

          // whether the text overflowed or not
          var exceeded = tp.didExceedMaxLines;

          return Column(children: <Widget>[
            Text.rich(
              span,
              overflow: TextOverflow.ellipsis,
              maxLines: isExpanded ? 500 : maxLines,
            ),
            Container(
                padding: const EdgeInsets.only(top: 10),
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: Icon(
                        isExpanded ? Icons.arrow_upward : Icons.arrow_downward),
                    label: Text(isExpanded ? "Show less" : "Show more")))
          ]);
        }),
      ],
    );
  }
}
