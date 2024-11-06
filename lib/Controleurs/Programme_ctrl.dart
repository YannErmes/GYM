import 'package:formation_flutter/Models/exo_model.dart';
import 'package:formation_flutter/Models/programme_model.dart';
import 'package:get/get.dart';

class pg_ctrl extends GetxController {

  final Exo_mld exo1 = Exo_mld(nom: 'Exo 1', etat: false);
  final Exo_mld exo2 = Exo_mld(nom: 'Exo 2', etat: false);
  final Exo_mld exo3 = Exo_mld(nom: 'Exo 3', etat: false);

  final Progamme_mdl mdl = Progamme_mdl(nom: 'nom',
      duree: 0,
      exo1: Exo_mld(nom: 'exo1', etat: false),
      exo2: Exo_mld(nom: 'exo2', etat: false),
      exo3:  Exo_mld(nom: 'exo3', etat: false),
      chrono: 0, jourvalide: 0);


  addelement(String fnom, int fduree, String fexo1, String fexo2,
      String fexo3) {
    mdl.nom = fnom;
    mdl.duree = fduree;
    mdl.exo1.nom = fexo1;
    mdl.exo2.nom = fexo2;
    mdl.exo3.nom = fexo3;

    print(mdl.nom);
    print(mdl.duree);
    print(mdl.exo1.etat);
  }

  finishexo1()async {

    mdl.chrono = 0 ;
    final myPeriode = Stream.periodic(const Duration(milliseconds:  100));
    final tap = myPeriode.listen((event) {
      if(mdl.chrono < 100) {
        mdl.chrono = mdl.chrono + 1;
        update();
      }
      else {
        mdl.exo1.etat = true ;

        update();
      }
    });
     await Future.delayed(Duration(milliseconds: 11000));

    tap.cancel();
  }

  finishexo2()async {

    mdl.chrono = 0 ;
    final myPeriode = Stream.periodic(const Duration(milliseconds:  100));
    final tap = myPeriode.listen((event) {
      if(mdl.chrono < 100) {
        mdl.chrono = mdl.chrono + 1;
        update();
      }
      else {
        mdl.exo2.etat = true ;

        update();
      }
    });
     await Future.delayed(Duration(milliseconds: 11000));

    tap.cancel();
  }

  finishexo3()async {

    mdl.chrono = 0 ;
    final myPeriode = Stream.periodic(const Duration(milliseconds:  100));
    final tap = myPeriode.listen((event) {
      if(mdl.chrono < 100) {
        mdl.chrono = mdl.chrono + 1;
        update();
      }
      else {
        mdl.exo3.etat = true ;

        update();
      }
    });
     await Future.delayed(Duration(milliseconds: 11000));

    tap.cancel();
  }


  Validerjour(){

    if (mdl.exo1.etat == true && mdl.exo2.etat == true && mdl.exo3.etat == true  ) {
      mdl.exo1.etat = false;
      mdl.exo2.etat = false;
      mdl.exo3.etat = false;


      if(mdl.duree >0) {
        print(mdl.jourvalide);
        mdl.duree = mdl.duree - 1;
        update();
      }else {

      }
      update();
    }

  }


}




