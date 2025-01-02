class ActiveGroup {
  final String title;
  final String description;
  final int percentComplete;
  final int membersCount;
  final int goalAmount;
  List<String> coins;
  final String rate;

  ActiveGroup({
    required this.title,
    required this.description,
    required this.percentComplete,
    required this.membersCount,
    required this.goalAmount,
    required this.coins,
    required this.rate,
  });
}
