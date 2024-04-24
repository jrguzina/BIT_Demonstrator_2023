import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:info_widget/info_widget.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class SmartHomeResourcePage extends StatelessWidget {
  const SmartHomeResourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ressourcen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
            const Text(
              'Ressourcenverwendung und damit verbundene Umweltauswirkungen',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),InfoWidget(infoText: 'Smart-Home-Geräte bestehen aus einer Vielzahl von Materialien, darunter Kunststoffe, Metalle wie Kupfer und Aluminium sowie seltene Erden. Die Gewinnung dieser Materialien kann umweltschädlich sein, insbesondere wenn sie nicht verantwortungsbewusst abgebaut werden. In einer Darstellung werden die Ressourcenanteile durch Containergrößen und die Umweltbelastung durch Farbcodes veranschaulicht.',
                iconData: Icons.help, iconColor: Colors.lightBlue)],),
            const SizedBox(height: 20.0),

            const Expanded(
              child: TreemapRangeColorMappingSample(),
            ),
          ],
        ),
      ),
    );
  }
}

class TreemapRangeColorMappingSample extends StatefulWidget {
  const TreemapRangeColorMappingSample({Key? key}) : super(key: key);

  @override
  _TreemapRangeColorMappingSampleState createState() => _TreemapRangeColorMappingSampleState();
}

class _TreemapRangeColorMappingSampleState extends State<TreemapRangeColorMappingSample> {
  late List<_ResourceDetails> _resourceDetailsList;
  late List<TreemapColorMapper> _colorMappers;
  late bool isDesktop;
  bool _isBoxMaximized = false;
  int _selectedBoxIndex = -1;

