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
        if (resource == "carbonFootprint") {
          result += gadgets[i].carbonFootprint;
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
      if (resource == "carbonFootprint") {
        result += gadgets[i].carbonFootprint;
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
    return
    Row(children:[
      Container(
      width: 300,
      height: 1250,
      margin: EdgeInsets.all(25.0),
      child:
      Stack(alignment: Alignment.topCenter, children: [
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
          SizedBox(height: 250),
          Text(
            'Energy Consumption per Day',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          LinearProgressIndicator(
              value: (getResource("energyConsumption") /
                  getFullResource(
                      "energyConsumption")), // Assuming the price is a percentage of 100
              backgroundColor: Colors.cyan
                  .shade300, // Color of the background of the progress bar.
              valueColor: AlwaysStoppedAnimation<Color>(Colors
                  .cyan.shade900), // Color of the progress in the progress bar
              minHeight: 20),
          Text(
            '${getResource("energyConsumption").round()} kwH', // Convert the progress to percentage and round it
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 40),
          Text(
            'Carbon Footprint over Product-Lifespan',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          LinearProgressIndicator(
              value: (getResource("carbonFootprint") /
                  getFullResource(
                      "carbonFootprint")), // Assuming the price is a percentage of 100
              backgroundColor: Colors.brown
                  .shade200, // Color of the background of the progress bar.
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.brown), // Color of the progress in the progress bar
              minHeight: 20),
          Text(
            '${getResource("carbonFootprint").round()} tons of CO2', // Convert the progress to percentage and round it
            style: TextStyle(fontSize: 18.0),
          ),
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
                      child: CircularProgressIndicator(
                        value: getResource("security") /
                            getFullResource("security"),
                        backgroundColor: Colors.lightBlueAccent.shade100,
                        color: Colors.blue,
                        strokeWidth: 10,
                      )),
                  SizedBox(height: 20),
                  Text('Security'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        value:
                            getResource("comfort") / getFullResource("comfort"),
                        backgroundColor: Colors.lightBlueAccent.shade100,
                        color: Colors.blue,
                        strokeWidth: 10,
                      )),
                  SizedBox(height: 20),
                  Text('Comfort'),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
          Text(
            'Price',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          LinearProgressIndicator(
              value: (getResource("price") /
                  getFullResource(
                      "price")), // Assuming the price is a percentage of 100
              backgroundColor: Colors.lightGreen
                  .shade300, // Color of the background of the progress bar.
              valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen
                  .shade900), // Color of the progress in the progress bar
              minHeight: 20),
          Text(
            '${(getResource("price")).round()} Euros', // Convert the progress to percentage and round it
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      )
    ]
    ),
      ),

      Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/home.png",
            fit: BoxFit.scaleDown
            ,  // Use BoxFit.fill if you want the image to fill the entire space
          ),
          Positioned(
            top: 556,
            left: 600,
            child: AnimatedOpacity(
              opacity: _thermostatValue ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/thermostat.png',height: 80,),
            ),
          ),
          Positioned(
            top: 320,
            left: 315,
            child: AnimatedOpacity(
              opacity: _inneKameraValue ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/indoor_camera_s.png',height: 80,),
            ),
          ),
          Positioned(
            top: 500,
            left: 500,
            child: AnimatedOpacity(
              opacity: _aussenKameraValue ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/outdoor_camera.png',height: 80,),
            ),
          ),
          Positioned(
            top: 498,
            left: 436,
            child: AnimatedOpacity(
              opacity: _fensterkontaktValue ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/window_contact.png',height: 80,),
            ),
          ),
          Positioned(
            top: 20,
            left: 300,
            child: AnimatedOpacity(
              opacity: _lichtsteuerungValue ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/lamp.png',height: 300,),
            ),
          ),
          Positioned(
            top: 50,
            left: 100,
            child: AnimatedOpacity(
              opacity: _schlossValue ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/lock.png',height: 80,),
            ),
          ),
        ],
      )
    ]
    );
  }
}

class SmartHomeGadget {
  String name;
  double price;
  int comfort;
  int security;
  double energyConsumption;
  double carbonFootprint;

  SmartHomeGadget({
    required this.name,
    required this.price,
    required this.comfort,
    required this.security,
    required this.energyConsumption,
    required this.carbonFootprint,
  });
}

SmartHomeGadget _thermostat = SmartHomeGadget(
  name: 'Thermostat',
  price: 100.0,
  comfort: 5,
  security: 3,
  energyConsumption: 65.0,
  carbonFootprint: 12,
);
SmartHomeGadget _inneKamera = SmartHomeGadget(
  name: 'Thermostat',
  price: 100.0,
  comfort: 5,
  security: 3,
  energyConsumption: 50.0,
  carbonFootprint: 12,
);
SmartHomeGadget _aussenKamera = SmartHomeGadget(
  name: 'Thermostat',
  price: 100.0,
  comfort: 5,
  security: 3,
  energyConsumption: 15.0,
  carbonFootprint: 12,
);
SmartHomeGadget _fensterkontakt = SmartHomeGadget(
  name: 'Thermostat',
  price: 100.0,
  comfort: 5,
  security: 3,
  energyConsumption: 30.0,
  carbonFootprint: 12,
);
SmartHomeGadget _lichtsteuerung = SmartHomeGadget(
  name: 'Thermostat',
  price: 100.0,
  comfort: 5,
  security: 3,
  energyConsumption: 10.0,
  carbonFootprint: 12,
);
SmartHomeGadget _schloss = SmartHomeGadget(
  name: 'Schloss',
  price: 100.0,
  comfort: 5,
  security: 3,
  energyConsumption: 20.0,
  carbonFootprint: 12,
);
