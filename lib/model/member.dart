class Member {
  final String img;
  final String name;
  final bool isFavorite;
  Member({this.name, this.img, this.isFavorite});
}

class MemberChat {
  final String img;
  final String name;
  final bool active;
  final int count;
  MemberChat({this.name, this.img, this.count, this.active});
}

class ChatMessage {
  final String type;
  final String name;
  final String img;
  final String time;
  final List<String> messages;

  ChatMessage({
    this.type,
    this.name,
    this.img,
    this.time,
    this.messages,
  });
}
