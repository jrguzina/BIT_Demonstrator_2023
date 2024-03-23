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

class _TransportationPageState extends State<TransportationPage> {
  late MapShapeLayerController _controller;
  bool ressources = false;
  bool rd = false;
  bool production = false;
  bool sales = false;

  bool stateA = false;
  bool stateB = false;
  bool stateC = false;

  Color _mapColorToUse = Colors.grey;

  final Set<MapArc> _ressorceArcCamera = {
    const MapArc(
      from: MapLatLng(46.2276, 2.2137),
      to: MapLatLng(20.5937, 78.9629),
      color: Colors.redAccent,
      width: 2,
    ),
    const MapArc(
      from: MapLatLng(22.3193, 114.1694),
      to: MapLatLng(20.5937, 78.9629),
      color: Colors.redAccent,
      width: 2,
    ),
    const MapArc(
      from: MapLatLng(36.2048, 138.2529),
      to: MapLatLng(20.5937, 78.9629),
      color: Colors.redAccent,
      width: 2,
    ),
    const MapArc(
      from: MapLatLng(26.8206, 30.8025),
      to: MapLatLng(20.5937, 78.9629),
      color: Colors.redAccent,
      width: 2,
    ),
    const MapArc(
      from: MapLatLng(-35.6751, -71.5430),
      to: MapLatLng(20.5937, 78.9629),
      color: Colors.redAccent,
      width: 2,
    ),
  };

  final Set<MapArc> _logsticsArcCamera = {
    const MapArc(
      from: MapLatLng(20.5937, 78.9629), // India
      to: MapLatLng(45.9432, 24.9668),
      color: Colors.greenAccent,
      width: 2,
    ),
  };

  final Set<MapArc> _assemblyArcCamera = {
    const MapArc(
      from:  MapLatLng(45.9432, 24.9668),
      to: MapLatLng(51.1657, 10.4515),
      color: Colors.brown,
      width: 2,
    ),
  };

  final Set<MapArc> _salesArcCamera = {
    const MapArc(
      from: MapLatLng(51.1657, 10.4515), // Germany
      to: MapLatLng(46.8182, 8.2275),    // Switzerland
      color: Colors.blueAccent,
      width: 2,
    ),
    const MapArc(
      from: MapLatLng(51.1657, 10.4515), // Germany
      to: MapLatLng(55.3781, -3.4360),   // Great Britain
      color: Colors.blueAccent,
      width: 2,
    ),
    const MapArc(
      from: MapLatLng(51.1657, 10.4515), // Germany
      to: MapLatLng(40.4637, -3.7492),   // Spain
      color: Colors.blueAccent,
      width: 2,
    ),
    const MapArc(
      from: MapLatLng(51.1657, 10.4515), // Germany
      to: MapLatLng(41.8719, 12.5674),   // Italy
      color: Colors.blueAccent,
      width: 2,
    ),
  };

  late List<MarkerData> _data;

  @override
  void initState() {
    super.initState();
    _controller = MapShapeLayerController();
    updateMarkerData(); // Call the new method here
  }

