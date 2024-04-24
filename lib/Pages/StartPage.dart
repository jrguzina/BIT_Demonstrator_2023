import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import 'package:bit_dem_1/Pages/co2_footprint_page.dart';
import 'package:bit_dem_1/Pages/EnergyUsagePage.dart';
import 'package:bit_dem_1/Pages/TransportationPage.dart';
import 'package:bit_dem_1/Pages/SmartHomeResourcePage.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool useAlternativeModel = false;

  @override
  Widget build(BuildContext context) {
    double minModelSize = 300;
    double modelWidth = MediaQuery.of(context).size.width * 0.5;
    double modelHeight = MediaQuery.of(context).size.height * 0.8;
    modelWidth = modelWidth < minModelSize ? minModelSize : modelWidth;
    modelHeight = modelHeight < minModelSize ? minModelSize : modelHeight;

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
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
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
                    category: 'Ressourcen',
                    icon: Icon(Icons.local_florist),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SmartHomeResourcePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ModelViewerWidget(useAlternativeModel: useAlternativeModel),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            useAlternativeModel = !useAlternativeModel;
          });
        },
        child: Icon(Icons.swap_horiz),
      ),
    );
  }
}

class ModelViewerWidget extends StatefulWidget {
  final bool useAlternativeModel;

  const ModelViewerWidget({Key? key, required this.useAlternativeModel}) : super(key: key);

  @override
  _ModelViewerWidgetState createState() => _ModelViewerWidgetState();
}

class _ModelViewerWidgetState extends State<ModelViewerWidget> {
  @override
  Widget build(BuildContext context) {
    double minModelSize = 300;
    double modelWidth = MediaQuery.of(context).size.width * 0.5;
    double modelHeight = MediaQuery.of(context).size.height * 0.8;
    modelWidth = modelWidth < minModelSize ? minModelSize : modelWidth;
    modelHeight = modelHeight < minModelSize ? minModelSize : modelHeight;

    return Container(
      width: modelWidth,
      height: modelHeight,
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
      child: ModelViewer(
        key: UniqueKey(), //Force rebuild when key changes
        src: widget.useAlternativeModel ? 'assets/poly.glb' : 'assets/bosch_camera_model.glb',
        autoPlay: true,
        backgroundColor: Colors.transparent,
        cameraControls: true,
        autoRotate: true,
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  final VoidCallback onTap;
  final Icon icon;

  CategoryCard({required this.category, required this.onTap, required this.icon});

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
              icon,
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
