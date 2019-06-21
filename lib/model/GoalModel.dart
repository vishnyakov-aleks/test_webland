

import 'package:intl/intl.dart';

class GoalModel {
  final String title;
  final int expireDate;

  GoalModel(this.title, this.expireDate);

  bool dateExpired () => expireDate < DateTime.now().millisecondsSinceEpoch;
}