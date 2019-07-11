import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _ageController =new TextEditingController();
  TextEditingController _heightController =new TextEditingController();
  TextEditingController _weightController =new TextEditingController();
double inches = 0.0;
double result =0.0;
String _resultReading ="";
String _finalResult = "";

  void calculateBMI(){





    setState(() {
      int age = int.tryParse(_ageController.text);
      double height =double.parse(_heightController.text);
      inches = height*12;
      double weight = double.tryParse(_weightController.text);

if((_ageController.text.isNotEmpty || age >0)
 &&  (_weightController.text.isNotEmpty || weight > 0 )
&& (_heightController.text.isNotEmpty) || inches>0
)

{


  result = weight/(inches*inches) *783;



  if(double.parse(result.toStringAsFixed(1))<18.5){

_resultReading = "Underweight";
print(result);


  }
  else if(double.parse(result.toStringAsFixed(1)) >=18.5){
    _resultReading = "Great Shape";
    print(_resultReading);

  }

  else if(double.parse(result.toStringAsFixed(1))>=25.0){
    _resultReading = "Over Weight";
    print(_resultReading);
  }

  else if(double.parse(result.toStringAsFixed(1))>=30.0){
    _resultReading="Obese";
  }


}
else {
  result = 0.0;
}

    });

    _finalResult = "your BMI: ${result.toStringAsFixed(1)}";



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: new AppBar(


        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.shade200,
      ),


      body: new Container(

        alignment: Alignment.topCenter,

        child: ListView(
          padding: const EdgeInsets.all(3.0),

          children: <Widget>[
            Image.asset("images/1.1 bmilogo.png.png",

            height: 133.0,
                width: 200.0,

            ),


            new Container(
              padding: const EdgeInsets.all(5.0),

              height: 325.0,
              width: 295.0,

              color: Colors.grey.shade300,

              child: Column(

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new TextField(

                    controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: "34",
                        icon: new Icon(Icons.person_outline)


                      ),


                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new TextField(

                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Height in feet",
                          hintText: "6.5",
                          icon: new Icon(Icons.insert_chart)


                      ),


                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new TextField(

                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "weight in lbs",
                          hintText: "180",
                          icon: new Icon(Icons.line_weight)


                      ),


                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),


                   child: new Container(
                   alignment: Alignment.center,
                     child: new RaisedButton(
                       onPressed: calculateBMI,
                       color: Colors.pink,



                       child: new Text("Calculate"),
                       textColor: Colors.white,
                     ),



                    ),




                  ),




                ],

              ),


            ),
            new Column(


              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                new Padding(padding: const EdgeInsets.all(15.0)),
                new Text(
                  "BMI: $_finalResult ",
                  style: new TextStyle(
                      fontSize: 19.9,
                      fontWeight: FontWeight.w500,
                      color:Colors.blueAccent,
                      fontStyle: FontStyle.italic
                  ),


                ),


                new Padding(padding: const EdgeInsets.all(5.0)),



                new Text(
                  "$_resultReading",
                  style: new TextStyle(
                      fontSize: 19.9,
                      fontWeight: FontWeight.w500,
                      color:Colors.pinkAccent,
                      fontStyle: FontStyle.italic
                  ),


                )



              ],
            )




          ],


        ),


      ),
    );
  }
}
