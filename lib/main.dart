import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(Object context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  var bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('BMI Calculator'),
      ),

      body: Container(
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'BMI',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: wtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight in kg',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: ftController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Height in feet',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: inController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Height in inches',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if (wt != "" && ft != "" && inch != "") {
                    // BMI calculate
                    var weight = double.parse(wt);
                    var heightInFeet = double.parse(ft);
                    var heightInInches = double.parse(inch);
                    var totalHeightInInches =
                        (heightInFeet * 12) + heightInInches;
                    var tcm = totalHeightInInches * 2.54;
                    var bmi = weight / ((tcm * tcm) / 10000);
                    String msg = "";
                    if (bmi > 25) {
                      msg = "You are overweight";
                      bgColor = Colors.redAccent;
                    } else if (bmi < 18.5) {
                      msg = "You are underweight";
                      bgColor = Colors.blueAccent;
                    } else {
                      msg = "You have a normal weight";
                      bgColor = Colors.greenAccent; // Fixed color assignment
                    }
                    // Display result
                    setState(() {
                      result = "$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                    });
                  } else {
                    setState(() {
                      result = "Please enter all fields";
                    });
                  }
                },
                child: Text('Calculate BMI'),
              ),
              SizedBox(height: 20),
              Text(result, style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
