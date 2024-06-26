import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_widget/info_widget.dart';
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
            children: <Widget>[Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
              Text(
                'Darstellung des Energieverbrauchs pro Jahr',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),InfoWidget(infoText: 'Diese Seite bietet Nutzern Einblicke in ihren Energieverbrauch und wie verschiedene Smart-Home-Funktionen ihn beeinflussen können. Sie dient der Informationsbereitstellung, Entscheidungsunterstützung und Bewusstseinsbildung, indem sie den Nutzern Muster im Verbrauch zeigt und sie dazu motiviert, energieeffiziente Entscheidungen zu treffen. Durch die direkte Benutzerinteraktion mit Schaltern können sie die Auswirkungen ihrer Entscheidungen auf den Energieverbrauch sehen, was die Seite zu einer wichtigen Ergänzung der App macht.',
                  iconData: Icons.help, iconColor: Colors.lightBlue)]),
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
                      color: Colors.red,
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
                      color: Colors.green,
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
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                          children: [
                            TextSpan(
                              text:
                              'Durchschnittlicher Verbrauch eines deutschen Haushalts (2 Personen, 75qm): 3.470 kWh/Jahr\n',
                            ),
                            TextSpan(
                              text: 'Quelle: Statistisches Bundesamt',
                              style: TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                          children: [
                            TextSpan(
                              text:
                              'Durchschnittlicher Verbrauch unter Einsatz von Smart Home Produkten (Energie, Sicherheit, Komfort): 2.324 kWh/Jahr\n',
                            ),
                            TextSpan(
                              text: 'Quelle: Eigene Berechnungen basierend auf Studien (vgl. Öko-Institut - Quack et al., S.52)',
                              style: TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ],
                        ),
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
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                          children: [
                            TextSpan(
                              text: '14 TWh (Äquivalent der Nettoproduktion eines Kohlekraftwerks) - langfristig bis zu 70TWh\n',
                            ),
                            TextSpan(
                              text: 'Quelle: Studie - Bund für Umwelt und Naturschutz Deutschland e.V., S.22',
                              style: TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ],
                        ),
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
                              pointColorMapper: (ChartData data, _) => data.label == 'StandBy' ? Colors.red : Colors.green,
                              dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Verbrauch im Standby-Modus smarter Geräte:',
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 300,
                        child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(text: 'Gerätekategorie'),
                          legend: Legend(isVisible: true),
                          primaryYAxis: NumericAxis(minimum: 0, maximum: 30, interval: 1),
                          series: <ChartSeries>[
                            RangeColumnSeries<DeviceData, String>(
                              name: 'kWH pro Jahr im Standby Betrieb',
                              color: Colors.red,
                              dataSource: [
                                DeviceData('Kochen und Backen', 8.8, 26.3, icon: Icons.kitchen),
                                DeviceData('Spülen', 4.4, 17.5, icon: Icons.wash),
                                DeviceData('Kleingeräte', 9.6, 17.5, icon: Icons.devices_other),
                                DeviceData('Waschen und Trocknen', 11.1, 26.3, icon: Icons.local_laundry_service),
                                DeviceData('Kühlen und Gefrieren', 8.8, 26.3, icon: Icons.ac_unit),
                                DeviceData('Beleuchtung', 3.5, 26.3, icon: Icons.lightbulb_outline),
                              ],
                              xValueMapper: (DeviceData data, _) => data.category,
                              lowValueMapper: (DeviceData data, _) => data.minWatt,
                              highValueMapper: (DeviceData data, _) => data.maxWatt,
                        dataLabelMapper: (DeviceData data, _) => data.category,
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.top,
                          textStyle: TextStyle(fontSize: 12),
                          builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                            Color iconColor = Colors.white;
                            return Icon(
                              data.icon,
                              color: iconColor,
                              size: 24,
                            );
                          },
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

class DeviceData {
  final String category;
  final double minWatt;
  final double maxWatt;
  final double minKwh;
  final double maxKwh;
  IconData icon;

  DeviceData(this.category, this.minWatt, this.maxWatt, {this.minKwh = 0, this.maxKwh = 0, IconData? icon})
      : this.icon = icon ?? Icons.device_unknown; // Provide a default icon if none is provided
}


void main() {
  runApp(MaterialApp(
    home: EnergyUsagePage(),
  ));
}