  void updateMarkerData() {
    if (ressources ) {
      _data = <MarkerData>[
        MarkerData(
            latitude: 22.3193,
            longitude: 114.1694,
            tooltipMessage: 'Hong Kong'),
        MarkerData(
            latitude: 36.2048, longitude: 138.2529, tooltipMessage: 'Japan'),
        MarkerData(
            latitude: 26.8206, longitude: 30.8025, tooltipMessage: 'Egypt'),
        MarkerData(
            latitude: -35.6751, longitude: -71.5430, tooltipMessage: 'Chile'),
        MarkerData(
          latitude: 46.603354, longitude: 1.888334, tooltipMessage: 'France',),
        MarkerData(latitude: 20.5937, longitude: 78.9629, tooltipMessage: 'India',)
      ];
    } else if (sales ) {
      _data = <MarkerData>[
        MarkerData(
            latitude: 46.8182, longitude: 8.2275, tooltipMessage: 'Switzerland'),
        MarkerData(
            latitude: 55.3781, longitude: -3.4360, tooltipMessage: 'Great Britain'),
        MarkerData(
            latitude: 40.4637, longitude: -3.7492, tooltipMessage: 'Spain'),
        MarkerData(
            latitude: 41.8719, longitude: 12.5674, tooltipMessage: 'Italy'),
        MarkerData(
          latitude: 51.1657, longitude: 10.4515, tooltipMessage: 'Germany',
        ),
      ];
    } else if (production ) {
      _data = <MarkerData>[
        MarkerData(
          latitude: 45.9432,
          longitude: 24.9668,
          tooltipMessage: 'Romania',
        ),MarkerData(
          latitude: 51.1657, longitude: 10.4515, tooltipMessage: 'Germany',
        ),
      ];
    } else if (rd ) {
      _data = <MarkerData>[
    MarkerData(
    latitude: 45.9432,
    longitude: 24.9668,
    tooltipMessage: 'Romania',
    ),
        MarkerData(
          latitude: 20.5937,
          longitude: 78.9629,
          tooltipMessage: 'India',
        )
      ];
    } else {
      _data = <MarkerData>[
        MarkerData(
            latitude: 22.3193,
            longitude: 114.1694,
            tooltipMessage: 'Hong Kong'),
        MarkerData(
            latitude: 36.2048, longitude: 138.2529, tooltipMessage: 'Japan'),
        MarkerData(
            latitude: 26.8206, longitude: 30.8025, tooltipMessage: 'Egypt'),
        MarkerData(
            latitude: -35.6751, longitude: -71.5430, tooltipMessage: 'Chile'),
        MarkerData(
          latitude: 46.603354,
          longitude: 1.888334,
          tooltipMessage: 'France',
        ),
        MarkerData(
          latitude: 20.5937,
          longitude: 78.9629,
          tooltipMessage: 'India',
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    print("*****************************************");
    print('Active markers count: ${_data.length}');
    print('Ressources. ${ressources}');
    print('RD. ${rd}');
    print('Production. ${production}');
    print('Sales. ${sales}');

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
            const Text(
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
                      initialMarkersCount: _data.length,
                      color: _mapColorToUse,
                      controller: _controller,
                      markerBuilder: (BuildContext context, int index) {
                        return MapMarker(
                          latitude: _data[index].latitude,
                          longitude: _data[index].longitude,
                          child: Tooltip(
                            message: _data[index].tooltipMessage,
                            child: const Icon(Icons.location_on,
                                size: 20, color: Colors.red),
                          ),
                        );
                      },

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
                          arcs: stateB && ressources ? _ressorceArcCamera :
                          stateB && rd ? _logsticsArcCamera
                                  : stateB&&production?_assemblyArcCamera: stateB && sales? _salesArcCamera:<MapArc>{},
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
                            rd = false;
                            sales = false;
                            production = false;
                            updateMarkerData();
                            _controller.clearMarkers();
                            _controller.insertMarker(0);
                            _controller.insertMarker(1);
                            _controller.insertMarker(2);
                            _controller.insertMarker(3);
                            _controller.insertMarker(4);
                            _controller.insertMarker(5);
                          });
                        },
                      ),
                      SizedBox(width: 20),
                      Text("Ressources-Production")
                    ]),
                SizedBox(width: 20),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.factory),
                        color: Colors.green[200],
                        onPressed: () {
                          setState(() {
                            ressources = false;
                            rd = true;
                            sales = false;
                            production = false;
                            updateMarkerData();
                            _controller.clearMarkers();
                            _controller.insertMarker(0);
                            _controller.insertMarker(1);
                          });
                        },
                      ),
                      Text("Production-Assembly")
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
                            sales = false;
                            production = true;
                            updateMarkerData();
                            _controller.clearMarkers();
                            _controller.insertMarker(0);
                            _controller.insertMarker(1);
                          });
                        },
                      ),
                      Text("Assembly-Logistics")
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
                            sales = true;
                            production = false;
                            updateMarkerData();
                            _controller.clearMarkers();
                            _controller.insertMarker(0);
                            _controller.insertMarker(1);
                            _controller.insertMarker(2);
                            _controller.insertMarker(3);
                            _controller.insertMarker(4);
                          });
                        },
                      ),
                      Text("Logistics-Sales")
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
                  ElevatedButton(
                    onPressed: () {
                      setState(() {

                      });

                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey[200]!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              80.0), // Adjust the value as needed
                        ),
                      ),
                    ),
                    child: Image.asset(
                      'assets/outdoor_camera.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          stateB = !stateB;
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey[200]!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              80.0), // Adjust the value as needed
                        ),
                      ),
                    ),
                    child: Image.asset(
                      'assets/indoor_camera_s.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {

                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey[200]!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              80.0), // Adjust the value as needed
                        ),
                      ),
                    ),
                    child: Image.asset(
                      'assets/thermostat.png',
                      height: 100,
                      width: 100,
                    ),
                  ),

                  /* Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/indoor_camera_s.png',
                        height: 80,
                        width: 80,
                      ),
                      Container(
                        width: 250,
                        child: SwitchListTile(
                          title: Text('Indoor Kamera'),
                          value: stateC,
                          onChanged: (bool value) {
                            setState(() {
                              stateC = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MarkerData {
  final double latitude;
  final double longitude;
  final String tooltipMessage;

  MarkerData(
      {required this.latitude,
      required this.longitude,
      required this.tooltipMessage});
}
