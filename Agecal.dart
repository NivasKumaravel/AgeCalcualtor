import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class agecal extends StatefulWidget {
  const agecal({Key? key}) : super(key: key);

  @override
  State<agecal> createState() => _agecalState();
}

class _agecalState extends State<agecal> {
  late int d, m, y;
  late String days1 = "", month1 = "", year1 = "";
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body:
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blueAccent,
                    Colors.cyanAccent
                  ]
              )
          ),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Text("Hi,",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
                    SizedBox(height: 30,),
                    Text("Welcome to Age\n Calculator",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),

                  ],
                ),
              ),
              SizedBox(height: 80,),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Text("Enter your \n name",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700),),
                  SizedBox(width: 10,),
                  Container(
                    height: 50,
                    width: 220,
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                        labelText: "Name",
                        labelStyle:TextStyle(fontSize: 18,fontWeight: FontWeight.w300,color: Colors.black),
                        hintText: "User name",
                      ),
                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Text("Enter your \n Age",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700),),
                  SizedBox(width: 10,),
                  Container(
                    height: 50,
                    width: 220,
                    child:
                    TextFormField(

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: IconButton(onPressed:(){
                          f1();},
                          icon: Icon(Icons.date_range_sharp,color: Colors.black,),),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),

                        labelStyle:TextStyle(fontSize: 18,fontWeight: FontWeight.w300,color: Colors.black87),
                        hintText: (year1+""+month1+""+days1+""),
                        hintStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 200,),
              Column(
                children: [
                  Container(
                    height: 60,
                    width: 200,
                    child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue),),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Submit",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),

                          ],
                        ),
                        onPressed: (){
                          showDialog(context: context,
                            builder: (context)
                            {
                              return Container(

                                child: AlertDialog(
                                  title: Column(
                                    children: [
                                      Text(name.text),
                                      Text(year1+""+month1+""+days1+""),
                                    ],
                                  ),
                                ),

                              );
                            },
                          );
                        }
                    ),
                  ),
                ],
              ),



            ],
          ),
        ) ,
      ),
    );
  }
  Future f1() async{
    DateTime? date1 = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime.now());
    setState(() {
      d= int .parse(DateFormat("dd").format(date1!));
      m= int .parse(DateFormat("MM").format(date1));
      y= int .parse(DateFormat("yy").format(date1));
      int d1=int.parse(DateFormat("dd").format(DateTime.now()));
      int  m1=int.parse(DateFormat("MM").format(DateTime.now()));
      int y1=int.parse(DateFormat("yy").format(DateTime.now()));
      print("cur year : " + y1.toString());
      int day = finddays(m1, y1);
      if(d1-d>=0){
        days1=(d1-d).toString()+"days";
      }
      else{
        days1=(d1+day-d).toString()+"days";
        m1=m1-1;
      }
      if(m1-m>=0){
        month1=(m1-m).toString()+"months";
      }
      else{
        month1=(m1+12-m).toString()+"months";
        y1=y1-1;
      }
      print("Current year value :" + y1.toString());
      if (y1 - y >= 0) {
        year1 = (y1 - y).toString() + "years";
      }
      print("Current year value :" + year1.toString());
    });

  }
}
int finddays(int m2, int y2) {
  int days2;
  if (m2 == 1 ||
      m2 == 3 ||
      m2 == 5 ||
      m2 == 7 ||
      m2 == 8 ||
      m2 == 10 ||
      m2 == 12)
    days2 = 31;
  else if (m2 == 2 || m2 == 4 || m2 == 9 || m2 == 11)
    days2 = 30;
  else {
    if (y2 % 4 == 0) //calcualting leap year
      days2 = 29;
    else
      days2 = 28;
  }
  return days2;
}