import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';


void main() => runApp(DemonstratorApp());

class DemonstratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bosch Smart Home Demonstrator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bosch Smart Home Demonstrator'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CategoryCard(
                    category: 'Energie',
                    icon: Icon(Icons.flash_on),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EnergyUsagePage(),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    category: 'Transport',
                    icon: Icon(Icons.directions_car),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransportationPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8, // 80% der Bildschirmbreite
                  height: MediaQuery.of(context).size.height * 0.8, // 80% der Bildschirmhöhe
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: ModelViewer(
                    src: 'assets/bosch_camera_model.glb',
                    //src: 'assets/Format2.glb',
                    autoPlay: true,
                    backgroundColor: Colors.transparent,
                    cameraControls: true,
                    autoRotate: true,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CategoryCard(
                    category: 'Ressourcen',
                    icon: Icon(Icons.local_florist),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResourceUsagePage(),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    category: 'CO2 Footprint',
                    icon: Icon(Icons.cloud_queue),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CO2FootprintPage(),
                        ),
                      );
                    },
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



class MyModelViewerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3D Model Viewer'),
      ),
      body: Center(
        child: ModelViewer(
          src:
              'C:\\Users\\Niklas\\Downloads\\google_home\\scene.gltf', // Path to your GLTF model
          alt: 'A 3D Model',
          autoRotate: true, // Enable auto-rotation
          cameraControls: true, // Enable camera controls
        ),
      ),
    );
  }
}








class CategoryCard extends StatelessWidget {
  final String category;
  final VoidCallback onTap;
  final Icon icon;

  CategoryCard({required this.category, required this.onTap,required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10.0),
        ),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    icon, // Display the icon here
    Text(
    category,
    style: TextStyle(fontSize: 20.0),
    ),
    ],
    ),
    ),
      ),
    );
  }
}


