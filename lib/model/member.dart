class Member {
  final String? img;
  final String name;
  final bool isFavorite;
  Member({
    required this.name, 
    this.img, 
    this.isFavorite = false
  });
}

class MemberChat {
  final String? img;
  final String name;
  final bool active;
  final int count;
  MemberChat({
    required this.name, 
    this.img, 
    this.count = 0, 
    this.active = false
  });
}

class ChatMessage {
  final String type;
  final String? name;
  final String? img;
  final String time;
  final List<String>? messages;

  ChatMessage({
    this.type = 'out',
    this.name,
    this.img,
    required this.time,
    this.messages,
  });
}
