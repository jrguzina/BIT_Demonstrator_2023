import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:bit_dem_1/Elements/Tile.dart';


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