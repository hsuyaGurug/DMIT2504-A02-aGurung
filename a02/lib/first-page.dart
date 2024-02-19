// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import './widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool enabled = false;
  int timesClicked = 0;
  String msg1 = '';
  String msg2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the label and switch here
              //as children of the row.

              Text('Enable buttons'),
              Switch(
                value: enabled,
                onChanged: (bool value) {
                  enabled = !enabled;
                  msg1 = 'Click Me';
                  setState(() {});
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the two buttons here as children of the row.
              // For each button use a "Visibility Widget" and its child
              // will be an "ElevatedButton"
              Visibility(
                  visible: enabled,
                  child: ElevatedButton(
                    onPressed: enabled
                        ? () {
                            setState(() {
                              timesClicked++;
                              msg1 = 'Clicked $timesClicked';
                            });
                          }
                        : null,
                    child: Text(msg1),
                  )),
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: enabled
                      ? () {
                          setState(() {
                            timesClicked = 0;
                            msg1 = 'Click Me';
                          });
                        }
                      : null,
                  child: Text('Reset'),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: Build the text form field here as the first
                  // child of the column.
                  // Include as the second child of the column
                  // a submit button that will show a
                  // snackbar with the "firstName" if validation
                  // is satisfied.
                  TextFormField(
                    controller: textEditingController,
                    onSaved: (name) {
                      msg2 = name!;
                    },
                    validator: (name) {
                      if (name!.isEmpty) {
                        return 'Please enter your name';
                      }
                      if (name!.length > 20) {
                        return 'Name can only be 20 character or less';
                      }
                    },
                    maxLength: 20,
                    decoration: const InputDecoration(
                        helperText: 'min 1, max 20',
                        icon: Icon(Icons.hourglass_top_outlined)),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  textEditingController.clear();

                                  setState(() {});

                                  MySnackBar(
                                          text: 'Hey There, Your Name is $msg2')
                                      .show();
                                }
                              },
                              child: Text('Submit'),
                            ))
                      ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
