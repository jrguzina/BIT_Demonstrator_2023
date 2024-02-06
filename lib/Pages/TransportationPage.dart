import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bit_dem_1/Elements/Tile.dart';


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
