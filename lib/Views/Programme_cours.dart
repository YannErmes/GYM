import 'package:flutter/material.dart';
import 'package:formation_flutter/Controleurs/Programme_ctrl.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Programme_cours extends StatefulWidget {
  const Programme_cours({super.key});

  @override
  State<Programme_cours> createState() => _Programme_coursState();

}

class _Programme_coursState extends State<Programme_cours> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pg_ctrl().mdl.chrono = 0 ;
  }
  Widget build(BuildContext context) {

    final _deviceh = MediaQuery.of(context).size.height;
    final _devicew = MediaQuery.of(context).size.width;
    DateTime dateTime = DateTime.now();
    pg_ctrl ctrl0 = Get.put(pg_ctrl());

    String Evolutio = "";


    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text('Programme en cours'),
      ),
      body: GetBuilder<pg_ctrl>(builder: (ctrl) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Bigctn(
                      120,
                      _devicew / 2.3,
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'tor.jpg',
                            fit: BoxFit.cover,
                          )),
                      0),
                  Bigctn(
                      120,
                      _devicew / 2.3,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TXT('${ctrl.mdl.duree}', Colors.white, 30,
                              FontWeight.bold),
                          TXT('Nombre de jours restant ', Colors.white, 15,
                              FontWeight.normal),
                        ],
                      ),
                      8)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Bigctn(
                      120,
                      _devicew / 2.3,
                      Column(
                        children: [
                           Image.asset('/niv.png', height: 80,),
                         TXT('Niveau 1', Colors.white, 20, FontWeight.bold),
                          
                        ],
                      ),
                      0),
                  Bigctn(
                      120,
                      _devicew / 2.3,
                      CircularPercentIndicator(
                        circularStrokeCap: CircularStrokeCap.round,
                        lineWidth: 15,
                        restartAnimation: true,
                        linearGradient: LinearGradient(colors: [
                          Colors.red,
                          Colors.yellow,
                          Colors.green,
                        ]),
                        curve: Curves.easeInOutCubicEmphasized,
                        radius: 55,
                        percent: ctrl.mdl.chrono/100,
                        animation: true,
                        animateFromLastPercent: true,
                        center:Image.asset('/burn.png',),
                        animationDuration: 6,


                      ),
                      0),

                ],
              ),

              Bigctn(
                  300,
                  _devicew,
                  Form(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TXT('${ctrl.mdl.nom}', Colors.white, 20, FontWeight.bold),

                      // exercie 1
                      CHA(
                          '${ctrl0.mdl.exo1.nom}',
                          ctrl.mdl.exo1.etat
                              ? Colors.green.withOpacity(0.3)
                              : Colors.red.withOpacity(0.3),
                          ctrl.finishexo1),
                      // exercice 2
                      CHA(
                          '${ctrl.mdl.exo2.nom}',
                          ctrl.mdl.exo2.etat
                              ? Colors.green.withOpacity(0.3)
                              : Colors.red.withOpacity(0.3),
                          ctrl.finishexo2),
                      // exercice 3,
                      CHA(
                          '${ctrl.mdl.exo3.nom}',
                          ctrl.mdl.exo3.etat
                              ? Colors.green.withOpacity(0.3)
                              : Colors.red.withOpacity(0.3),
                          ctrl.finishexo3),
                    ],
                  )),
                  10),
              ElevatedButton(
                
                  style: ButtonStyle(
                    shadowColor: WidgetStatePropertyAll(Colors.green),
                      elevation: WidgetStatePropertyAll(9),
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.deepOrange.withOpacity(0.5))),
                  onPressed: ctrl.Validerjour,
                  child: TXT('VALIDER LA JOURNEE', Colors.white, 20, FontWeight.bold))
            ],
          ),
        );
      }),
    );
  }

  Bigctn(double h, double w, Widget child, double pdg) {
    return Container(
      padding: EdgeInsets.all(pdg),
      height: h,
      width: w,
      decoration: BoxDecoration(
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

  CHA(String nom, var clr, void Function() action) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 70,
        decoration: BoxDecoration(
            color: clr,
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  '/exo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SZD(0, 20),
            TXT('$nom', Colors.white, 20, FontWeight.normal)
          ],
        ),
      ),
    );
  }
}
