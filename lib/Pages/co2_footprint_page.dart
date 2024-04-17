import 'dart:math';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CO2FootprintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CO2 Footprint'),
        ),
        body: MySwitch());
  }
}

class MySwitch extends StatefulWidget {
  @override
  MySwitchState createState() => MySwitchState();
}

class MySwitchState extends State<MySwitch> {
  bool _thermostatValue = false;
  bool _inneKameraValue = false;
  bool _aussenKameraValue = false;
  bool _fensterkontaktValue = false;
  bool _lichtsteuerungValue = false;
  bool _schlossValue = false;

  bool getThermostatStatus() => _thermostatValue;
  bool getInnekameraStatus() => _inneKameraValue;
  bool getAussenkameraStatus() => _aussenKameraValue;
  bool getFensterkontaktStatus() => _fensterkontaktValue;
  bool getLichtsteuerungStatus() => _lichtsteuerungValue;
  bool getSchlossStatus() => _schlossValue;

  List<bool> getAllGadgetsStatus() {
    return [
      getThermostatStatus(),
      getInnekameraStatus(),
      getAussenkameraStatus(),
      getFensterkontaktStatus(),
      getLichtsteuerungStatus(),
      getSchlossStatus(),
    ];
  }

  List<SmartHomeGadget> gadgets = [
    _thermostat,
    _inneKamera,
    _aussenKamera,
    _lichtsteuerung,
    _fensterkontakt,
    _schloss
  ];

  double getResource(resource) {
    double result = 0;
    List<bool> status = getAllGadgetsStatus();
    for (var i = 0; i < gadgets.length; i++) {
      if (status[i] == true) {
        if (resource == "co2EmittedUse") {
          result += _currentSliderValue*gadgets[i].co2EmittedUse;
        }
        if (resource == "co2SavedUse") {
          result += _currentSliderValue*gadgets[i].co2SavedUse;
        }

        if (resource == "co2EmittedRecycling") {
          result += gadgets[i].co2EmittedRecycling;
        }
        if (resource == "co2EmittedProduction") {
          result += gadgets[i].co2EmittedProduction;
        }
      }
    }
    return result;
  }

  double getFullResource(resource) {
    double result = 0;
    for (var i = 0; i < gadgets.length; i++) {
      if (resource == "co2EmittedUse") {
        result += _currentSliderValue*gadgets[i].co2EmittedUse;
      }
      if (resource == "co2SavedUse") {
        result += _currentSliderValue*gadgets[i].co2SavedUse;
      }

      if (resource == "co2EmittedRecycling") {
        result += gadgets[i].co2EmittedRecycling;
      }
      if (resource == "co2EmittedProduction") {
        result += gadgets[i].co2EmittedProduction;
      }
    }
    return result;
  }
  int netEmissions=0;
  double _currentSliderValue = 1;



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Maximum width and height available for the image
          double maxWidth = constraints.maxWidth;
          double maxHeight = constraints.maxHeight;
          // Calculate the scale factor
          double widthScale = maxWidth / 1024;
          double heightScale = maxHeight / 1024;
          double scale = min(widthScale, heightScale);
          // Scale is min of widthScale and heightScale, but not more than 1 (for scaleDown)
          scale = scale > 1.0 ? 1.0 : scale;

