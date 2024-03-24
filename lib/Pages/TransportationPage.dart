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
  late List<MarkerData> _data;
  bool _resourcesFlag = true;
  bool _productionFlag = false;
  bool _assemblyFlag = false;
  bool _logisticsFlag = false;

  bool _thermostatFlag = false;
  bool _indoorcamFlag = true;
  //bool _outdoorCamFlag = false;

  Color _mapColorToUse = Colors.grey;

  final Set<MapArc> _resourceArcCamera = {
     MapArc(
      from: MapLatLng(46.2276, 2.2137), to: MapLatLng(20.5937, 78.9629),
      color: Colors.red[200]!, width: 2,
    ),
     MapArc(
      from: MapLatLng(22.3193, 114.1694), to: MapLatLng(20.5937, 78.9629),
      color: Colors.red[200]!, width: 2,
    ),
     MapArc(
      from: MapLatLng(36.2048, 138.2529), to: MapLatLng(20.5937, 78.9629),
      color: Colors.red[200]!, width: 2,
    ),
     MapArc(
      from: MapLatLng(26.8206, 30.8025), to: MapLatLng(20.5937, 78.9629),
      color: Colors.red[200]!, width: 2,
    ),
     MapArc(
      from: MapLatLng(-35.6751, -71.5430), to: MapLatLng(20.5937, 78.9629),
      color: Colors.red[200]!, width: 2,
    ),
  };

  final Set<MapArc> _resourceArcThermostat = {
    MapArc(
      from: MapLatLng(-4.0383, 21.7587), // Democratic Republic of the Congo
      to: MapLatLng(38.9072, -77.0369), // USA, Washington D.C.
      color: Colors.red[200]!, width: 2,
    ),
    MapArc(
      from: MapLatLng(-30.5595, 22.9375), // South Africa
      to: MapLatLng(38.9072, -77.0369), // USA, Washington D.C.
      color: Colors.red[200]!, width: 2,
    ),
    MapArc(
      from: MapLatLng(-14.2350, -51.9253), // Brazil
      to: MapLatLng(38.9072, -77.0369), // USA, Washington D.C.
      color: Colors.red[200]!, width: 2,
    ),
    MapArc(
      from: MapLatLng(61.5240, 105.3188), // Russia
      to: MapLatLng(38.9072, -77.0369), // USA, Washington D.C.
      color: Colors.red[200]!, width: 2,
    ),
    MapArc(
      from: MapLatLng(38.9637, 35.2433), // Türkiye
      to: MapLatLng(38.9072, -77.0369), // USA, Washington D.C.
      color: Colors.red[200]!, width: 2,
    ),
  };



  final Set<MapArc> _productionArcCamera = {
     MapArc(
       from: MapLatLng(20.5937, 78.9629), // India
  to: MapLatLng(45.9432, 24.9668),
      color: Colors.green[200]!, width: 2,
    ),
  };

  final Set<MapArc> _productionArcThermostat = {
    MapArc(
      from: MapLatLng(38.9072, -77.0369), to: MapLatLng(34.0522, -118.2437),
      color: Colors.green[200]!, width: 2,
    ),
  };

  final Set<MapArc> _assemblyArcCamera = {
     MapArc(
       from: MapLatLng(45.9432, 24.9668), // India
  to: MapLatLng(51.1657, 10.4515),
      color: Colors.brown[200]!, width: 2,
    ),
  };

  final Set<MapArc> _assemblyArcThermostat = {
    MapArc(
      from:  MapLatLng(34.0522, -118.2437), to: MapLatLng(46.8182, 8.2275),
      color: Colors.brown[200]!, width: 2,
    ),
  };
  final Set<MapArc> _logisticsArcCamera = {
     MapArc(
      from: MapLatLng(51.1657, 10.4515), // Germany
      to: MapLatLng(46.8182, 8.2275),    // Switzerland
      color: Colors.blue[200]!,
      width: 2,
    ),
     MapArc(
      from: MapLatLng(51.1657, 10.4515), // Germany
      to: MapLatLng(55.3781, -3.4360),   // Great Britain
      color: Colors.blue[200]!,
      width: 2,
    ),
     MapArc(
      from: MapLatLng(51.1657, 10.4515), // Germany
      to: MapLatLng(40.4637, -3.7492),   // Spain
      color: Colors.blue[200]!,
      width: 2,
    ),
     MapArc(
      from: MapLatLng(51.1657, 10.4515), // Germany
      to: MapLatLng(41.8719, 12.5674),   // Italy
      color: Colors.blue[200]!,
      width: 2,
    ),
  };

  final Set<MapArc> _logisticsArcThermostat = {
     MapArc(
      from: MapLatLng(46.8182, 8.2275), to: MapLatLng(46.8182, 8.2275),
      color: Colors.blue[200]!, width: 2,
    ),
     MapArc(
      from: MapLatLng(46.8182, 8.2275), to: MapLatLng(37.5665, 126.9780),
      color: Colors.blue[200]!, width: 2,
    ),
     MapArc(
      from: MapLatLng(46.8182, 8.2275), to: MapLatLng(35.6895, 139.6917),

       color: Colors.blue[200]!, width: 2,
    ),
     MapArc(
      from: MapLatLng(46.8182, 8.2275), to: MapLatLng(52.5200, 13.4050),

       color: Colors.blue[200]!, width: 2,
    ),
    MapArc(
      from: MapLatLng(46.8182, 8.2275), to: MapLatLng(51.5074, -0.1278),
      color: Colors.blue[200]!, width: 2,
    ),
    MapArc(
      from: MapLatLng(46.8182, 8.2275), to: MapLatLng(-35.2809, 149.1300),
      color: Colors.blue[200]!, width: 2,
    ),MapArc(
      from: MapLatLng(46.8182, 8.2275), to: MapLatLng(41.8719, 12.5674),
      color: Colors.blue[200]!, width: 2,
    ),MapArc(
      from: MapLatLng(46.8182, 8.2275), to: MapLatLng(55.7558, 37.6176),
      color: Colors.blue[200]!, width: 2,
    ),
  };


  @override
  void initState() {
    super.initState();
    _controller = MapShapeLayerController();
    updateMarkerData(); // Call the new method here
  }

  void updateMarkerData() {
    if (_resourcesFlag&&_indoorcamFlag) {
      _data = <MarkerData>[
        MarkerData(
            latitude: 22.3193, longitude: 114.1694, country: 'Hong Kong', function: 'Resources', description: 'Cobalt, Alloy, Silicon', colour: Colors.red),
        MarkerData(
            latitude: 36.2048, longitude: 138.2529, country: 'Japan', function: 'Resources', description: 'Copper', colour: Colors.red),
        MarkerData(
            latitude: 26.8206, longitude: 30.8025, country: 'Egypt', function: 'Resources', description: 'Aluminium, Gold', colour: Colors.red),
        MarkerData(
            latitude: -35.6751, longitude: -71.5430, country: 'Chile', function: 'Resources', description: 'Copper, Silver', colour: Colors.red),
        MarkerData(
          latitude: 46.603354, longitude: 1.888334, country: 'France', function: 'Resources', description: 'Gold', colour: Colors.red),
        MarkerData(latitude: 20.5937, longitude: 78.9629, country: 'India',function: 'Prdoduction', colour: Colors.red)
      ];
    } else if (_logisticsFlag&&_indoorcamFlag) {
      _data = <MarkerData>[
        MarkerData(
            latitude: 46.8182, longitude: 8.2275, country: 'Switzerland', function: 'Sales', colour: Colors.blue),
        MarkerData(
            latitude: 55.3781, longitude: -3.4360, country: 'Great Britain', function: 'Sales', colour: Colors.blue),
        MarkerData(
            latitude: 40.4637, longitude: -3.7492, country: 'Spain', function: 'Sales', colour: Colors.blue),
        MarkerData(
            latitude: 41.8719, longitude: 12.5674, country: 'Italy', function: 'Sales', colour: Colors.blue),
        MarkerData(
          latitude: 51.1657, longitude: 10.4515, country: 'Germany', function: 'Logistics', colour: Colors.blue
        ),
      ];
    } else if (_assemblyFlag&&_indoorcamFlag) {
      _data = <MarkerData>[
        MarkerData(latitude: 45.9432, longitude: 24.9668,
          country: 'Romania', function: 'Assembly', colour: Colors.brown),
        MarkerData(
          latitude: 51.1657, longitude: 10.4515, country: 'Germany', function: 'Logistics', colour: Colors.brown
        ),
      ];
    } else if (_productionFlag&&_indoorcamFlag) {
      _data = <MarkerData>[
    MarkerData(latitude: 45.9432, longitude: 24.9668, country: 'Romania', function: 'Assembly', colour: Colors.green
    ),
        MarkerData(latitude: 20.5937, longitude: 78.9629,
          country: 'India', function: 'Production', colour: Colors.green
        )
      ];
    } else if (_resourcesFlag&&_thermostatFlag) {
      _data = <MarkerData>[MarkerData(
        latitude: 38.9072, longitude: -77.0369, // USA
        country: 'USA', function: 'Production',
      // Adjust as needed
        colour: Colors.red,
      ),

        MarkerData(
          latitude: -4.0383, longitude: 21.7587, // Democratic Republic of the Congo
          country: 'Congo', function: 'Resources',
          description: 'Cobalt, Copper, Diamonds',
          colour: Colors.red,
        ),

        MarkerData(
          latitude: -30.5595, longitude: 22.9375, // South Africa
          country: 'South Africa', function: 'Resources',
          description: 'Gold, Diamonds, Platinum',
          colour: Colors.red,
        ),

        MarkerData(
          latitude: 61.5240, longitude: 105.3188, // Russia
          country: 'Russia', function: 'Resources',
          description: 'Natural Gas, Oil, Coal',
          colour: Colors.red,
        ),

        MarkerData(
          latitude: 38.9637, longitude: 35.2433, // Türkiye
          country: 'Türkiye', function: 'Resources',
          description: 'Boron, Marble, Chromium',
          colour: Colors.red,
        ),

        MarkerData(
          latitude: -14.2350, longitude: -51.9253, // Brazil
          country: 'Brazil', function: 'Resources',
          description: 'Iron Ore, Gold, Oil',
          colour: Colors.red,
        ),];

    }
    else if (_productionFlag&&_thermostatFlag) {
      _data = <MarkerData>[MarkerData(
        latitude: 38.9072, longitude: -77.0369, // Washington, D.C.
        country: 'USA - Washington, D.C.', function: 'Production',

        colour: Colors.green,
      ),

        MarkerData(
          latitude: 34.0522, longitude: -118.2437, // Los Angeles
          country: 'USA - Los Angeles', function: 'Assembly',

          colour: Colors.green,
        ),];

    }
    else if (_assemblyFlag&&_thermostatFlag) {
      _data = <MarkerData>[MarkerData(
        latitude: 34.0522, longitude: -118.2437, // Los Angeles
        country: 'USA - Los Angeles', function: 'Assembly',

        colour: Colors.brown,
      ),

        MarkerData(
          latitude: 46.8182, longitude: 8.2275, // Switzerland
          country: 'Switzerland', function: 'Logistics',

          colour: Colors.brown,
        ),];

    }
    else if (_logisticsFlag&&_thermostatFlag) {
      _data = <MarkerData>[MarkerData(
        latitude: 46.8182, longitude: 8.2275, // Switzerland
        country: 'Switzerland', function: 'Logistics',

        colour: Colors.blue,
      ),

        MarkerData(
          latitude: 37.5665, longitude: 126.9780, // South Korea
          country: 'South Korea', function: 'Sales',
          colour: Colors.blue,
        ),

        MarkerData(
          latitude: 52.5200, longitude: 13.4050, // Germany
          country: 'Germany', function: 'Sales',
          colour: Colors.blue,
        ),

        MarkerData(
          latitude: 41.9028, longitude: 12.4964, // Italy
          country: 'Italy', function: 'Sales',
          colour: Colors.blue,
        ),

        MarkerData(
          latitude: -35.2809, longitude: 149.1300, // Australia, Canberra
          country: 'Australia', function: 'Sales',
          colour: Colors.blue,
        ),

        MarkerData(
          latitude: 55.7558, longitude: 37.6176, // Moscow, Russia
          country: 'Russia', function: 'Sales',
          colour: Colors.blue
        ),

        MarkerData(
          latitude: 51.5074, longitude: -0.1278, // London, UK
          country: 'UK', function: 'Sales',

          colour: Colors.blue,
        ),
        MarkerData(
          latitude: 35.6895, longitude: 139.6917, // Tokyo, Japan
          country: 'Japan', function: 'Sales',

          colour: Colors.blue,
        ),
      ];

    }
    else {
      _data = <MarkerData>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    print("*****************************************");
    print('Active markers count: ${_data.length}');
    print('Ressources. ${_resourcesFlag}');
    print('RD. ${_productionFlag}');
    print('Production. ${_assemblyFlag}');
    print('Sales. ${_logisticsFlag}');

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
                        String tooltipMessage = '${_data[index].country}\n${_data[index].function}';
                        if (_data[index].description.isNotEmpty) {
                          tooltipMessage += '\n${_data[index].description}';
                        }
                        return MapMarker(
                          latitude: _data[index].latitude,
                          longitude: _data[index].longitude,
                          child: Tooltip(
                            message: tooltipMessage,
                            textAlign: TextAlign.center,


                            child:  Icon(Icons.location_on,
                                size: 20, color: _data[index].colour),
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
                          arcs: _indoorcamFlag && _resourcesFlag ? _resourceArcCamera :
                          _indoorcamFlag && _productionFlag ? _productionArcCamera :
                          _indoorcamFlag && _assemblyFlag ?_assemblyArcCamera:
                          _indoorcamFlag && _logisticsFlag ? _logisticsArcCamera:
                              _thermostatFlag && _resourcesFlag ? _resourceArcThermostat:
                              _thermostatFlag && _productionFlag ? _productionArcThermostat:
                              _thermostatFlag && _assemblyFlag ? _assemblyArcThermostat:
                              _thermostatFlag && _logisticsFlag ? _logisticsArcThermostat:
                          <MapArc>{},
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
                            _resourcesFlag = true;
                            _productionFlag = false;
                            _logisticsFlag = false;
                            _assemblyFlag = false;
                            _controller.clearMarkers();
                            updateMarkerData();
                            for (int i = 0; i < _data.length; i++) {
                              _controller.insertMarker(i);
                            }
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
                        icon: Icon(Icons.precision_manufacturing),
                        color: Colors.green[200],
                        onPressed: () {
                          setState(() {
                            _resourcesFlag = false;
                            _productionFlag = true;
                            _logisticsFlag = false;
                            _assemblyFlag = false;
                            updateMarkerData();
                            _controller.clearMarkers();
                            for (int i = 0; i < _data.length; i++) {
                              _controller.insertMarker(i);
                            }
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
                            _resourcesFlag = false;
                            _productionFlag = false;
                            _logisticsFlag = false;
                            _assemblyFlag = true;
                            updateMarkerData();
                            _controller.clearMarkers();
                            for (int i = 0; i < _data.length; i++) {
                              _controller.insertMarker(i);
                            }
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
                            _resourcesFlag = false;
                            _productionFlag = false;
                            _logisticsFlag = true;
                            _assemblyFlag = false;
                            updateMarkerData();
                            _controller.clearMarkers();
                            for (int i = 0; i < _data.length; i++) {
                              _controller.insertMarker(i);
                            }
                          });
                        },
                      ),
                      Text("Logistics-Sales")
                    ]
                ),
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
                /*  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _outdoorCamFlag = true;
                        _indoorCamFlag = false;
                        _thermostatFlag = false;
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
                      height: 150,
                      width: 150,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),*/
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _indoorcamFlag = true;
                          //_outdoorCamFlag = false;
                          _thermostatFlag = false;

                          updateMarkerData();
                          _controller.clearMarkers();
                          for (int i = 0; i < _data.length; i++) {
                            _controller.insertMarker(i);
                          }
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey[200]!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              120.0),
                        ),
                      ),
                    ),
                    child: Image.asset(
                      'assets/indoor_camera_s.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                     SizedBox(
                    width: 20,
                  ),
           ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _thermostatFlag = true;
                        _indoorcamFlag = false;
                        //_outdoorCamFlag = false;

                        updateMarkerData();
                        _controller.clearMarkers();
                        for (int i = 0; i < _data.length; i++) {
                          _controller.insertMarker(i);
                        }
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey[200]!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              120.0),
                        ),
                      ),
                    ),
                    child: Image.asset(
                      'assets/thermostat.png',
                      height: 150,
                      width: 150,
                    ),
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

class MarkerData {
  final double latitude;
  final double longitude;
  final String country;
  final String function;
  final Color colour;
   String description;


  MarkerData(

      { required this.latitude,
        required this.longitude,
        required this.country,
        required this.function,
        required this.colour,
        this.description =''
      });
}
