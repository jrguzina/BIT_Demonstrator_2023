import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bit_dem_1/Elements/Tile.dart';
import 'package:countries_world_map/countries_world_map.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class TransportationPage extends StatefulWidget {
  @override
  _TransportationPageState createState() => _TransportationPageState();
}

// Corrected: This should be a State class, not a StatelessWidget.
class _TransportationPageState extends State<TransportationPage> {
  bool ressources = false;
  bool rd = false;
  bool production = false;
  bool sales = false;

  bool stateA = false;
  bool stateB = false;
  bool stateC = false;

  Color _mapColorToUse = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transportation'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
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
                Flexible(
                  flex: 5,
                  child: InteractiveViewer(
                    minScale: 0.8,
                    maxScale: 10,
                    boundaryMargin: const EdgeInsets.all(20),
                    child: SfMaps(
                      layers: [
                        MapShapeLayer(
                          loadingBuilder: (BuildContext context) {
                            return const SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                              ),
                            );
                          },
                          source: const MapShapeSource.asset(
                            "assets/world_map.json", // Your map shape data source
                            shapeDataField: "name",
                          ),
                          strokeColor: Colors.grey,
                          strokeWidth:
                              0.5, // Customization for the map border lines
                          shapeTooltipBuilder:
                              (BuildContext context, int index) {
                            return const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text('Custom Tooltip'),
                            );
                          },
                          tooltipSettings:
                              MapTooltipSettings(color: _mapColorToUse),
                          sublayers: const [
                            MapArcLayer(
                              arcs: <MapArc>{
                                MapArc(
                                  from: MapLatLng(51.1657,
                                      10.4515), // Latitude and longitude of Germany
                                  to: MapLatLng(35.8617,
                                      104.1954), // Latitude and longitude of China
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.lightbulb),
                            color: Colors.red[300],
                            onPressed: () {
                              setState(() {
                                ressources = true;
                                sales = false;
                                _mapColorToUse = Colors.red[300]!;
                              });
                            },
                          ),
                          SizedBox(width: 20),
                          Text("Ressources")
                        ]),
                    SizedBox(width: 20),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.lightbulb),
                            color: Colors.green[300],
                            onPressed: () {
                              setState(() {
                                ressources = true;
                                sales = false;
                                _mapColorToUse = Colors.green[300]!;
                              });
                            },
                          ),
                          Text("R&D")
                        ]),
                    SizedBox(width: 20),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.production_quantity_limits),
                            color: Colors.brown[300],
                            onPressed: () {
                              setState(() {
                                ressources = true;
                                sales = false;
                                _mapColorToUse = Colors.brown[300]!;
                              });
                            },
                          ),
                          Text("Ressources")
                        ]),
                    SizedBox(width: 20),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.money),
                            color: Colors.blue[300],
                            onPressed: () {
                              setState(() {
                                ressources = false;
                                sales = true;
                                _mapColorToUse = Colors.blue[300]!;
                              });
                            },
                          ),
                          Text("Sales")
                        ]),
                  ],
                ),
                SizedBox(height: 20,),
                Flexible(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/thermostat.png',
                            height: 80, width: 80
                          ),
                          Container(width: 250, child:
                          SwitchListTile(
                            title: Text('Thermostat'),
                            value: stateA,
                            onChanged: (bool value) {
                              setState(() {
                                stateA = value;
                                stateB = false;
                                stateC = false;
                              });
                            },
                          ),
                          ),],
                      ),

                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/indoor_camera_s.png',
                              height: 80, width: 80
                            ),Container(width:250, child:
                            SwitchListTile(
                              title: Text('Indoor Kamera'),
                              value: stateB,
                              onChanged: (bool value) {
                                setState(() {
                                  stateB = value;
                                  stateA = false;
                                  stateC = false;
                                });
                              },
                            ),
                            ), ]),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/outdoor_camera.png', height: 80, width: 80,),
                         Container(width:250,child: SwitchListTile(
                            title: Text('Outdoor Kamera'),
                            value: stateC,
                            onChanged: (bool value) {
                              setState(() {
                                stateC = value;
                                stateA = false;
                                stateB = false;
                              });
                            },
                          ),
                         ),],
                      ),

                    ],
                  ),
                ),
                ],),),
            );
  }
}
