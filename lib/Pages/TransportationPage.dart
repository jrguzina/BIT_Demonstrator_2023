import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bit_dem_1/Elements/Tile.dart';
import 'package:countries_world_map/countries_world_map.dart';

enum Selection { ProduktA, ProduktB, ProduktC }

class TransportationPage extends StatefulWidget {
  @override
  _TransportationPageState createState() => _TransportationPageState();
}

// Corrected: This should be a State class, not a StatelessWidget.
class _TransportationPageState extends State<TransportationPage>  {



  final legendItems = [
    LegendItem(color: Colors.redAccent, text: "R&D"),
    LegendItem(color: Colors.yellowAccent, text: "Ressources"),
    LegendItem(color: Colors.greenAccent, text: "Assembly"),
    LegendItem(color: Colors.blueAccent, text: "Distribution"),
    // Add more items as needed
  ];
  bool stateA = false; // Example condition for state A
  bool stateB = false; // Example condition for state B
  bool stateC = false; // Example condition for state C
  SMapWorldColors buildMapColors() {
    // Initialize color variables with null (or a default color if you prefer)
    Color? colorUS;
    Color? colorDE;
    Color? colorCA;
    Color? colorJP;
    Color? colorCN;
    Color? colorCL;
    Color? colorBR;
    Color? colorZA;
    Color? colorCD;
    Color? colorAO;
    Color? colorAU;
    Color? colorTZ;
    Color? colorET;
    Color? colorAR;
    Color? colorCH;
    Color? colorAT;
    Color? colorES;
    Color? colorFR;

    // Use if statements to conditionally assign colors
    if (stateA) {
      colorUS = Colors.redAccent;
      colorDE = Colors.blueAccent;
      colorBR = Colors.yellowAccent;
      colorZA = Colors.yellowAccent;
      colorCL = Colors.yellowAccent;
      colorES = Colors.greenAccent;
    }
    if (stateB) {
      colorDE = Colors.redAccent;
      colorCH = Colors.blueAccent;
      colorAR = Colors.yellowAccent;
      colorZA = Colors.yellowAccent;
      colorCL = Colors.yellowAccent;
      colorCN = Colors.greenAccent;
    }
    if (stateC) {
      colorJP = Colors.redAccent;
      colorAT = Colors.blueAccent;
      colorAU = Colors.yellowAccent;
      colorZA = Colors.yellowAccent;
      colorCL = Colors.yellowAccent;
      colorFR = Colors.greenAccent;
    }

    return SMapWorldColors(
      uS: colorUS,
      dE: colorDE,
      bR: colorBR,
      zA: colorZA,
      cL: colorCL,
      eS: colorES,
      cH: colorCH,
      aR: colorAR,
      cN: colorCN,
      jP: colorJP,
      aT: colorAT,
      aU: colorAU,
      fR: colorFR,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transportation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Auswirkungen auf Transport und Mobilität',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Tile(
              title: 'Information',
              content:
              'In dieser Grafik können Sie zunächst ein Smart-Home Produkt Ihrer Wahl aussuchen. '
                  'Basierend darauf zeigt die Karte die Herkunft der unterschiedlichen Komponenten, sowie deren Transportwege und Verarbeitungsschritte in der Lieferkette.',
            ),
            SizedBox(height: 20.0),
            Row(children:<Widget>[
              Flexible(
                flex:1,
                child:
              Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('assets/thermostat.png',height: 80,),
                  SwitchListTile(
                    title: Text('Thermostat'),
                    value: stateA,
                    onChanged: (bool value) {
                      setState(() {
                        stateA = value;
                        stateB = false;
                        stateC = false;
                      }
                      );
                    },
                  ),Image.asset('assets/indoor_camera_s.png',height: 80,),
                  SwitchListTile(
                    title: Text('Thermostat'),
                    value: stateB,
                    onChanged: (bool value) {
                      setState(() {
                        stateB = value;
                        stateA = false;
                        stateC = false;
                      }
                      );
                    },
                  ),
                  Image.asset('assets/outdoor_camera.png',height: 80,),
                  SwitchListTile(
                    title: Text('Thermostat'),
                    value: stateC,
                    onChanged: (bool value) {
                      setState(() {
                        stateC = value;
                        stateA = false;
                        stateB = false;
                      }
                      );
                    },
                  ),],
              ),
              ),
              Flexible(
                flex:5,
                child: InteractiveViewer(
                  minScale: 0.8,
                  maxScale: 10,
                 boundaryMargin: const EdgeInsets.all(20),
                  child:
                  SimpleMap(
                    instructions: SMapWorld.instructions,
                    defaultColor: Colors.grey,
                    colors: buildMapColors().toMap(),
                    callback: (id, name, tapdetails) {
                      print(id);
                  },
                ),
              ),),
              Flexible(
                flex: 1,
                child: LegendWidget(
                    items: legendItems),
              )
            ]
            )
          ]
        ),
      ),
    );
  }
  }

class LegendItem {
  final Color color;
  final String text;

  LegendItem({required this.color, required this.text});
}
class LegendWidget extends StatelessWidget {
  final List<LegendItem> items;

  const LegendWidget({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20,
              height: 20,
              color: item.color,
            ),
            SizedBox(width: 16),
            Text(item.text),
          ],
        ),
      )).toList(),
    );
  }
}

