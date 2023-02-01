import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var weightController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";

  void _incrementCounter() {
    setState(() {
       _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(

        title: Text("BMI Calculator"),
      ),
      body:Container(
        color: Colors.deepOrangeAccent,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI",style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700),),
                SizedBox(
                  height: 31,
                ),
                TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight(in KG)"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your Height(in Feet)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text("Enter your Height(in inch)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(onPressed: (){
                  var wt = weightController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();
                  if(wt!="" && ft!="" && inch!=""){
                    var iWt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iInch = int.parse(inch);
                    var tInch = (12*ift) + iInch;
                    var tcm = 2.54*tInch;
                    var tM = tcm/100;

                    var bmi = iWt/(tM*tM);
                    setState(() {
                      result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                    });
                  }else{
                          setState(() {
                            result = "Please fill all the required field!!";
                          });
                  }
                }, child: Text("Calculate")),
                SizedBox(height: 20,),
                Text("${result}",style: TextStyle(fontSize: 21),)
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