//Ab hier können die Kategorien bearbeitet werden
class EnergyUsagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energieverwendung'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Energieverbrauch nach Raum',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 300, // Höhe je nach Bedarf anpassen
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    ColumnSeries<ChartData, String>(
                      dataSource: [
                        ChartData('Küche', 30),
                        ChartData('Wohnzimmer', 50),
                        ChartData('Schlafzimmer', 40),
                        ChartData('Badezimmer', 25),
                        // Weitere Datenpunkte hier hinzufügen
                      ],
                      xValueMapper: (ChartData data, _) => data.room,
                      yValueMapper: (ChartData data, _) => data.value,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Aktueller Energieverbrauch',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 300,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    LineSeries<ChartData, String>(
                      dataSource: [
                        ChartData('Küche', 40),
                        ChartData('Wohnzimmer', 60),
                        ChartData('Schlafzimmer', 50),
                        ChartData('Badezimmer', 35),
                        // Weitere Datenpunkte hier hinzufügen
                      ],
                      xValueMapper: (ChartData data, _) => data.room,
                      yValueMapper: (ChartData data, _) => data.value,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Tile(
                title: 'Verlauf des Energieverbrauchs',
                content:
                'Informationen über den Verlauf des Energieverbrauchs über die Zeit...',
              ),
              SizedBox(height: 20.0),
              Tile(
                title: 'Vergleiche mit Durchschnittsverbrauch',
                content:
                'Vergleiche mit dem Durchschnittsverbrauch anderer Haushalte...',
              ),
              SizedBox(height: 20.0),
              Tile(
                title: 'Tipps zur Energieeinsparung',
                content: 'Tipps zur effizienten Nutzung und Energieeinsparung...',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ChartData {
  final String room;
  final double value;

  ChartData(this.room, this.value);
}

// Eine einfache Datenstruktur für die Elemente
class ElementItem {
  final int number;
  final String symbol;
  final String name;
  final String details;
  final Color color;

  ElementItem(this.number, this.symbol, this.name, this.details, this.color);
}

class ResourceUsagePage extends StatelessWidget {
  final List<ElementItem> elements = [
    ElementItem(49, 'In', 'Indium', 'Indium-Zinn-Oxid wird für Touchscreens verwendet.', Colors.blue),
    ElementItem(50, 'Sn', 'Zinn', 'Zinn wird für Lötzinn und in Indium-Zinn-Oxid verwendet.', Colors.red),
    ElementItem(13, 'Al', 'Aluminium', 'Aluminium wird in Bildschirmen und Gehäusen verwendet.', Colors.blue),
    ElementItem(14, 'Si', 'Silizium', 'Silizium ist ein Grundbestandteil von Mikrochips.', Colors.purple),
    ElementItem(8, 'O', 'Sauerstoff', 'Sauerstoff wird für Glas und Batterien verwendet.', Colors.blue),
    ElementItem(19, 'K', 'Kalium', 'Kalium wird im Displayglas zur Verstärkung verwendet.', Colors.blue),
    ElementItem(39, 'Y', 'Yttrium', 'Yttrium wird in Leuchtdioden und Phosphoren verwendet.', Colors.green),
    ElementItem(57, 'La', 'Lanthan', 'Lanthan wird in Akkus und Kameraobjektiven verwendet.', Colors.green),
    ElementItem(65, 'Tb', 'Terbium', 'Terbium wird in Festplatten und Leuchtdioden verwendet.', Colors.green),
    ElementItem(59, 'Pr', 'Praseodym', 'Praseodym wird in Leuchtdioden verwendet.', Colors.green),
    ElementItem(63, 'Eu', 'Europium', 'Europium wird in roten und blauen Leuchtdioden verwendet.', Colors.green),
    ElementItem(66, 'Dy', 'Dysprosium', 'Dysprosium wird in Neodym-Magneten verwendet.', Colors.green),
    ElementItem(29, 'Cu', 'Kupfer', 'Kupfer wird für die Verdrahtung verwendet.', Colors.orange),
    ElementItem(47, 'Ag', 'Silber', 'Silber wird in Elektronik für Kontakte verwendet.', Colors.orange),
    ElementItem(79, 'Au', 'Gold', 'Gold wird für hochwertige elektrische Verbindungen verwendet.', Colors.orange),
    ElementItem(28, 'Ni', 'Nickel', 'Nickel wird in Mikrofonen und Batterien verwendet.', Colors.orange),
    ElementItem(60, 'Nd', 'Neodym', 'Neodym wird in Magneten von Festplatten und Kopfhörern verwendet.', Colors.green),
    ElementItem(64, 'Gd', 'Gadolinium', 'Gadolinium wird in Medizintechnik und in einigen Leuchtdioden verwendet.', Colors.green),
    ElementItem(3, 'Li', 'Lithium', 'Lithium wird in Akkus verwendet.', Colors.blue),
    ElementItem(27, 'Co', 'Kobalt', 'Kobalt wird in Lithium-Ionen-Akkus verwendet.', Colors.blue),
    ElementItem(6, 'C', 'Kohlenstoff', 'Kohlenstoff wird in Kunststoffen und Batterien verwendet.', Colors.grey),
    ElementItem(12, 'Mg', 'Magnesium', 'Magnesium wird in Gehäusen und Kameragehäusen verwendet.', Colors.blue),
    ElementItem(35, 'Br', 'Brom', 'Brom wird als Flammschutz in elektronischen Geräten verwendet.', Colors.red),
    ElementItem(33, 'As', 'Arsen', 'Arsen wird in Halbleitern verwendet.', Colors.purple),
    ElementItem(15, 'P', 'Phosphor', 'Phosphor wird in Leuchtdioden verwendet.', Colors.green),
    ElementItem(31, 'Ga', 'Gallium', 'Gallium wird in Halbleitern und Leuchtdioden verwendet.', Colors.purple),
    ElementItem(50, 'Sn', 'Zinn', 'Zinn wird in Lötmaterial und leitfähigen Beschichtungen verwendet.', Colors.red),
    ElementItem(82, 'Pb', 'Blei', 'Blei wird in einigen älteren Lötmaterialien und Akkus verwendet.', Colors.red),
    // ... und so weiter für weitere Elemente
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verwendete Ressourcen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Grid-Ansicht der Elemente
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (MediaQuery.of(context).size.width / 75).floor(), // Dynamisch berechnete Anzahl der Spalten
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 1/1,
                ),
                itemCount: elements.length,
                itemBuilder: (context, index) {
                  ElementItem element = elements[index];
                  return Container(
                    width: 75,
                    height: 75,
                    color: element.color,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('${element.number}\n${element.symbol}\n${element.name}'),
                              content: Text(element.details),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Schließen'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Center(
                        child: Text(
                          '${element.number}\n${element.symbol}\n${element.name}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.0),
              // Die restlichen Inhalte der Seite
              // ... (keine Änderungen zu Ihrem ursprünglichen Code)
            ],
          ),
        ),
      ),
    );
  }
}

