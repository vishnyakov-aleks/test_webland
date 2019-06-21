import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:test_webland/layer/creategoal/CreateGoalScreen.dart';
import 'package:test_webland/layer/goalslist/GoalsListPresenter.dart';
import 'package:test_webland/layer/goalslist/GoalsListView.dart';
import 'package:test_webland/model/GoalModel.dart';
import 'package:test_webland/repo/RepoError.dart';
import 'package:intl/intl.dart';
import 'package:test_webland/util/DateUtil.dart';

class GoalsListScreen extends StatefulWidget {
  static final route = "/goals";

  @override
  State<StatefulWidget> createState() {
    return GoalsListState();
  }
}

class GoalsListState extends State<GoalsListScreen> implements GoalsListView {
  GoalsListPresenter _presenter = GoalsListPresenter();
  List<GoalModel> goalsList = List();
  bool disposed = false;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _presenter.loadGoals();
      _startTimeWatcher();
    });
    super.initState();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _presenter.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Your goals"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onCreateGoalClicked,
        label: Text("Create new"),
        icon: Icon(Icons.add),
      ),
      body: SafeArea(
        bottom: true,
        child: Stack(
          children: <Widget>[
            ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: goalsList.length,
              itemBuilder: (context, index) {
                final item = goalsList[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(child: Text(item.title)),
                        SizedBox(width: 15),
                        _buildExpireTimeText(item),
                      ],
                    ),
                  ),
                );
              },
            ),
            Visibility(
              child: Center(child: Text("List is empty")),
              visible: goalsList.isEmpty,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onGoalsLoadFailed(RepoError error) {
    //TODO
  }

  @override
  void onGoalsLoadSuccess(List<GoalModel> goals) {
    setState(() {
      goalsList.addAll(goals);
    });
  }

  @override
  void onGoalsLoadFinished() {
    //TODO
  }

  @override
  void onGoalsLoadStarted() {
    //TODO
  }

  Widget _buildExpireTimeText(GoalModel goal) {
    String expireTimeText = goal.dateExpired()
        ? "Date of goal achieved"
        : DateUtil.getRemainingTimer(goal.expireDate);

    return Flexible(
      child: Text(
        expireTimeText,
        style: TextStyle(
          color: goal.dateExpired() ? Colors.green : Colors.grey,
        ),
      ),
    );
  }

  void onCreateGoalClicked() async {
    final goal = await Navigator.of(context).pushNamed(CreateGoalScreen.route);

    if (goal != null && goal is GoalModel)
      setState(() {
        goalsList.insert(0, goal);
      });
  }

  void _startTimeWatcher() async {
    await Future.delayed(Duration(milliseconds: 50));
    if (this.mounted) setState(() {});

    if (!this.disposed) _startTimeWatcher();
  }
}
