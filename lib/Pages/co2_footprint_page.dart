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
        body:
              MySwitch()
        );
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
        if (resource == "energyConsumption") {
          result += gadgets[i].energyConsumption;
        }
        if (resource == "energySavings") {
          result += gadgets[i].energySavings;
        }
        if (resource == "price") {
          result += gadgets[i].price;
        }
        if (resource == "security") {
          result += gadgets[i].security;
        }
        if (resource == "comfort") {
          result += gadgets[i].comfort;
        }
      }
    }
    return result;
  }

  double getFullResource(resource) {
    double result = 0;
    for (var i = 0; i < gadgets.length; i++) {
      if (resource == "energyConsumption") {
        result += gadgets[i].energyConsumption;
      }
      if (resource == "energySavings") {
        result += gadgets[i].energySavings;
      }
      if (resource == "price") {
        result += gadgets[i].price;
      }
      if (resource == "security") {
        result += gadgets[i].security;
      }
      if (resource == "comfort") {
        result += gadgets[i].comfort;
      }
    }
    return result;
  }




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



      // Use the scale as needed, for example, logging it or passing it to another widget
      print('Scale factor: $scale');
    return
    Row(children:[
      Container(

      width: 290,
      height: 1085,
      margin: EdgeInsets.all(25.0),
      child:
      Stack(alignment: Alignment.center, children: [
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
              });
            },
          ),
        ],
      )
    ]
    ),
      ),

      Stack(
        alignment: Alignment.topLeft,

        children: [
          Align(
            alignment: Alignment.topLeft,
            child:

          Image.asset(
            "assets/home.png",
            fit: BoxFit.scaleDown,  // Use BoxFit.fill if you want the image to fill the entire space
          ),
          ),
          Positioned(
            top: 640*scale,
            left: 510*scale,

            child: AnimatedOpacity(
              opacity: _thermostatValue ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/thermostat.png',height: 40,),
            ),
          ),
          Positioned(
            top: 625*scale,
            left: 245*scale,
            child: AnimatedOpacity(
              opacity: _inneKameraValue ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/indoor_camera_s.png',height: 50,),
            ),
          ),
          Positioned(
            top: 480*scale,
            left: 92*scale,
            child: AnimatedOpacity(
              opacity: _aussenKameraValue ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/outdoor_camera.png',height: 80,),
            ),
          ),
          Positioned(
            top: 498*scale,
            left: 168*scale,
            child: AnimatedOpacity(
              opacity: _fensterkontaktValue ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/window_contact.png',height: 50,),
            ),
          ),
          Positioned(
            top: 410*scale,
            left: 615*scale,
            child: AnimatedOpacity(
              opacity: _lichtsteuerungValue ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/lamp.png',height: 150,),
            ),
          ),
          Positioned(
            top: 603*scale,
            left: 357*scale,
            child: AnimatedOpacity(
              opacity: _schlossValue ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/lock.png',height: 55,),
            ),
          ),
        ],
      ),Expanded(child:
    Container(
    height: 1085,
    margin: EdgeInsets.all(25.0),
    child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[



            Text(
        'Energy Consumption per Day',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child:
        LinearProgressIndicator(
            value: (getResource("energyConsumption") /
                getFullResource(
                    "energyConsumption")), // Assuming the price is a percentage of 100
            backgroundColor: Colors.red
                .shade300, // Color of the background of the progress bar.
            valueColor: AlwaysStoppedAnimation<Color>(Colors
                .red.shade900), // Color of the progress in the progress bar
            minHeight: 20),),
        Text(
          '${getResource("energyConsumption").round()} kwH', // Convert the progress to percentage and round it
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 40),
          Text(
            'Energy Savings per Day',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:
            LinearProgressIndicator(
                value: (getResource("energySavings") /
                    getFullResource(
                        "energySavings")), // Assuming the price is a percentage of 100
                backgroundColor: Colors.cyan
                    .shade300, // Color of the background of the progress bar.
                valueColor: AlwaysStoppedAnimation<Color>(Colors
                    .cyan.shade900), // Color of the progress in the progress bar
                minHeight: 20),),
          Text(
            '${getResource("energySavings").round()} kwH', // Convert the progress to percentage and round it
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 40),
        Text(
          'Net Energy Influence',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child:
          SfRadialGauge(
            enableLoadingAnimation: true,
              axes: <RadialAxis>[
                RadialAxis(minimum: -500,maximum: 500,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: -500,
                        endValue: -300,
                        startWidth: 10,
                        endWidth:10,
                        gradient: const SweepGradient(
                          colors: <Color>[ Color(0XFF006064), Colors.cyan],),),
                      GaugeRange(
                        startValue: -300,
                        endValue: -100,
                        startWidth: 10,
                        endWidth:10,
                        gradient: const SweepGradient(
                          colors: <Color>[ Colors.cyan, Color(0XFFB2EBF2)],),),
                      GaugeRange(
                        startValue: -100,
                        endValue: 100,
                        startWidth: 10,
                        endWidth:10,
                        gradient: const SweepGradient(
                          colors: <Color>[Color(0XFFB2EBF2), Color(0XFFFFCDD2)]),),
                      GaugeRange(
                        startValue: 100,
                        endValue: 300,
                        startWidth: 10,
                        endWidth:10,
                        gradient: const SweepGradient(
                          colors: <Color>[ Color(0XFFFFCDD2), Colors.red],),),
                      GaugeRange(
                        startValue: 300,
                        endValue: 500,
                        startWidth: 10,
                        endWidth:10,
                        gradient: const SweepGradient(
                          colors: <Color>[ Colors.red, Color(0XFFB71C1C)],),),

                    ],

                    showTicks: false,

                    showLastLabel: true,
          interval: 100,
          axisLineStyle: const AxisLineStyle(
          thickness: 0.08,
          thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: <GaugePointer>[
          NeedlePointer(
            enableAnimation: true,
          needleLength: 0.7,
          value: getResource("energyConsumption")-getResource("energySavings"),
          needleColor: Color(0xFFDD908B),
          needleStartWidth: 0,
          needleEndWidth:  3 ,
          knobStyle: KnobStyle(color: Color(0xFFDD908B), knobRadius: 0.05)),
          ]),
              ]
          ),),

          SizedBox(height: 40),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child:CircularProgressIndicator(
                      value: getResource("security") /
                          getFullResource("security"),
                      backgroundColor: Colors.lightBlueAccent.shade100,
                      color: Colors.blue,
                      strokeWidth: 10,
                    )),),
                SizedBox(height: 10),
                Text('Security'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child:CircularProgressIndicator(
                      value: getResource("comfort") / getFullResource("comfort"),
                      backgroundColor: Colors.lightBlueAccent.shade100,
                      color: Colors.blue,
                      strokeWidth: 10,
                    )),),
                SizedBox(height: 20),
                Text('Comfort'),
              ],
            ),
          ],
        ),
        SizedBox(height: 40),
        ]
      )
    )),]
    );
  }
  );
  }}


