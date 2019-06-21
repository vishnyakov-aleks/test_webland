import 'package:flutter/material.dart';
import 'package:test_webland/layer/creategoal/CreateGoalPresenter.dart';
import 'package:test_webland/layer/creategoal/CreateGoalView.dart';
import 'package:test_webland/model/GoalModel.dart';
import 'package:test_webland/repo/RepoError.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:test_webland/util/DateUtil.dart';

class CreateGoalScreen extends StatefulWidget {
  static const String route = "/goals/create";

  @override
  State<StatefulWidget> createState() {
    return CreateGoalState();
  }
}

class CreateGoalState extends State<CreateGoalScreen>
    implements CreateGoalView {
  CreateGoalPresenter _presenter = CreateGoalPresenter();
  bool _autoValidate = false;
  String _title;
  DateTime _date;
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _presenter.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new goal"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onSaveBtnPressed,
        label: Text("Save"),
        icon: Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                validator: (value) =>
                    value.isEmpty ? "Title must not be empty" : null,
                decoration: InputDecoration(
                  labelText: "Enter goal's title",
                ),
                onSaved: (value) => _title = value,
              ),
              DateTimePickerFormField(
                inputType: InputType.both,
                format: DateUtil.baseDateFormat,
                editable: false,
                initialDate: DateTime.now(),
                decoration: InputDecoration(
                  labelText: "Select goal's expire date",
                ),
                validator: (val) => _date == null ? "Select date" : null,
                onChanged: (value) => _date = value,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onCreateGoalStarted() {
    //TODO
  }

  @override
  void onCreateGoalFinished() {
    //TODO
  }

  @override
  void onCreateGoalSuccess(GoalModel createdGoal) {
    Navigator.of(context).pop(createdGoal);
  }

  @override
  void onCreateGoalFailed(RepoError error) {
    //TODO
  }

  void onSaveBtnPressed() {
    if (!_formKey.currentState.validate()) {
      _autoValidate = true;
      return;
    }

      _formKey.currentState.save();
      _presenter.saveGoal(_title, _date.millisecondsSinceEpoch);
  }
}
