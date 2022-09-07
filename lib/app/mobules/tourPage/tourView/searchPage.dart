

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchTour extends StatefulWidget {
  const SearchTour({super.key});

  @override
  State<SearchTour> createState() => _SearchTourState();
}

class _SearchTourState extends State<SearchTour> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  String searchingData = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Search Tour')),
        body: Form(
          key: _formKey,
          child: Container(
            child: TextFormField(
              controller: _controller,
              validator: (text) {
                if (text == 0) {
                  return 'Please Enter 3 or more character';
                } else if (text == 1) {
                  return 'Please Enter 2 or more character';
                } else if (text == 2) {
                  return 'Please Enter 1 or more character';
                } else if (text == 3) {
                  return "Searching";
                }
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
        ));
  }
}

