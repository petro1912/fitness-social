import 'package:fitness/constants.dart';
import 'package:flutter/material.dart';

class SearchCommunity extends StatefulWidget {
  final VoidCallback? action;
  SearchCommunity({Key? key, this.action}) : super(key: key);
  _SearchCommunityState createState() => _SearchCommunityState();
}

class _SearchCommunityState extends State<SearchCommunity> {
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlackText('JOIN A COMMUNITY', 28, true),
          SizedBox(height: 30),
          PrimaryBlockButton(label: 'Search', action: widget.action!),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
