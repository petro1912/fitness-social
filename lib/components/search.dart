import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  SearchBox({this.searchAction});
  final Function searchAction;

  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  void search(String text) {
    if (widget.searchAction != null) widget.searchAction(text);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        color: textColor.withOpacity(.04),
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 6),
              child: Icon(
                Icons.search,
                size: 18,
                color: textColor.withOpacity(0.4),
              ),
            ),
            Expanded(
              child: TextField(
                // controller: _controller,
                onChanged: (text) => search(text),
                decoration: InputDecoration(
                  hintText: "Search",
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(4),
                ),
                textAlignVertical: TextAlignVertical.top,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
