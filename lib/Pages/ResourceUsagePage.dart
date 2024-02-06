import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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

class ElementItem {
  final int number;
  final String symbol;
  final String name;
  final String details;
  final Color color;

  ElementItem(this.number, this.symbol, this.name, this.details, this.color);
}