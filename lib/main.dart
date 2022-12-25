import 'package:flutter/material.dart';
import 'checkbox_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool value = false;

  final checkboxes = [
    CheckboxModel(title: 'Test 1', value: false),
    CheckboxModel(title: 'Test 2', value: false),
    CheckboxModel(title: 'Toggle Group', value: false),
    CheckboxModel(title: 'Test 3', value: false, shouldToggle: false),
    CheckboxModel(title: 'Test 4', value: false, shouldToggle: false),
    CheckboxModel(title: 'Test 5', value: false, shouldToggle: false),
    CheckboxModel(title: 'Test 6', value: false, shouldToggle: false),
    CheckboxModel(title: 'Test 7', value: false, shouldToggle: false),
    CheckboxModel(title: 'Test 8', value: false, shouldToggle: false),
    CheckboxModel(title: 'Test 9', value: false, shouldToggle: false),
    CheckboxModel(title: 'Test 10', value: false, shouldToggle: false),
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle style =
        const TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
    TextStyle style2 =
        const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
    List<Widget> checkboxModels = buildCheckboxes(checkboxes);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multi Checkbox Demo'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('Multi-Checkbox Demo', style: style)),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    checkboxModels[2],
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text("Group 1", style: style2),
                            ),
                          ),
                          checkboxModels[0],
                          checkboxModels[1],
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text("Group 2", style: style2),
                            ),
                          ),
                          checkboxModels[3],
                          checkboxModels[4],
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text("Group 3", style: style2),
                            ),
                          ),
                          checkboxModels[5],
                          checkboxModels[6],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildCheckboxes(List<CheckboxModel> data) {
    print('data: $data');
    return data.map((e) => buildSingleCheckbox(e)).toList();
  }

  Widget buildSingleCheckbox(CheckboxModel model) {
    TextStyle style = model.shouldToggle
        ? const TextStyle(color: Colors.black)
        : const TextStyle(color: Colors.grey);

    return ListTile(
      title: Text(
        model.title,
        style: style,
      ),
      leading: Checkbox(
        value: model.value,
        onChanged: (_) {
          setState(
            () {
              model.toggle();
              swapEnabledGroup(checkboxes[2].value);
            },
          );
        },
      ),
      onTap: () {
        setState(
          () {
            swapEnabledGroup(checkboxes[2].value);
            model.toggle();
          },
        );
      },
    );
  }

  void swapEnabledGroup(bool enableGroup1) {
    if (enableGroup1) {
      checkboxes[0].enable(false);
      checkboxes[1].enable(false);
      checkboxes[3].enable(true);
      checkboxes[4].enable(true);
      checkboxes[5].enable(true);
      checkboxes[6].enable(true);
      checkboxes[7].enable(true);
      checkboxes[8].enable(true);
      checkboxes[9].enable(true);
      checkboxes[10].enable(true);
    } else {
      checkboxes[0].enable(true);
      checkboxes[1].enable(true);
      checkboxes[3].enable(false);
      checkboxes[4].enable(false);
      checkboxes[5].enable(false);
      checkboxes[6].enable(false);
      checkboxes[7].enable(false);
      checkboxes[8].enable(false);
      checkboxes[9].enable(false);
      checkboxes[10].enable(false);
    }
  }
}