class SmartHomeGadget {
  String name;
  double price;
  int comfort;
  int security;
  double energyConsumption;
  double energySavings;

  SmartHomeGadget({
    required this.name,
    required this.price,
    required this.comfort,
    required this.security,
    required this.energyConsumption,
    required this.energySavings,
  });
}

SmartHomeGadget _thermostat = SmartHomeGadget(
  name: 'Thermostat',
  price: 100.0,
  comfort: 5,
  security: 3,
  energyConsumption: 65.0,
  energySavings: 85,
);
SmartHomeGadget _inneKamera = SmartHomeGadget(
  name: 'Thermostat',
  price: 100.0,
  comfort: 5,
  security: 3,
  energyConsumption: 50.0,
  energySavings: 0,
);
SmartHomeGadget _aussenKamera = SmartHomeGadget(
  name: 'Thermostat',
  price: 100.0,
  comfort: 5,
  security: 3,
  energyConsumption: 15.0,
  energySavings: 0,
);
SmartHomeGadget _fensterkontakt = SmartHomeGadget(
  name: 'Thermostat',
  price: 100.0,
  comfort: 5,
  security: 3,
  energyConsumption: 30.0,
  energySavings: 45,
);
SmartHomeGadget _lichtsteuerung = SmartHomeGadget(
  name: 'Thermostat',
  price: 100.0,
  comfort: 5,
  security: 3,
  energyConsumption: 10.0,
  energySavings: 22,
);
SmartHomeGadget _schloss = SmartHomeGadget(
  name: 'Schloss',
  price: 100.0,
  comfort: 5,
  security: 3,
  energyConsumption: 20.0,
  energySavings: 0,
);
