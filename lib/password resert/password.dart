import 'package:flutter/material.dart';
import 'package:student_info/password%20resert/send_instructions/send_instructions_view.dart';
class password extends StatelessWidget {
  final MaterialColor primarySwatch = const MaterialColor(0xff7b39ed, <int, Color>{
    50: Color(0xff7b39ed),
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SendInstructionsView(),
    );
  }
}
