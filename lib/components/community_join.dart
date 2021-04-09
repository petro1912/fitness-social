import 'package:fitness/components/community_item.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/community.dart';
import 'package:flutter/material.dart';

class JoinCommunity extends StatefulWidget {
  final Function action;
  final Community comm;
  JoinCommunity({Key key, this.comm, this.action}) : super(key: key);
  _JoinCommunityState createState() => _JoinCommunityState();
}

class _JoinCommunityState extends State<JoinCommunity> {
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlackText('JOIN A COMMUNITY', 28, true),
          SizedBox(height: 30),
          CommunityItem(comm: widget.comm, action: null),
          SizedBox(height: 30),
          PrimaryBlockButton(label: 'Join'),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
