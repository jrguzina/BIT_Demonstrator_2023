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

  final Set<MapMarker> _thermostatMarkers = {
    MapMarker(
      latitude: 46.2276,
      longitude: 2.2137,
      child: Icon(Icons.location_on, color: Colors.red), // Example marker icon
    ),
  };

  final Set<MapArc> _ressorceArcCamera = {
    // From France to India
    MapArc(
      from: MapLatLng(46.2276, 2.2137), // Latitude and longitude of France
      to: MapLatLng(20.5937, 78.9629), // Latitude and longitude of India
      color: Colors.blue,
      width: 2,
    ),
    // From Hong Kong to India
    MapArc(
      from: MapLatLng(22.3193, 114.1694), // Latitude and longitude of Hong Kong
      to: MapLatLng(20.5937, 78.9629), // Latitude and longitude of India
      color: Colors.blue,
      width: 2,
    ),
    // From Japan to India
    MapArc(
      from: MapLatLng(36.2048, 138.2529), // Latitude and longitude of Japan
      to: MapLatLng(20.5937, 78.9629), // Latitude and longitude of India
      color: Colors.blue,
      width: 2,
    ),
    // From Egypt to India
    MapArc(
      from: MapLatLng(26.8206, 30.8025), // Latitude and longitude of Egypt
      to: MapLatLng(20.5937, 78.9629), // Latitude and longitude of India
      color: Colors.blue,
      width: 2,
    ),
    // From Chile to India
    MapArc(
      from: MapLatLng(-35.6751, -71.5430), // Latitude and longitude of Chile
      to: MapLatLng(20.5937, 78.9629), // Latitude and longitude of India
      color: Colors.blue,
      width: 2,
    ),
  };

  final Set<MapArc> _ressourcesArcThermostat = {
    // From Congo to China
    MapArc(
      from: MapLatLng(-4.0383, 21.7587), // Latitude and longitude of Congo
      to: MapLatLng(35.8617, 104.1954), // Latitude and longitude of China
      color: Colors.blue,
      width: 2,
    ),
    // From Argentina to China
    MapArc(
      from:
          MapLatLng(-38.4161, -63.6167), // Latitude and longitude of Argentina
      to: MapLatLng(35.8617, 104.1954), // Latitude and longitude of China
      color: Colors.blue,
      width: 2,
    ),
    // From USA to China
    MapArc(
      from: MapLatLng(37.0902, -95.7129), // Latitude and longitude of the USA
      to: MapLatLng(35.8617, 104.1954), // Latitude and longitude of China
      color: Colors.blue,
      width: 2,
    ),
    // From South Africa to China
    MapArc(
      from: MapLatLng(
          -30.5595, 22.9375), // Latitude and longitude of South Africa
      to: MapLatLng(35.8617, 104.1954), // Latitude and longitude of China
      color: Colors.blue,
      width: 2,
    ),
    // From Australia to China
    MapArc(
      from:
          MapLatLng(-25.2744, 133.7751), // Latitude and longitude of Australia
      to: MapLatLng(35.8617, 104.1954), // Latitude and longitude of China
      color: Colors.blue,
      width: 2,
    ),
  };

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
                      markerBuilder: (BuildContext context, int index) {
                        return MapMarker(
                          latitude: 46.2276,
                          longitude: 2.2137,
                          child: Tooltip(
                            message: 'Paris',
                            child: Icon(Icons.location_on,
                                size: 20, color: Colors.red),
                          ),
                        );
                      },
                      initialMarkersCount: 1,
                      color: _mapColorToUse,
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
                      shapeTooltipBuilder: (BuildContext context, int index) {
                        return const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text('Custom Tooltip'),
                        );
                      },
                      tooltipSettings:
                          MapTooltipSettings(color: _mapColorToUse),
                      sublayers: [
                        MapArcLayer(
                          arcs: stateA && ressources
                              ? _ressourcesArcThermostat
                              : stateB || stateC && ressources
                                  ? _ressorceArcCamera
                                  : <MapArc>{}, // This is directly using the variable
                        )
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
                        icon: Icon(Icons.reorder),
                        color: Colors.red[200],
                        onPressed: () {
                          setState(() {
                            ressources = true;
                            sales = false;
                            production = false;
                            rd = false;
                            _mapColorToUse = Colors.red[200]!;
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
                        color: Colors.green[200],
                        onPressed: () {
                          setState(() {
                            ressources = false;
                            rd = true;
                            production = false;
                            sales = false;
                            _mapColorToUse = Colors.green[200]!;
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
                        icon: Icon(Icons.factory),
                        color: Colors.brown[200],
                        onPressed: () {
                          setState(() {
                            ressources = false;
                            rd = false;
                            production = true;
                            sales = false;
                            _mapColorToUse = Colors.brown[200]!;
                          });
                        },
                      ),
                      Text("Production")
                    ]),
                SizedBox(width: 20),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.sell),
                        color: Colors.blue[200],
                        onPressed: () {
                          setState(() {
                            ressources = false;
                            rd = false;
                            production = false;
                            sales = true;
                            _mapColorToUse = Colors.blue[200]!;
                          });
                        },
                      ),
                      Text("Sales")
                    ]),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  /* Column(
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
                                stateA = true;
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
                                  stateB = true;
                                  stateA = false;
                                  stateC = false;
                                });
                              },
                            ),
                            ), ]),*/

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/outdoor_camera.png',
                        height: 80,
                        width: 80,
                      ),
                      Container(
                        width: 250,
                        child: SwitchListTile(
                          title: Text('Outdoor Kamera'),
                          value: stateC,
                          onChanged: (bool value) {
                            setState(() {
                              stateC = true;
                              stateA = false;
                              stateB = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
