class GoalAction {
  final String imgUrl;
  final bool isAdvanced;
  final String title;
  final int members;
  final String description;

  GoalAction({
    this.imgUrl,
    this.isAdvanced,
    this.title,
    this.members,
    this.description,
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
    this.imgUrl,
    this.isAdvanced,
    this.title,
    this.members,
    this.description,
    this.time,
  });
}