class TransportationPage extends StatelessWidget {
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
              title: 'Energieverbrauch während des Transports',
              content:
                  'Informationen über den Energieverbrauch während des Transports...',
            ),
            SizedBox(height: 20.0),
            Tile(
              title: 'CO2-Fußabdruck durch Transportaktivitäten',
              content:
                  'Informationen über den CO2-Fußabdruck aufgrund von Transportaktivitäten...',
            ),
            SizedBox(height: 20.0),
            Tile(
              title: 'Umweltfreundliche Lieferung und Logistik',
              content:
                  'Tipps und Informationen zur umweltfreundlichen Lieferung und Logistik...',
            ),
          ],
        ),
      ),
    );
  }
}



class CO2FootprintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CO2 Footprint'),
        ),
        body: Row(
            children:[
              Container(
                width: 300,
                height: 1250,
                margin: EdgeInsets.all(25.0),

                child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(
                          'assets/phone_mockup.png',
                          fit: BoxFit.contain),
                      MySwitch()
                    ]
                ),
              ),
              Container(
                  child: Image.asset('assets/smart_home.png')),
            ]
        )
    );
  }
}


class Tile extends StatelessWidget {
  final String title;
  final String content;

  Tile({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(content),
          ],
        ),
      ),
    );
  }
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
class MySwitch extends StatefulWidget {
  @override
  MySwitchState createState() => MySwitchState();
}

class MySwitchState extends State<MySwitch>  {
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


  List<SmartHomeGadget> gadgets = [_thermostat, _inneKamera, _aussenKamera, _lichtsteuerung, _fensterkontakt, _schloss];

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
    return Column(
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
            }
            );
          },
        ),
        SizedBox(height: 250),
        Text(
          'Energy Consumption per Day',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        LinearProgressIndicator(
          value:  (getResource("energyConsumption")/getFullResource("energyConsumption")),// Assuming the price is a percentage of 100
          backgroundColor: Colors.cyan.shade300,  // Color of the background of the progress bar.
          valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan.shade900),  // Color of the progress in the progress bar
          minHeight: 20,
          borderRadius: BorderRadius.circular(10),
        ),

        Text(
          '${getResource("energyConsumption").round()} kwH',  // Convert the progress to percentage and round it
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 40),
        Text(
          'Carbon Footprint over Product-Lifespan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        LinearProgressIndicator(
          value:  (getResource("carbonFootprint")/getFullResource("carbonFootprint")),// Assuming the price is a percentage of 100
          backgroundColor: Colors.brown.shade200,  // Color of the background of the progress bar.
          valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),  // Color of the progress in the progress bar
          minHeight: 20,
          borderRadius: BorderRadius.circular(10),
        ),

        Text(
          '${getResource("carbonFootprint").round()} tons of CO2',  // Convert the progress to percentage and round it
          style: TextStyle(fontSize: 18.0),
        ),

        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 60, height: 60,child:
                CircularProgressIndicator(
                  value:getResource("security")/getFullResource("security"),
                  backgroundColor: Colors.lightBlueAccent.shade100,
                  strokeCap: StrokeCap.round,
                  color: Colors.blue,
                  strokeWidth: 10,)
                ),
                SizedBox(height: 20),
                Text('Security'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 60, height: 60, child:
                CircularProgressIndicator(
                  value: getResource("comfort")/getFullResource("comfort"),
                  backgroundColor: Colors.lightBlueAccent.shade100,
                  strokeCap: StrokeCap.round,
                  color: Colors.blue,
                  strokeWidth: 10,)
                ),
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
          value:  (getResource("price")/getFullResource("price")),// Assuming the price is a percentage of 100
          backgroundColor: Colors.lightGreen.shade300,  // Color of the background of the progress bar.
          valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen.shade900),  // Color of the progress in the progress bar
          minHeight: 20,
          borderRadius: BorderRadius.circular(10),
        ),
        Text(
          '${(getResource("price")).round()} Euros',  // Convert the progress to percentage and round it
          style: TextStyle(fontSize: 18.0),
        ),
      ],
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
  }
  );
}




//test