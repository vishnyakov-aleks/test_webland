
import 'package:test_webland/layer/goalslist/GoalsListView.dart';
import 'package:test_webland/model/GoalModel.dart';
import 'package:test_webland/repo/GoalsRepo.dart';
import 'package:test_webland/repo/IGoalsRepo.dart';
import 'package:test_webland/repo/RepoError.dart';
import 'package:test_webland/repo/RepoErrorResponse.dart';
import 'package:test_webland/repo/RepoResultResponse.dart';

class GoalsListPresenter {
  GoalsListView _view;
  IGoalsRepo repo = GoalsRepo();

  set view(GoalsListView view) {
    _view = view;
  }

  void loadGoals() async {
    _view.onGoalsLoadStarted();
    final response = repo.getAllGoals();
    _view.onGoalsLoadFinished();

    if (response is RepoResultResponse<List<GoalModel>>)
      _view.onGoalsLoadSuccess(response.result);
    else if (response is RepoErrorResponse)
      _view.onGoalsLoadFailed(response.error);
    else
      _view.onGoalsLoadFailed(RepoError.unknown);
  }
}