  @override
  void initState() {
    super.initState();
    _resourceDetailsList = <_ResourceDetails>[
      _ResourceDetails(
          resourceName: 'Aluminium',
          usagePercentage: 15,
          environmentalImpact: 3,
          environmentalImpactText: 'Mittel, Hauptabbau oft durch Strip-Mining, was erhebliche ökologische Schäden verursachen kann.',
          recyclingScore: 8,
          description: 'Leichtmetall, oft in Gehäusen verwendet.',
          country: 'Australien',
          miningConditions: 'Großteil aus offenem Abbau, umweltregulierte Verfahren.',
          productionDetails: 'Hauptsächlich mittels Elektrolyse verarbeitet.',
          recyclability: 'Hoch recycelbar, kann ohne großen Qualitätsverlust wiederverwertet werden.',
          imagePath: 'assets/aluminium.jpg' // Pfad zum Bild
      ),
      _ResourceDetails(
          resourceName: 'Silizium',
          usagePercentage: 25,
          environmentalImpact: 2,
          environmentalImpactText: 'Niedrig, aus Sand gewonnen, jedoch energieintensive Reinigung.',
          recyclingScore: 6,
          description: 'Hauptbestandteil von Mikrochips und Sensoren.',
          country: 'China',
          miningConditions: 'Aus Sand gewonnen, mit hohen Energieanforderungen bei der Verarbeitung.',
          productionDetails: 'Reinigung und Kristallisierung sind energieintensiv.',
          recyclability: 'Mäßig recycelbar, Recyclingprozesse oft energieintensiv.',
          imagePath: 'assets/silizium.jpeg' // Pfad zum Bild
      ),
      _ResourceDetails(
          resourceName: 'Kupfer',
          usagePercentage: 20,
          environmentalImpact: 3,
          environmentalImpactText: 'Mittel, Abbau und Verarbeitung verbrauchen viel Wasser und Energie.',
          recyclingScore: 9,
          description: 'Wichtig für elektrische Verbindungen und Kabel.',
          country: 'Chile',
          miningConditions: 'Größtenteils aus Tagebau, hoher Wasser- und Energieverbrauch.',
          productionDetails: 'Schmelzen und Raffinieren, strenge Umweltstandards.',
          recyclability: 'Sehr gut recycelbar, häufig wiederverwendet.',
          imagePath: 'assets/kupfer.jpg' // Pfad zum Bild
      ),
      _ResourceDetails(
          resourceName: 'Glas',
          usagePercentage: 10,
          environmentalImpact: 2,
          environmentalImpactText: 'Niedrig, Hauptrohstoff Sand ist reichlich vorhanden, aber energieintensive Schmelzprozesse.',
          recyclingScore: 7,
          description: 'Verwendet in Displays und Sensoren.',
          country: 'USA',
          miningConditions: 'Hergestellt aus Quarzsand, relativ geringe Umweltauswirkungen.',
          productionDetails: 'Schmelzen bei hohen Temperaturen, hoher Energieverbrauch.',
          recyclability: 'Gut recycelbar, meist ohne Qualitätsverlust.',
          imagePath: 'assets/glas.jpg' // Pfad zum Bild
      ),
      _ResourceDetails(
          resourceName: 'Kunststoff',
          usagePercentage: 20,
          environmentalImpact: 4,
          environmentalImpactText: 'Mittel bis hoch, abgeleitet von Erdöl, chemische Verarbeitung verursacht Emissionen und Abfall.',
          recyclingScore: 3,
          description: 'Vielfältig eingesetzt für Gehäuse und Komponenten.',
          country: 'Deutschland',
          miningConditions: 'Abgeleitet von Erdöl, chemische Verarbeitung.',
          productionDetails: 'Polymerisation in großen industriellen Anlagen.',
          recyclability: 'Recyclingfähigkeit variiert stark; oft schwer zu recyceln.',
          imagePath: 'assets/kunststoff.jpg' // Pfad zum Bild
      ),
      _ResourceDetails(
          resourceName: 'Eisen',
          usagePercentage: 5,
          environmentalImpact: 3,
          environmentalImpactText: 'Mittel, große Mengen an Energie für die Verhüttung notwendig, oft verbunden mit Umweltverschmutzung.',
          recyclingScore: 8,
          description: 'Wird in einigen Komponenten und als strukturelles Material verwendet.',
          country: 'Brasilien',
          miningConditions: 'Meist aus Tagebau, bedeutende Umweltauswirkungen durch Abholzung.',
          productionDetails: 'Verhüttung unter Einsatz von Kohle, hohe CO2-Emissionen.',
          recyclability: 'Gut recycelbar, hohe Recyclingrate.',
          imagePath: 'assets/eisen.jpg' // Pfad zum Bild
      ),
      _ResourceDetails(
          resourceName: 'Gold',
          usagePercentage: 3,
          environmentalImpact: 6,
          environmentalImpactText: 'Hoch, aufgrund des energieintensiven Abbaus tief unter der Erde und chemischer Verarbeitung.',
          recyclingScore: 9,
          description: 'Verwendet in hochwertigen elektrischen Verbindungen.',
          country: 'Südafrika',
          miningConditions: 'Untertagebau mit hohem Energieverbrauch und Umweltauswirkungen.',
          productionDetails: 'Hochwertige Verarbeitung, hohe Reinheit erforderlich.',
          recyclability: 'Hoch recycelbar, häufig wiedergewonnen aus Altgeräten.',
          imagePath: 'assets/gold.jpg' // Pfad zum Bild
      ),
      _ResourceDetails(
          resourceName: 'Silber',
          usagePercentage: 2,
          environmentalImpact: 5,
          environmentalImpactText: 'Mittel bis hoch, ähnliche Probleme wie bei Gold, jedoch weniger intensiv.',
          recyclingScore: 7,
          description: 'Ebenfalls in elektrischen Verbindungen und Leiterplatten eingesetzt.',
          country: 'Mexiko',
          miningConditions: 'Ähnlich wie bei Gold, jedoch mit geringerer ökologischer Bedeutung.',
          productionDetails: 'Raffination oft zusammen mit Gold.',
          recyclability: 'Hoch recycelbar, oft aus alten Geräten zurückgewonnen.',
          imagePath: 'assets/silber.jpg' // Pfad zum Bild
      ),
      _ResourceDetails(
          resourceName: 'Lithium',
          usagePercentage: 10,
          environmentalImpact: 7,
          environmentalImpactText: 'Hoch, problematische Gewinnung aus Salzseen beeinträchtigt lokale Ökosysteme.',
          recyclingScore: 4,
          description: 'Wichtig für Batterien in mobilen Smart-Home-Geräten.',
          country: 'Bolivien',
          miningConditions: 'Gewinnung aus Salzseen, problematisch hinsichtlich Wasserverbrauch.',
          productionDetails: 'Elektrolytische Verarbeitung erforderlich.',
          recyclability: 'Schwierig zu recyceln, aufgrund von Sicherheits- und Wirtschaftlichkeitsaspekten.',
          imagePath: 'assets/lithium.jpg' // Pfad zum Bild
      ),
      _ResourceDetails(
          resourceName: 'Zinn',
          usagePercentage: 5,
          environmentalImpact: 4,
          environmentalImpactText: 'Mittel, Abbau oft durch offenen Tagebau, führt zu erheblichen Umweltbelastungen.',
          recyclingScore: 6,
          description: 'Verwendet in Lötmitteln auf Leiterplatten.',
          country: 'Indonesien',
          miningConditions: 'Hauptsächlich Tagebau, führt zu erheblichen Umweltbelastungen.',
          productionDetails: 'Schmelzverfahren häufig mit umweltfreundlichen Technologien.',
          recyclability: 'Mäßig recycelbar, oft in speziellen Anlagen verarbeitet.',
          imagePath: 'assets/zinn.jpg' // Pfad zum Bild
      ),
    ];


    _colorMappers = <TreemapColorMapper>[
      TreemapColorMapper.range(from: 1, to: 3, color: Colors.green, name: 'Niedrig'),
      TreemapColorMapper.range(from: 4, to: 6, color: Colors.orange, name: 'Mittel'),
      TreemapColorMapper.range(from: 7, to: 10, color: Colors.red, name: 'Hoch'),
    ];
  }

