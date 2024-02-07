import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EnergyUsagePage extends StatefulWidget {
  @override
  _EnergyUsagePageState createState() => _EnergyUsagePageState();
}

class _EnergyUsagePageState extends State<EnergyUsagePage> {
  bool smartHeatingActivated = false;
  bool smartSecurityActivated = false;
  bool smartComfortActivated = false;

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
                'Energieverbrauch pro Jahr',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 300,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(text: 'Monat'),
                  legend: Legend(isVisible: true),
                  primaryYAxis: NumericAxis(
                    minimum: 0,
                    maximum: 250,
                    interval: 50,
                  ),
                  series: <ChartSeries>[
                    ColumnSeries<ChartData, String>(
                      name: 'Durchschnittsverbrauch',
                      dataSource: [
                        ChartData('Jan', 200),
                        ChartData('Feb', 180),
                        ChartData('Mar', 160),
                        ChartData('Apr', 140),
                        ChartData('May', 120),
                        ChartData('Jun', 100),
                        ChartData('Jul', 80),
                        ChartData('Aug', 80),
                        ChartData('Sep', 100),
                        ChartData('Oct', 120),
                        ChartData('Nov', 140),
                        ChartData('Dec', 180),
                      ],
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.value,
                    ),
                    ColumnSeries<ChartData, String>(
                      name: 'Smart Home Verbrauch',
                      dataSource: [
                        ChartData('Jan', 200),
                        ChartData('Feb', 180),
                        ChartData('Mar', 160),
                        ChartData('Apr', 140),
                        ChartData('May', 120),
                        ChartData('Jun', 100),
                        ChartData('Jul', 80),
                        ChartData('Aug', 80),
                        ChartData('Sep', 100),
                        ChartData('Oct', 120),
                        ChartData('Nov', 140),
                        ChartData('Dec', 180),
                      ],
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) =>
                          adjustEnergyConsumption(data.value),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildToggleSwitch(
                    'Smart Heating',
                    smartHeatingActivated,
                        (value) {
                      setState(() {
                        smartHeatingActivated = value;
                      });
                    },
                  ),
                  buildToggleSwitch(
                    'Smart Security',
                    smartSecurityActivated,
                        (value) {
                      setState(() {
                        smartSecurityActivated = value;
                      });
                    },
                  ),
                  buildToggleSwitch(
                    'Smart Comfort',
                    smartComfortActivated,
                        (value) {
                      setState(() {
                        smartComfortActivated = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Vergleich zum deutschen Durchschnitt:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Durchschnittlicher Verbrauch eines deutschen Haushalts (2 Personen, 75qm): 2770 kWh/Jahr',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        'Durchschnittlicher Verbrauch unter Einsatz von Smart Home Produkten: 1850 kWh/Jahr',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Standby-Energiebedarf vernetzter Geräte bis 2025:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '14 TWh (Äquivalent der Nettoproduktion eines Kohlekraftwerks)',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 200,
                        child: SfCircularChart(
                          legend: Legend(isVisible: true),
                          series: <CircularSeries>[
                            DoughnutSeries<ChartData, String>(
                              dataSource: [
                                ChartData('StandBy', 14, label: 'StandBy'),
                                ChartData('Remaining', 86, label: 'Remaining'),
                              ],
                              xValueMapper: (ChartData data, _) => data.label,
                              yValueMapper: (ChartData data, _) => data.value,
                              dataLabelMapper: (ChartData data, _) => data.label,
                              dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double adjustEnergyConsumption(double value) {
    if (smartHeatingActivated) {
      value -= 20; // Energy consumption goes down if Smart Heating is active
    }
    if (smartSecurityActivated) {
      value += 20; // Energy consumption goes up if Smart Security is active
    }
    if (smartComfortActivated) {
      value += 20; // Energy consumption goes up if Smart Comfort is active
    }
    return value;
  }

  Widget buildToggleSwitch(
      String title, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class ChartData {
  final String month;
  final double value;
  final String label;

  ChartData(this.month, this.value, {this.label = ''});
}

void main() {
  runApp(MaterialApp(
    home: EnergyUsagePage(),
  ));
}
