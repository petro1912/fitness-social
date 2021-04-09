import 'package:fitness/components/avatar.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/community.dart';
import 'package:flutter/material.dart';

class CommunityItem extends StatelessWidget {
  final Community comm;
  final Function action;
  CommunityItem({this.comm, this.action});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => action == null ? {} : action(context),
      child: Padding(
        padding: mainHrPadding,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
                  child: comm.img != null
                      ? Avatar(
                          image: comm.img,
                          size: 48,
                        )
                      : TextAvatar(name: comm.name, size: 48),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            BlackText(comm.name),
                            SizedBox(width: 6),
                            comm.isFavorite != null && comm.isFavorite
                                ? Image(
                                    image: getIcon('comm_badge'),
                                    width: 15,
                                    height: 15,
                                  )
                                : SizedBox(width: 1)
                          ]),
                          SecondaryText('${comm.members} Members')
                        ],
                      ),
                      SizedBox(height: 6),
                      GreyText(comm.topic, 10),
                    ],
                  ),
                )
              ],
            ),
            Divider(indent: 60)
          ],
        ),
      ),
    );
  }
}
