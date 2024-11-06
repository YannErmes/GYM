import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter/Models/programme_model.dart';
import 'package:formation_flutter/Views/Programme_cours.dart';
import 'package:get/get.dart';

import '../Controleurs/Programme_ctrl.dart';

class Nouveau_pg extends StatefulWidget {
  const Nouveau_pg({super.key});

  @override
  State<Nouveau_pg> createState() => _Nouveau_pgState();
}

class _Nouveau_pgState extends State<Nouveau_pg> {
    @override


    DateTimeRange selected = DateTimeRange(start: DateTime.now(), end: DateTime.now());
    final _formkey = GlobalKey<FormState>();
    TextEditingController _nom_ctrl = TextEditingController();
    TextEditingController _exo1_ctrl = TextEditingController();
    TextEditingController _exo2_ctrl = TextEditingController();
    TextEditingController _exo3_ctrl = TextEditingController();
    int jours = 1 ;
    pg_ctrl add_ctrl = Get.put(pg_ctrl());


  Widget build(BuildContext context) {
    final _deviceh = MediaQuery.of(context).size.height;
    final _devicew = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text('Nouveau Programme'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Bigctn(200, _devicew, ClipRRect(
                borderRadius: BorderRadius.circular(15),
          child: Image.asset('/gym.gif', fit: BoxFit.cover,)), 0),
            
            TXT('Plannifié mon programme', Colors.white, 20, FontWeight.bold),

            Bigctn(300 , _devicew,
               Form(
                 key: _formkey,
                  child:
                  ListView(

                    children: [
                      //date
                      Bigctn(60, _devicew,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(onPressed: ()
                              async{

                                final DateTimeRange? dateTimeRange = await showDateRangePicker(context: context,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(3000));

                                if (dateTimeRange != null){
                                  setState(() {

                                    selected = dateTimeRange ;
                                    jours = selected.duration.inDays;
                                    print('${selected.duration.inDays}');

                                  });
                                }



                              },
                                  child: TXT('Durée ', Colors.white, 20, FontWeight.normal)),

                             TXT("$jours jours", Colors.white, 20, FontWeight.normal)
                            ],
                          ),
                          10),
                      //nom du programme
                      CHA('Nommé vote programme' , _nom_ctrl),
                      //date de depart
                      // exercie 1
                      CHA ('Execice N°1', _exo1_ctrl),
                      // exercice 2
                      CHA('Execice N°2', _exo2_ctrl),
                      // exercice 3,
                      CHA('Execice N°3' , _exo3_ctrl),
                      // date



                    ],
                  )


              ),
              10
            ),

           ElevatedButton(
             style: ButtonStyle(
               backgroundColor: WidgetStatePropertyAll(Colors.deepOrange)
             ), 
               onPressed: (){
               add_ctrl.addelement(_nom_ctrl.text, jours, _exo1_ctrl.text, _exo2_ctrl.text, _exo3_ctrl.text);
               Navigator.push(context, MaterialPageRoute(builder: (context) => Programme_cours(),));
             
           }, child: TXT('ENREGISTRE', Colors.white, 20, FontWeight.bold))
          ],
        ),
      )
      ,
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

  CHA (String nom , TextEditingController txtctrl){
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
        controller: txtctrl,
        maxLines: 2,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide.none
          ),
          labelText: nom,
          labelStyle: TextStyle(color: Colors.white),
          alignLabelWithHint:false,

        ),


      ),
    );
  }
  
Future <void>  DATE(var context , String ddp) async{

  }

  
}
