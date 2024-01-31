import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final DisplayOneController = TextEditingController();
  final DisplayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    DisplayOneController.text = x.toString();
    DisplayTwoController.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // Calculator Display
          CalculatorDisplay(
              hint: "Enter first number", controller: DisplayOneController),
          const SizedBox(
            height: 30,
          ),
          CalculatorDisplay(
              hint: "Enter second number", controller: DisplayTwoController),
          const SizedBox(
            height: 30,
          ),
          Text(
            z.toString(),
            style: const TextStyle(
                fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! +
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! -
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! *
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! /
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
              SizedBox(height: 10),
              FloatingActionButton.extended(
                  onPressed: () {
                    setState(() {
                      x = 0;
                      y = 0;
                      z = 0;
                      DisplayOneController.clear();
                      DisplayTwoController.clear();
                    });
                  },
                  label: Text("clear")),
            ],
          )

          // Expand
          // Buttons
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay(
      {super.key, this.hint = "Enter a number", required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 3.0),
              borderRadius: BorderRadius.circular(10.0)),
          border: OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.black, width: 3.0)
              borderRadius: BorderRadius.circular(10.0)),
          // labelText: "0",
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white)),
      style: const TextStyle(color: Colors.white),
    );
  }
}
