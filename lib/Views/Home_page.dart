import 'package:flutter/material.dart';
import 'package:formation_flutter/Views/Programme_cours.dart';
import 'package:formation_flutter/Views/Set_pg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double _deviceh = MediaQuery.of(context).size.height;
    double _devicew = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home_filled),
          backgroundColor: Colors.black54,
            title: Text('Fitness center')),
        body: Container(
          width: _devicew,
          height: _deviceh,
          padding: EdgeInsets.all(15),
          color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // bar de notification
              Bigctn(
                  50,
                  _devicew,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white24,
                      ),
                      TXT('My yann', Colors.white, 20, FontWeight.bold),
                      Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.notifications,
                          size: 20,
                          color: Colors.white70,
                        ),
                      )
                    ],
                  ),
                  10),

              //  box 2 avec image
              Bigctn(
                  270,
                  _devicew,
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        '/home.png',
                        fit: BoxFit.cover,
                      )),
                  0),

              // les option
              Bigctn(
                  90,
                  _devicew,
                  Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Programme_cours(),));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white70),
                            child: Image.asset('/pgc.jpg'),
                          ),
                        ),
                      ),
                      SZD(0, 20),
                      TXT('Programme en cours', Colors.white, 20,
                          FontWeight.bold)
                    ],
                  ),
                  5),
              Bigctn(
                  90,
                  _devicew,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TXT('Nouveau programme', Colors.white, 20,
                          FontWeight.bold),
                      SZD(0, 20),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            Nouveau_pg(),));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white70),
                            child: Image.asset('/pgc.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  5),
            ],
          ),
        ),
      ),
    );
  }

  Bigctn(double h, double w, Widget child, double pdg) {
    return Container(
      padding: EdgeInsets.all(pdg),
      height: h,
      width: w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
          color: Colors.white24, borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }

  TXT(String text, var clr, double sze, var weight) {
    return Text(
      '$text',
      style: TextStyle(color: clr, fontSize: sze, fontWeight: weight),
    );
  }

  SZD(double sh, double sw) {
    return SizedBox(
      height: sh,
      width: sw,
    );
  }
}
