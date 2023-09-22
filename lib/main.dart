import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:scaled_list/scaled_list.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:scaled_list/scaled_list.dart';

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

class ThreeDModelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Model Viewer')),
        body: Center(
          child: ModelViewer(
            backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
            src:
                'https://www.turbosquid.com/de/3d-models/iphone-13-pro-max-3d-model-3d-1802164',
            alt: 'A 3D model of an astronaut',
            ar: true,
            autoRotate: true,
            iosSrc:
                'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
            disableZoom: true,
          ),
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

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bosch Smart Home Demonstrator'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1633194883650-df448a10d554?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1576&q=80',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CategoryCard(
                    category: 'Energie',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EnergyUsagePage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20.0),
                  CategoryCard(
                    category: 'Ressourcen',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResourceUsagePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CategoryCard(
                    category: 'Transport',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransportationPage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20.0),
                  CategoryCard(
                    category: 'CO2 Footprint',
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

class CategoryCard extends StatelessWidget {
  final String category;
  final VoidCallback onTap;

  CategoryCard({required this.category, required this.onTap});

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
          child: Text(
            category,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
/*class Tile extends StatelessWidget {
  final String title;
  final String content;

  Tile({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(
            content,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
*/

// Hier können Sie die Unterkategorie-Seiten implementieren
class EnergyUsagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energieverwendung'),
      ),
      body: Padding(
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
              height: 300, // Adjust the height as needed
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  ColumnSeries<ChartData, String>(
                    dataSource: [
                      ChartData('Küche', 30),
                      ChartData('Wohnzimmer', 50),
                      ChartData('Schlafzimmer', 40),
                      ChartData('Badezimmer', 25),
                      // Add more data points here
                    ],
                    xValueMapper: (ChartData data, _) => data.room,
                    yValueMapper: (ChartData data, _) => data.value,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Tile(
              title: 'Aktueller Energieverbrauch',
              content: 'Informationen über den aktuellen Energieverbrauch...',
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
    );
  }
}

class ChartData {
  final String room;
  final double value;

  ChartData(this.room, this.value);
}

class ResourceUsagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verwendete Ressourcen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Tile(
              title: 'Materialien',
              content: 'Informationen über die verwendeten Materialien...',
            ),
            SizedBox(height: 20.0),
            Tile(
              title: 'Herkunft',
              content: 'Informationen über die Herkunft der Materialien...',
            ),
            SizedBox(height: 20.0),
            Tile(
              title: 'Recyclingfähigkeit',
              content: 'Informationen über die Recyclingfähigkeit...',
            ),
            SizedBox(height: 20.0),
            Tile(
              title: 'Reduzierung des Ressourcenverbrauchs',
              content: 'Tipps zur Reduzierung des Ressourcenverbrauchs...',
            ),
          ],
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
      body: Stack(
        children: [
          Image.asset(
            'assets/background_green.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          ListView(
            scrollDirection: Axis.horizontal,
                children: customCO2Boxes,
            )
        ]
            ),
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

class CustomCO2Box extends StatelessWidget {
  final String title;
  final String content;
  final Color colour;
  final Icon icon;
  final Widget? diagram;

  CustomCO2Box(
      {required this.title,
      required this.content,
      required this.icon,
      this.colour = Colors.white,
      this.diagram});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(180),
      child: Container(
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(

              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  icon,
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(content),
              SizedBox(height: 10),
              if (diagram != null) diagram!,
            ],
          ),
        ),
      ),
    );
  }
}



RotatedBox customCO2BoxWheel = RotatedBox(
  quarterTurns: 3,
  child: ListWheelScrollView(
    //controller: FixedExtentScrollController(),
    itemExtent: 600,
    diameterRatio: 5,
    //magnification: 1,
    //offAxisFraction:0.5 ,
    //overAndUnderCenterOpacity: 0.5,
    //perspective: 0.001,
    //squeeze: 1,
    physics: const BouncingScrollPhysics(),
    children: customCO2Boxes.map((box) {
      return Transform.rotate(
        angle: pi / 2 + pi / 180 * 0.5,
        child: box,
      );
    }).toList(),
  ),
);

List<CustomCO2Box> customCO2Boxes = [
  CustomCO2Box(
    title: 'CO2-Emissionen während der Herstellung',
    content: 'Informationen über die CO2-Emissionen während der Herstellung',
    colour: Color(0xFFc3c3c3),
    icon: Icon(Icons.factory),
    diagram: Container(
      height: 200,
      width: 200,
      child:PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Colors.green,
            title: 'Manufacturing',
            value: 40,
          ),
          PieChartSectionData(
            color: Colors.blue,
            title: 'Distribution',
            value: 30,
          ),
          PieChartSectionData(
            color: Colors.yellow,
            title: 'Design',
            value: 20,
          ),
          PieChartSectionData(
            color: Colors.orange,
            title: 'Quality Control',
            value: 10,
          ),
        ],
        sectionsSpace: 0,
        centerSpaceRadius: 40,
        borderData: FlBorderData(
          show: false,
        ),
      ),

      ),
    ),
  ),
  CustomCO2Box(
    title: 'CO2-Emissionen während des Transports',
    content: 'Informationen über die CO2-Emissionen während des Transports',
    colour: Color(0xFFc3c3c3),
    icon: Icon(Icons.local_shipping),
  ),
  CustomCO2Box(
    title: 'CO2-Emissionen während des Betriebs',
    content: 'Informationen über die CO2-Emissionen während des Betriebs',
    colour: Color(0xFFc3c3c3),
    icon: Icon(Icons.electric_bolt),
  ),
  CustomCO2Box(
    title: 'CO2-Emissionen während des Recyclings',
    content: 'Informationen über die ',
    colour: Color(0xFFc3c3c3),
    icon: Icon(Icons.recycling),
  ),

  CustomCO2Box(
    title: 'Maßnahmen zur Reduzierung von Emissionen',
    content: 'Tipps und Informationen zur Reduzierung von Emissionen...',
    colour: Color(0xFFc3c3c3),
    icon: Icon(Icons.battery_saver),
  ),
  CustomCO2Box(
    title: 'Kompensationsmöglichkeiten',
    content:
        'Informationen über Möglichkeiten zur Kompensation von CO2-Emissionen...',
    colour: Color(0xFFB8BC86),
    icon: Icon(Icons.energy_savings_leaf),
  ),
  CustomCO2Box(
    title: 'Tipps zur nachhaltigen Nutzung',
    content: 'Tipps zur nachhaltigen Nutzung des Smart-Home-Produkts...',
    colour: Color(0xFFB8BC86),
    icon: Icon(Icons.forest),
  ),
];


//test