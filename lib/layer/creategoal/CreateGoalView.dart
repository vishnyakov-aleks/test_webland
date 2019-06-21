
import 'package:test_webland/model/GoalModel.dart';
import 'package:test_webland/repo/RepoError.dart';

class CreateGoalView {
  void onCreateGoalStarted() {}
  void onCreateGoalFinished() {}
  void onCreateGoalSuccess(GoalModel createdGoal) {}
  void onCreateGoalFailed(RepoError error) {}
}