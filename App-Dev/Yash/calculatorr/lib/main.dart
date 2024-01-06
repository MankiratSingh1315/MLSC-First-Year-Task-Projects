import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MaterialApp(
  home: Calculator(),
));
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var input="";
    var output="";
    void onButtonClick(value){
      if(value=="C"){
        input="";
        output="";
      }
      else if(value=="x"){
        input=input.substring(0,input.length-1);
      }
      else if(value=="="){
        var result=input;
        Parser p=Parser();
        Expression exp=p.parse(result);
        ContextModel cm= ContextModel();
        var finalValue=exp.evaluate(EvaluationType.REAL, cm);
        output="=" + finalValue.toString();
      }
      else{
        input=input+value;
      }
      setState(() {});
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Calculator',
            style: TextStyle(
              fontSize: 30.0,
              color:Color.fromARGB(255, 249, 249, 249),
              fontWeight:FontWeight.bold,
              letterSpacing: 3.0,
            ),
            ),
        ],
      ),
      centerTitle:true,
      backgroundColor: Color.fromARGB(255, 26, 15, 15),
    ),


    body: Center(
      // ignore: avoid_print
      child:Container(
        height: 800,
        color: Color.fromARGB(255, 0, 0, 0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

           children:[
            Container(
              height: 300,
              color:const Color.fromARGB(255, 0, 0, 0),
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(input,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),
                                ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(output,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white),),
                                ],),
                  ],
                ),
              
             
             ),
             Divider(thickness: 0.25,
             color: Color.fromARGB(255, 112, 109, 104)),
            
            Row(
              children:[
             button("C",Color.fromARGB(255, 184, 111, 1)),
             button("x",Color.fromARGB(255, 184, 111, 1)),
             button("%",Color.fromARGB(255, 184, 111, 1)),
             button("/",Color.fromARGB(255, 184, 111, 1)),
             
             ],
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             
             ),
           
           Row(
            children:[
           button("7",Colors.white),
           button("8",Colors.white),
           button("9",Colors.white),
           button("*",Color.fromARGB(255, 184, 111, 1)),
           ],
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           ), 
           
           Row(
            children:[
              button("4",Colors.white),
            button("5",Colors.white),
            button("6",Colors.white),
            button("-",Color.fromARGB(255, 184, 111, 1)),
            ],

           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           ),
           Row(
            children:[
              button("1",Colors.white),
              button("2",Colors.white),
              button("3",Colors.white),
              button("+",Color.fromARGB(255, 184, 111, 1)),],
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           ),
           Row(
            children:[button("",const Color.fromARGB(255, 250, 250, 250)),
            button("0",const Color.fromARGB(255, 250, 250, 250)),
            button(".",Colors.white),
            ElevatedButton(
        onPressed: (){onButtonClick("=");},
        child:Text("=", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 20 ),),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 237, 127, 3),
          shape:  CircleBorder(),
          padding: EdgeInsets.all(16.0)),
        ),
           ],
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           ),
           ]

      ),),
      ),
    );
  }
  Widget button(String Value,Color color_){
    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: ElevatedButton(
        onPressed: ()=>onButtonClick(Value),
        child:Text(Value, style: TextStyle(color: color_, fontWeight: FontWeight.w800,fontSize: 20 ),),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape:  CircleBorder(),
          padding: EdgeInsets.all(16.0)),
        ),
    );
  }
  
  // void onButtonClick(String value) {
  //   print(value);
  // }
}