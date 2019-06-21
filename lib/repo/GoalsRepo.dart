
import 'package:test_webland/model/GoalModel.dart';
import 'package:test_webland/repo/BaseRepoResponse.dart';
import 'package:test_webland/repo/IGoalsRepo.dart';
import 'package:test_webland/repo/RepoResultResponse.dart';

class GoalsRepo implements IGoalsRepo {
  List<GoalModel> storedGoals = List();

  @override
  BaseRepoResponse addGoal(String title, int expireTime) {
    final goal = GoalModel(title, expireTime);
    storedGoals.add(goal);
    return RepoResultResponse(goal);
  }

  @override
  BaseRepoResponse getAllGoals() {
    final list = storedGoals.toList(growable: false);
    return RepoResultResponse(list);
  }

}