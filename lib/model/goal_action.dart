class GoalAction {
  final String imgUrl;
  final bool isAdvanced;
  final String title;
  final int members;
  final String description;

  GoalAction({
    required this.imgUrl,
    this.isAdvanced = false,
    required this.title,
    required this.members,
    required this.description,
  });
}

class GoalActionDetail {
  final String imgUrl;
  final bool isAdvanced;
  final String title;
  final int members;
  final String description;
  final String time;

  GoalActionDetail({
    required this.imgUrl,
    required this.isAdvanced,
    required this.title,
    this.members = 0,
    required this.description,
    required this.time,
  });
}
