import 'package:flutter/widgets.dart';

class ExpandedColumn extends StatefulWidget {
  final String headerText;
  final String descText;
  final Color textColor;

  const ExpandedColumn(
      {Key key, this.headerText, this.descText, this.textColor})
      : super(key: key);

  @override
  _ExpandedColumnState createState() => _ExpandedColumnState();
}

class _ExpandedColumnState extends State<ExpandedColumn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(widget.headerText, style: TextStyle(color: widget.textColor)),
        Text(widget.descText,
            style:
                TextStyle(color: widget.textColor, fontWeight: FontWeight.bold))
      ]),
    );
  }
}
