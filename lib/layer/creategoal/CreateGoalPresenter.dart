
import 'package:test_webland/layer/creategoal/CreateGoalView.dart';
import 'package:test_webland/model/GoalModel.dart';
import 'package:test_webland/repo/GoalsRepo.dart';
import 'package:test_webland/repo/IGoalsRepo.dart';
import 'package:test_webland/repo/RepoError.dart';
import 'package:test_webland/repo/RepoErrorResponse.dart';
import 'package:test_webland/repo/RepoResultResponse.dart';

class CreateGoalPresenter {
  CreateGoalView _view;
  IGoalsRepo _goalsRepo = GoalsRepo();

  set view(CreateGoalView view) {
    _view = view;
  }

  void saveGoal(String title, int expireTime) async {
    _view.onCreateGoalStarted();
    final response = _goalsRepo.addGoal(title, expireTime);
    _view.onCreateGoalFinished();

    if (response is RepoResultResponse<GoalModel>)
      _view.onCreateGoalSuccess(response.result);
    else if (response is RepoErrorResponse)
      _view.onCreateGoalFailed(response.error);
    else
      _view.onCreateGoalFailed(RepoError.unknown);
  }
}