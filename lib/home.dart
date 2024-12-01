import 'package:calculator/calc_btn.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String resultScreen = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "$resultScreen",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.lightBlue),
              ),
            ),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn(title: "7",
                    onClick: numberClicked,
                  ),
                  CalcBtn(title: "8",
                      onClick: numberClicked),
                  CalcBtn(title: "9",
                      onClick: numberClicked),
                  CalcBtn(title: "-",
                  onClick: operationClicked,),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn(title: "4",
                    onClick: numberClicked,),
                  CalcBtn(title: "5",
                    onClick: numberClicked,),
                  CalcBtn(title: "6",
                    onClick: numberClicked,),
                  CalcBtn(title: "+",
                    onClick:operationClicked,),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn(title: "1",
                    onClick: numberClicked,),
                  CalcBtn(title: "2",
                    onClick: numberClicked,),
                  CalcBtn(title: "3",
                    onClick: numberClicked,),
                  CalcBtn(title: "*",
                  onClick: operationClicked,),
                ]),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalcBtn(title: ".",
                  onClick: numberClicked,),
                  CalcBtn(title: "0",
                    onClick: numberClicked,),
                  CalcBtn(title: "=",
                  onClick: equalOperation,),
                  CalcBtn(title: "/",
                  onClick: operationClicked,),
                ]),
          ),
        ]),
      ),
    );
  }

  String op = "";
  String lhs = "";

  // LHS = 1
  // OP = +
  // screen =
  // RHS = 2

  numberClicked(title) {
    if(op == "="){
      resultScreen = "";
      op = "";
    }
    resultScreen += title;
    setState(() {});
  }

  operationClicked(operator) {
    if (op.isEmpty) {
      lhs = resultScreen;
    } else {
     lhs =  calculate(lhs, op, resultScreen);
    }
    op = operator;
    resultScreen = "";
    print(lhs);
    print(op);
    setState(() {

    });
  }
  equalOperation(operation){
    resultScreen =  calculate(lhs, op, resultScreen);
    op = operation;
    setState(() {

    });
  }

  String calculate(String lhs, String op, String resultScreen) {
    if (op == "+") {
      double LHS = double.parse(lhs);
      double RHS = double.parse(resultScreen);
      double res = LHS + RHS;
      return res.toString();
    }
    else if (op == "-") {
      double LHS = double.parse(lhs);
      double RHS = double.parse(resultScreen);
      double res = LHS - RHS;
      return res.toString();
    } else if (op == "*") {
      double LHS = double.parse(lhs);
      double RHS = double.parse(resultScreen);
      double res = LHS * RHS;
      return res.toString();
    } else if (op == "/") {
      double LHS = double.parse(lhs);
      double RHS = double.parse(resultScreen);
      double res = LHS / RHS;
      return res.toString();
    }
    else{
      return"";
    }
  }
}
