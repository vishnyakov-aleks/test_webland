
import 'package:test_webland/model/GoalModel.dart';
import 'package:test_webland/repo/RepoError.dart';

class GoalsListView {
  void onGoalsLoadStarted() {}
  void onGoalsLoadFinished() {}
  void onGoalsLoadSuccess(List<GoalModel> goals) {}
  void onGoalsLoadFailed(RepoError error) {}

}