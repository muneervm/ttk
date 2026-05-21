class AppNotification {
  final String title;
  final String date;

  AppNotification({this.title = '', this.date = ''});

  static AppNotification get dummy => AppNotification(
      title: 'Drawing competition winner announced', date: 'Thu 6 Mar 2022');

  static List<AppNotification> get dummyList =>
      [dummy, dummy, dummy, dummy, dummy];
}