          return Row(children: [
            Container(
              width: 290,
              height: 1085,
              margin: EdgeInsets.all(25.0),
              child: Stack(alignment: Alignment.center, children: [
                Image.asset('assets/phone_mockup.png', fit: BoxFit.contain),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SwitchListTile(
                      title: Text('Thermostat'),
                      secondary: Icon(Icons.thermostat),
                      value: _thermostatValue,
                      onChanged: (bool value) {
                        setState(() {
                          _thermostatValue = value;
                          netEmissions = getResource("co2EmittedProduction").round() + ( getResource("co2EmittedUse").round()).toInt()  - (getResource("co2SavedUse").round()).toInt() + getResource("co2EmittedRecycling").round();
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Innekamera'),
                      secondary: Icon(Icons.camera_indoor),
                      value: _inneKameraValue,
                      onChanged: (bool value) {
                        setState(() {
                          _inneKameraValue = value;
                          netEmissions = getResource("co2EmittedProduction").round() + ( getResource("co2EmittedUse").round()).toInt()  - (getResource("co2SavedUse").round()).toInt() + getResource("co2EmittedRecycling").round();
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Außenkamera'),
                      secondary: Icon(Icons.camera_outdoor),
                      value: _aussenKameraValue,
                      onChanged: (bool value) {
                        setState(() {
                          _aussenKameraValue = value;
                          netEmissions = getResource("co2EmittedProduction").round() + ( getResource("co2EmittedUse").round()).toInt()  - (getResource("co2SavedUse").round()).toInt() + getResource("co2EmittedRecycling").round();
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Fensterkontakt'),
                      secondary: Icon(Icons.window),
                      value: _fensterkontaktValue,
                      onChanged: (bool value) {
                        setState(() {
                          _fensterkontaktValue = value;
                          netEmissions = getResource("co2EmittedProduction").round() + ( getResource("co2EmittedUse").round()).toInt()  - (getResource("co2SavedUse").round()).toInt() + getResource("co2EmittedRecycling").round();
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Lichtsteuerung'),
                      secondary: Icon(Icons.light),
                      value: _lichtsteuerungValue,
                      onChanged: (bool value) {
                        setState(() {
                          _lichtsteuerungValue = value;
                          netEmissions = getResource("co2EmittedProduction").round() + ( getResource("co2EmittedUse").round()).toInt()  - (getResource("co2SavedUse").round()).toInt() + getResource("co2EmittedRecycling").round();
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Schloss'),
                      secondary: Icon(Icons.lock),
                      value: _schlossValue,
                      onChanged: (bool value) {
                        setState(() {
                          _schlossValue = value;
                          netEmissions = getResource("co2EmittedProduction").round() + (getResource("co2EmittedUse").round()).toInt()  - (getResource("co2SavedUse").round()).toInt() + getResource("co2EmittedRecycling").round();
                        });
                      },
                    ),
                  ],
                )
              ]),
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/home.png",
                    fit: BoxFit
                        .scaleDown, // Use BoxFit.fill if you want the image to fill the entire space
                  ),
                ),
                Positioned(
                  top: 640 * scale,
                  left: 510 * scale,
                  child: AnimatedOpacity(
                    opacity: _thermostatValue ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      'assets/thermostat.png',
                      height: 40,
                    ),
                  ),
                ),
                Positioned(
                  top: 625 * scale,
                  left: 245 * scale,
                  child: AnimatedOpacity(
                    opacity: _inneKameraValue ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      'assets/indoor_camera_s.png',
                      height: 50,
                    ),
                  ),
                ),
                Positioned(
                  top: 480 * scale,
                  left: 92 * scale,
                  child: AnimatedOpacity(
                    opacity: _aussenKameraValue ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      'assets/outdoor_camera.png',
                      height: 80,
                    ),
                  ),
                ),
                Positioned(
                  top: 498 * scale,
                  left: 168 * scale,
                  child: AnimatedOpacity(
                    opacity: _fensterkontaktValue ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      'assets/window_contact.png',
                      height: 50,
                    ),
                  ),
                ),
                Positioned(
                  top: 410 * scale,
                  left: 615 * scale,
                  child: AnimatedOpacity(
                    opacity: _lichtsteuerungValue ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      'assets/lamp.png',
                      height: 150,
                    ),
                  ),
                ),
                Positioned(
                  top: 603 * scale,
                  left: 357 * scale,
                  child: AnimatedOpacity(
                    opacity: _schlossValue ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      'assets/lock.png',
                      height: 55,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Container(
                    height: 1085,
                    margin: EdgeInsets.all(25.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Planned duaration of use of the devices',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center),
                          SizedBox(height: 5),
                          Slider(
                            value: _currentSliderValue,
                            min: 1,
                            max: 20, // Assuming you want a range from 1 to 20
                            divisions: 19, // This will create discrete divisions between 1 and 20
                            label: _currentSliderValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                                netEmissions = getResource("co2EmittedProduction").round() + ( getResource("co2EmittedUse").round()).toInt()  - (getResource("co2SavedUse").round()).toInt() + getResource("co2EmittedRecycling").round();
                              });
                            },
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 10,
                            thickness: 2,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.factory, color: Colors.deepOrange.shade300),
                            Text('Production and Transport',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold, color: Colors.deepOrange.shade300
                                ),
                                textAlign: TextAlign.center),],),
                          SizedBox(height: 5),
                          Text(
                            'CO2 emitted',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: LinearProgressIndicator(
                                value: (getResource("co2EmittedProduction") /
                                    getFullResource(
                                        "co2EmittedProduction")), // Assuming the price is a percentage of 100
                                backgroundColor: Colors.deepOrange
                                    .shade300, // Color of the background of the progress bar.
                                valueColor: AlwaysStoppedAnimation<Color>(Colors
                                    .deepOrange
                                    .shade600), // Color of the progress in the progress bar
                                minHeight: 20),
                          ),
                          Text(
                            '${getResource("co2EmittedProduction").round()} kg', // Convert the progress to percentage and round it
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 10,
                            thickness: 2,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.smart_display, color: Color(0xFFDD908B),),
                            Text(
                              'Use',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold, color:Color(0xFFDD908B) ),
                              textAlign: TextAlign.center,
                            ),],),
                          SizedBox(height: 5,
                          ),
                          Text(
                            'CO2 emitted over $_currentSliderValue year(s)',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: LinearProgressIndicator(
                                value: (getResource("co2EmittedUse") /
                                    getFullResource(
                                        "co2EmittedUse")), // Assuming the price is a percentage of 100
                                backgroundColor: Colors.red
                                    .shade300, // Color of the background of the progress bar.
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.red
                                    .shade900), // Color of the progress in the progress bar
                                minHeight: 20),
                          ),
                          Text(
                            '${getResource("co2EmittedUse").round()} kg', // Convert the progress to percentage and round it
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'CO2 saved $_currentSliderValue year(s)',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: LinearProgressIndicator(
                                value: (getResource("co2SavedUse") /
                                    getFullResource(
                                        "co2SavedUse")), // Assuming the price is a percentage of 100
                                backgroundColor: Colors.cyan
                                    .shade300, // Color of the background of the progress bar.
                                valueColor: AlwaysStoppedAnimation<Color>(Colors
                                    .cyan
                                    .shade900), // Color of the progress in the progress bar
                                minHeight: 20),
                          ),
                          Text(
                            '${getResource("co2SavedUse").round()} kg', // Convert the progress to percentage and round it
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Net CO2 emitted in kg',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 160,

                            child: SfRadialGauge(
                                enableLoadingAnimation: true,
                                axes: <RadialAxis>[
                                  RadialAxis(
                                      minimum: _currentSliderValue * (-250),
                                      maximum: _currentSliderValue * (250),
                                      ranges: <GaugeRange>[
                                        GaugeRange(
                                          startValue: _currentSliderValue * (-250),
                                          endValue: _currentSliderValue * (250),
                                          startWidth: 10,
                                          endWidth: 10,
                                          gradient: const SweepGradient(
                                            colors: <Color>[
                                              Color(0XFFB2EBF2),
                                              Color(0XFFFFCDD2)
                                            ],
                                          ),
                                        ),
                                      ],
                                      showTicks: false,
                                      showLastLabel: true,
                                      interval: 100*_currentSliderValue,
                                      axisLineStyle: const AxisLineStyle(
                                        thickness: 0.08,
                                        thicknessUnit: GaugeSizeUnit.factor,
                                      ),
                                      pointers: <GaugePointer>[
                                        NeedlePointer(
                                            enableAnimation: true,
                                            needleLength: 0.7,
                                            value:
                                            getResource("co2EmittedUse") -
                                                getResource("co2SavedUse"),
                                            needleColor: Color(0xFFDD908B),
                                            needleStartWidth: 0,
                                            needleEndWidth: 3,
                                            knobStyle: KnobStyle(
                                                color: Color(0xFFDD908B),
                                                knobRadius: 0.05)),
                                      ]),
                                ]),
                          ),),
                          const Divider(
                            color: Colors.grey,
                            height: 10,
                            thickness: 2,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.recycling, color: Colors
                              .brown
                              .shade500,),
                            Text('Transport and Recycling',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold, color: Colors
                                    .brown
                                    .shade500
                                ),
                                textAlign: TextAlign.center),],),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'CO2 emitted',
                            style: TextStyle(fontSize: 12, ),
                            textAlign: TextAlign.center,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: LinearProgressIndicator(
                                value: (getResource("co2EmittedRecycling") /
                                    getFullResource(
                                        "co2EmittedRecycling")), // Assuming the price is a percentage of 100
                                backgroundColor: Colors.brown
                                    .shade300, // Color of the background of the progress bar.
                                valueColor: AlwaysStoppedAnimation<Color>(Colors
                                    .brown
                                    .shade900), // Color of the progress in the progress bar
                                minHeight: 20),
                          ),
                          Text(
                            '${getResource("co2EmittedRecycling").round()} kg', // Convert the progress to percentage and round it
                            style: TextStyle(fontSize: 18.0),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 10,
                            thickness: 2,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.co2),
                            Text('Net emission over lifecycle',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),],),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${getResource("co2EmittedProduction").round()} kg + ${getResource("co2EmittedUse").round()} kg - ${getResource("co2SavedUse").round()} kg + ${getResource("co2EmittedRecycling").round()} kg', // Convert the progress to percentage and round it
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            '=$netEmissions kg', // Convert the progress to percentage and round it
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ]
                    )
                )
            ),
          ]);
        });
  }
}

