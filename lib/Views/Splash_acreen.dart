import 'package:flutter/material.dart';
import 'package:formation_flutter/Views/Home_page.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceh = MediaQuery.of(context).size.height;
    double devicew = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset('/sp.jpg'),
          Container(
            padding: EdgeInsets.all(15),
            width: devicew,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black54,
                  Colors.black54,
                  Colors.black12
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: deviceh / 2,
                ),
                TXT("Met ton coprs en bonne santé et plus fore encore",
                    Colors.white, 35, FontWeight.bold),
                TXT("Le sport reforce non seulement ta santé phisique mais aussi ta santé mantale te donne une confience en toi de dingue et une energie inépuisable",
                    Colors.white, 15, FontWeight.normal),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage(), ));

                  },
                  child: Container(
                    decoration:  BoxDecoration(
                      color: Colors.deepOrange,
                     border: Border.all(
                     )
                    ),
                    child: TXT("Démarré maintenant", Colors.white, 30,
                        FontWeight.bold),
                  ),
                )

              ],
            ),
          )
        ],
      )),
    );
  }

  // espace pour le fonction repetitive

// les text
  TXT(String text, var clr, double sze, var weight) {
    return Text(
      '$text',
      style: TextStyle(color: clr, fontSize: sze, fontWeight: weight),
    );
  }
}
