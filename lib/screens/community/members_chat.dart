import 'package:fitness/components/avatar.dart';
import 'package:fitness/components/main_responsive_scaffold.dart';
import 'package:fitness/components/search.dart';
import 'package:fitness/components/triangle.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/model/member.dart';
import 'package:flutter/material.dart';

class CommunityChatScreen extends StatefulWidget {
  _CommunityChatScreenState createState() => _CommunityChatScreenState();
}

class _CommunityChatScreenState extends State<CommunityChatScreen> {
  List<MemberChat> memberList = [];
  List<ChatMessage> messageList = [];
  String message;

  void initState() {
    super.initState();
    setState(() {
      memberList = [
        MemberChat(name: 'Group Chat', img: 'exercise-photo2', count: 24),
        MemberChat(name: 'Ahmed Dosari', img: 'exercise-photo3'),
        MemberChat(name: 'Ali Mohammed', count: 2),
        MemberChat(name: 'Abed el Aziz Barod'),
        MemberChat(name: 'Asad Naser', img: 'exercise-photo1', active: true),
        MemberChat(name: 'Bilal Sami', img: 'exercise-photo1'),
        MemberChat(name: 'Bilal Basil'),
      ];
      messageList = [
        ChatMessage(
            type: 'in',
            name: 'Asad Naser',
            img: 'avatar',
            messages: ['I m coming and where r u now?????'],
            time: '20:10'),
        ChatMessage(
          messages: ['At beach now and gonna take some pics'],
          time: '20:10',
        ),
        ChatMessage(
            type: 'in',
            name: 'Ali Mohammed',
            img: 'avatar',
            messages: ['OK, see u later'],
            time: 'just now'),
        ChatMessage(
          messages: ['Deal!'],
          time: '20:10',
        ),
        ChatMessage(
            type: 'in',
            name: 'Ali Mohammed',
            img: 'avatar',
            messages: ['OK, see u later'],
            time: 'just now'),
      ];
    });
  }

  Widget _buildMemberItem(int index) {
    var member = memberList[index];
    return ChatAvatar(
      image: member.img,
      name: member.name,
      count: member.count,
      active: member.active,
    );
  }

  Widget _buildMessageInput() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: dividerColor),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Center(
              child: Icon(
                Icons.camera_alt,
                size: 30,
                color: greyIconColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: VerticalDivider(color: dividerColor),
          ),
          Expanded(
              child: Row(
            children: [
              SizedBox(width: 10),
              Expanded(
                  child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  isDense: true,
                  // hintStyle: TextStyle(color: white, fontWeight: Bold),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                onChanged: (text) => setState(() {
                  message = text;
                }),
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.left,
              )),
              SizedBox(width: 20),
              Icon(Icons.emoji_emotions, color: greyIconColor),
              SizedBox(width: 10),
            ],
          )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: VerticalDivider(color: dividerColor),
          ),
          SizedBox(
            width: 60,
            child: Center(
              child: Icon(
                Icons.mic,
                size: 30,
                color: greyIconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendMessage(ChatMessage message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    constraints:
                        BoxConstraints(maxWidth: getWindowWidth(context) * .5),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      color: primaryColor,
                    ),
                    child: WhiteText(
                      message.messages[0],
                      14,
                    ),
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    child: CustomPaint(
                      painter: TrianglePainter(color: primaryColor),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(right: 40),
                child: GreyText(message.time, 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReceiveMessage(ChatMessage message) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [SizedBox(width: 54), PrimaryText(message.name, 12)],
        ),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: 15),
            message.img != null
                ? Avatar(image: message.img, size: 36)
                : TextAvatar(name: message.name, size: 36),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  child: CustomPaint(
                    painter: TrianglePainter(
                      color: greyIconColor,
                      isLeft: true,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  constraints:
                      BoxConstraints(maxWidth: getWindowWidth(context) * .5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: greyIconColor,
                  ),
                  child: Text(
                    message.messages[0],
                    maxLines: 100,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(width: 70),
            GreyText(message.time, 12),
          ],
        ),
      ],
    );
  }

  Widget _buildMessageItem(int index) {
    var message = messageList[index];
    return message.type == 'in'
        ? _buildReceiveMessage(message)
        : _buildSendMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    var member = memberList[0];
    return MainResponsiveScaffold(
      title: 'community',
      pageIndex: 2,
      child: Column(
        children: [
          Container(
            height: 90,
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(left: 30),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => SizedBox(width: 10),
              itemCount: memberList.length,
              itemBuilder: (context, index) => _buildMemberItem(index),
            ),
          ),
          Container(
            height: 72,
            // color: Colors.green,
            padding: mainHrPadding,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 20,
                  offset: Offset(0, -3), // changes position of shadow
                ),
              ],
              color: white,
            ),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Image(image: getIcon('arrow-left')),
                SizedBox(width: 20),
                member.img != null
                    ? Avatar(image: member.img, size: 42)
                    : TextAvatar(name: member.name, size: 42),
                SizedBox(width: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlackText('Members', 14),
                    GreyText('36 participants', 12)
                  ],
                ),
                Expanded(child: SizedBox()),
                Image(image: getIcon('more')),
              ],
            ),
          ),
          Container(
            height: getWindowHeight(context) - 380,
            color: white,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              separatorBuilder: (_, __) => SizedBox(height: 10),
              itemCount: messageList.length,
              itemBuilder: (context, index) => _buildMessageItem(index),
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }
}