class SmartHomeGadget {
  double co2EmittedProduction;
  double co2EmittedRecycling;
  double co2EmittedUse;
  double co2SavedUse;

  SmartHomeGadget({
    required this.co2EmittedProduction,
    required this.co2EmittedRecycling,
    required this.co2EmittedUse,
    required this.co2SavedUse,
  });
}

SmartHomeGadget _thermostat = SmartHomeGadget(
  co2EmittedProduction: 24,
  co2EmittedRecycling: 7,
  co2EmittedUse: 3,
  co2SavedUse: 85,
);
SmartHomeGadget _inneKamera = SmartHomeGadget(
  co2EmittedProduction: 62,
  co2EmittedRecycling: 13,
  co2EmittedUse: 82,
  co2SavedUse: 0,
);
SmartHomeGadget _aussenKamera = SmartHomeGadget(
  co2EmittedProduction: 66,
  co2EmittedRecycling: 16,
  co2EmittedUse: 80,
  co2SavedUse: 0,
);
SmartHomeGadget _fensterkontakt = SmartHomeGadget(
  co2EmittedProduction: 26,
  co2EmittedRecycling: 5,
  co2EmittedUse: 5,
  co2SavedUse: 45,
);
SmartHomeGadget _lichtsteuerung = SmartHomeGadget(
  co2EmittedProduction: 32,
  co2EmittedRecycling: 8,
  co2EmittedUse: 4,
  co2SavedUse: 22,
);
SmartHomeGadget _schloss = SmartHomeGadget(
  co2EmittedProduction: 34,
  co2EmittedRecycling: 10,
  co2EmittedUse: 6,
  co2SavedUse: 0,
);
