import 'package:flutter/material.dart';

class CalcBtn extends StatelessWidget {
  String title;
  Function onClick;

  CalcBtn({required this.title, required this.onClick , super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
            onPressed: () {
              onClick(title);
            },
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                  fontSize: 20,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.all(22),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            )),
      ),
    );
  }
}