  Color _getColorForImpact(int impact) {
    if (impact <= 3) {
      return Colors.green;
    } else if (impact <= 6) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  Color _getColorForRecycling(int score) {
    if (score >= 7) {
      return Colors.green;
    } else if (score >= 4) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  List<Widget> getImagesForDetails(int selectedIndex) {
    List<Widget> images = [];
    double iconSize = 96.0;
    if (_resourceDetailsList[selectedIndex].environmentalImpact >= 7) {
      images.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/umwelt.jpg',
              width: iconSize,
              height: iconSize,
              fit: BoxFit.cover,
            ),
          )
      );
    }
    if (_resourceDetailsList[selectedIndex].recyclingScore >= 7) {
      images.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/recycling.jpg',
              width: iconSize,
              height: iconSize,
              fit: BoxFit.cover,
            ),
          )
      );
    }
    return images;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    isDesktop = kIsWeb || themeData.platform == TargetPlatform.macOS || themeData.platform == TargetPlatform.linux || themeData.platform == TargetPlatform.windows;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Padding(
            padding: MediaQuery.of(context).orientation == Orientation.portrait || isDesktop ? const EdgeInsets.all(12.5) : const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[

                _buildLegend(_colorMappers),
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SfTreemap(
                          dataCount: _resourceDetailsList.length,
                          weightValueMapper: (int index) {
                            return _resourceDetailsList[index].usagePercentage;
                          },
                          colorMappers: _colorMappers,
                          levels: <TreemapLevel>[
                            TreemapLevel(
                              groupMapper: (int index) => _resourceDetailsList[index].resourceName,
                              colorValueMapper: (TreemapTile tile) => _resourceDetailsList[tile.indices[0]].environmentalImpact,
                              labelBuilder: (BuildContext context, TreemapTile tile) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedBoxIndex = tile.indices[0];
                                      _isBoxMaximized = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          color: Colors.grey[300],
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              '${tile.group} (${_resourceDetailsList[tile.indices[0]].usagePercentage}%)',  // Ressourcenname mit Nutzungsanteil
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: _getColorForImpact(_resourceDetailsList[tile.indices[0]].environmentalImpact),
                                                    border: Border(right: BorderSide(width: 1, color: Colors.black)), // Schwarze Linie rechts
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Text(
                                                      'Umweltbelastung: ${_resourceDetailsList[tile.indices[0]].environmentalImpact}',
                                                      style: TextStyle(color: Colors.white),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  color: _getColorForRecycling(_resourceDetailsList[tile.indices[0]].recyclingScore),
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Text(
                                                      'Recyclingfähigkeit: ${_resourceDetailsList[tile.indices[0]].recyclingScore}',
                                                      style: TextStyle(color: Colors.white),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      if (_isBoxMaximized)
                        Positioned.fill(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isBoxMaximized = false;
                              });
                            },
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Card(
                                  elevation: 4.0,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,  // Zentriert die Kinder vertikal
                                    children: [
                                      Expanded(
                                        flex: 3,  // Nimmt mehr Platz für die Details
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Details',
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Stack(
                                                children: [
                                                  Column(
                                                    children: [
                                                      // Der eigentliche Text bleibt an seiner ursprünglichen Position
                                                      _detailRow('Ressource:', '${_resourceDetailsList[_selectedBoxIndex].resourceName}'),
                                                      _detailRow('Nutzungsanteil:', '${_resourceDetailsList[_selectedBoxIndex].usagePercentage}%'),
                                                      _detailRow('Umweltbelastung:', '${_resourceDetailsList[_selectedBoxIndex].environmentalImpactText}'),
                                                      _detailRow('Recyclingfähigkeit:', '${_resourceDetailsList[_selectedBoxIndex].recyclability}'),
                                                      _detailRow('Beschreibung:', '${_resourceDetailsList[_selectedBoxIndex].description}'),
                                                      _detailRow('Herkunftsland:', '${_resourceDetailsList[_selectedBoxIndex].country}'),
                                                      _detailRow('Rohstoffgewinnung:', '${_resourceDetailsList[_selectedBoxIndex].miningConditions}'),
                                                      _detailRow('Weiterverarbeitung:', '${_resourceDetailsList[_selectedBoxIndex].productionDetails}'),
                                                    ],
                                                  ),
                                                  Positioned(
                                                    top: 0,  // Positioniert die Bilder oben in der Spalte
                                                    left: 0,
                                                    child: Column(
                                                      children: getImagesForDetails(_selectedBoxIndex),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _isBoxMaximized = false;
                                                  });
                                                },
                                                child: const Text('Schließen'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,  // Weniger Platz für das Bild
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            _resourceDetailsList[_selectedBoxIndex].imagePath,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Text('Fehler beim Laden des Bildes');
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              ' ' + value, // Leerzeichen vor dem Wert hinzugefügt
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(List<TreemapColorMapper> colorMappers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: colorMappers.map((colorMapper) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 24,
                height: 24,
                color: colorMapper.color,
              ),
              const SizedBox(width: 8),
              Text(colorMapper.name ?? 'Unnamed'),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _ResourceDetails {
  const _ResourceDetails({
    required this.resourceName,
    required this.usagePercentage,
    required this.environmentalImpact,
    required this.environmentalImpactText,
    required this.recyclingScore,
    required this.description,
    required this.country,
    required this.miningConditions,
    required this.productionDetails,
    required this.recyclability,
    required this.imagePath, // Neues Feld für den Bildpfad
  });

  final String resourceName;
  final double usagePercentage;
  final int environmentalImpact;
  final String environmentalImpactText;
  final int recyclingScore;
  final String description;
  final String country;
  final String miningConditions;
  final String productionDetails;
  final String recyclability;
  final String imagePath; // Neues Feld
}