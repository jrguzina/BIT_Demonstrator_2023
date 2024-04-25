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
            ),InfoWidget(infoText: 'Smart-Home-Geräte bestehen aus einer Vielzahl von Materialien, darunter Kunststoffe, Metalle wie Kupfer und Aluminium sowie seltene Erden. Die Gewinnung dieser Materialien kann umweltschädlich sein, insbesondere wenn sie nicht verantwortungsbewusst abgebaut und weiterverarbeitet werden. Ein weiterer wichtiger Aspekt ist die Tauglichkeit zur Wiederverwendung der einzelnen Materialen, wenn Smart-Home-Geräte am Ende ihres Lebenszyklus recycelt werden sollen. In einer Darstellung werden die Anteile der verschiedenen Ressourcen durch die Größe der Behälter und die Umweltbelastung sowie Recyclingfähigkeit durch ein Farbsystem, ähnlich einem Ampelsystem, illustriert werden.',
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
          environmentalImpact: 4,
          recyclingScore: 9,
          environmentalImpactText: 'Die Herstellung von Aluminium ist energieintensiv, aber das Material selbst hat eine relativ geringe Umweltauswirkung bei korrekter Verwaltung.',
          recyclability: 'Aluminium ist sehr gut recycelbar und verliert dabei kaum an Qualität.',
          description: 'Leichtmetall, oft in Gehäusen verwendet.',
          country: 'Australien',
          miningConditions: 'Großteil aus offenem Abbau, umweltregulierte Verfahren.',
          productionDetails: 'Hauptsächlich mittels Elektrolyse verarbeitet.',
          imagePath: 'assets/aluminium.jpg'
      ),
      _ResourceDetails(
          resourceName: 'Silizium',
          usagePercentage: 10,
          environmentalImpact: 3,
          recyclingScore: 4,
          environmentalImpactText: 'Die Herstellung von hochreinem Silizium für Elektronik kann umweltbelastend sein, die Auswirkungen sind jedoch geringer als bei vielen anderen Metallen.',
          recyclability: 'Die Wiederverwertung von Silizium, insbesondere aus Halbleitermaterial, ist technisch möglich, aber oft nicht wirtschaftlich.',
          description: 'Hauptbestandteil von Mikrochips und Sensoren.',
          country: 'China',
          miningConditions: 'Aus Sand gewonnen, mit hohen Energieanforderungen bei der Verarbeitung.',
          productionDetails: 'Reinigung und Kristallisierung sind energieintensiv.',
          imagePath: 'assets/silizium.jpeg'
      ),
      _ResourceDetails(
          resourceName: 'Kupfer',
          usagePercentage: 15,
          environmentalImpact: 5,
          recyclingScore: 8,
          environmentalImpactText: 'Kupferbergbau und -verarbeitung können umweltschädlich sein, aber das Material ist essentiell für elektrische Anwendungen.',
          recyclability: 'Kupfer lässt sich sehr gut recyceln, was seinen Lebenszyklus verlängert.',
          description: 'Wichtig für elektrische Verbindungen und Kabel.',
          country: 'Chile',
          miningConditions: 'Größtenteils aus Tagebau, hoher Wasser- und Energieverbrauch.',
          productionDetails: 'Schmelzen und Raffinieren, strenge Umweltstandards.',
          imagePath: 'assets/kupfer.jpg'
      ),
      _ResourceDetails(
          resourceName: 'Glas',
          usagePercentage: 5,
          environmentalImpact: 3,
          recyclingScore: 7,
          environmentalImpactText: 'Glasproduktion ist energieintensiv, hat aber geringere chemische Risiken.',
          recyclability: 'Glas ist gut recycelbar, jedoch kann die Qualität durch Verunreinigungen beeinträchtigt werden.',
          description: 'Verwendet in Displays und Sensoren.',
          country: 'USA',
          miningConditions: 'Hergestellt aus Quarzsand, relativ geringe Umweltauswirkungen.',
          productionDetails: 'Schmelzen bei hohen Temperaturen, hoher Energieverbrauch.',
          imagePath: 'assets/glas.jpg'
      ),
      _ResourceDetails(
          resourceName: 'Kunststoff',
          usagePercentage: 35,
          environmentalImpact: 7,
          recyclingScore: 3,
          environmentalImpactText: 'Kunststoffe können erhebliche Umweltauswirkungen haben, insbesondere wenn sie aus Erdöl hergestellt werden und nicht biologisch abbaubar sind.',
          recyclability: 'Viele Kunststoffe sind schwer zu recyceln, vor allem aufgrund der Vielfalt der Polymertypen und der oft vorhandenen Zusätze.',
          description: 'Vielfältig eingesetzt für Gehäuse und Komponenten.',
          country: 'Deutschland',
          miningConditions: 'Abgeleitet von Erdöl, chemische Verarbeitung.',
          productionDetails: 'Polymerisation in großen industriellen Anlagen.',
          imagePath: 'assets/kunststoff.jpg'
      ),
      _ResourceDetails(
          resourceName: 'Eisen',
          usagePercentage: 7,
          environmentalImpact: 5,
          recyclingScore: 9,
          environmentalImpactText: 'Eisenherstellung, insbesondere Stahl, kann erhebliche Umweltauswirkungen haben, hauptsächlich durch Energieverbrauch und Emissionen.',
          recyclability: 'Eisen und Stahl sind sehr gut recycelbar und werden oft in großen Mengen wiederverwertet.',
          description: 'Wird in einigen Komponenten und als strukturelles Material verwendet.',
          country: 'Brasilien',
          miningConditions: 'Meist aus Tagebau, bedeutende Umweltauswirkungen durch Abholzung.',
          productionDetails: 'Verhüttung unter Einsatz von Kohle, hohe CO2-Emissionen.',
          imagePath: 'assets/eisen.jpg'
      ),
      _ResourceDetails(
          resourceName: 'Gold',
          usagePercentage: 3,
          environmentalImpact: 9,
          recyclingScore: 10,
          environmentalImpactText: 'Ähnlich wie bei Silber ist der Goldabbau extrem umweltschädlich, oft verbunden mit giftigen Chemikalien wie Quecksilber und Cyanid.',
          recyclability: 'Gold ist ausgezeichnet recycelbar und behält dabei seine Qualität bei.',
          description: 'Verwendet in hochwertigen elektrischen Verbindungen.',
          country: 'Südafrika',
          miningConditions: 'Untertagebau mit hohem Energieverbrauch und Umweltauswirkungen.',
          productionDetails: 'Hochwertige Verarbeitung, hohe Reinheit erforderlich.',
          imagePath: 'assets/gold.jpg'
      ),
      _ResourceDetails(
          resourceName: 'Silber',
          usagePercentage: 3,
          environmentalImpact: 8,
          recyclingScore: 10,
          environmentalImpactText: 'Ähnlich wie bei Gold ist der Abbau von Silber oft mit hohen Umweltbelastungen und dem Einsatz gefährlicher Chemikalien verbunden.',
          recyclability: 'Silber ist sehr gut recycelbar und verliert kaum an Wert.',
          description: 'Ebenfalls in elektrischen Verbindungen und Leiterplatten eingesetzt.',
          country: 'Mexiko',
          miningConditions: 'Ähnlich wie bei Gold, jedoch mit geringerer ökologischer Bedeutung.',
          productionDetails: 'Raffination oft zusammen mit Gold.',
          imagePath: 'assets/silber.jpg'
      ),
      _ResourceDetails(
          resourceName: 'Lithium',
          usagePercentage: 4,
          environmentalImpact: 8,
          recyclingScore: 2,
          environmentalImpactText: 'Die Gewinnung von Lithium, vor allem durch Bergbau und die damit verbundenen Wassernutzung, kann erheblich umweltbelastend sein.',
          recyclability: 'Das Recycling von Lithium, insbesondere aus Batterien, ist technisch herausfordernd und nicht weit verbreitet.',
          description: 'Wichtig für Batterien in mobilen Smart-Home-Geräten.',
          country: 'Bolivien',
          miningConditions: 'Gewinnung aus Salzseen, problematisch hinsichtlich Wasserverbrauch.',
          productionDetails: 'Elektrolytische Verarbeitung erforderlich.',
          imagePath: 'assets/lithium.jpg'
      ),
      _ResourceDetails(
          resourceName: 'Zinn',
          usagePercentage: 3,
          environmentalImpact: 6,
          recyclingScore: 7,
          environmentalImpactText: 'Zinnabbau kann erhebliche ökologische Schäden verursachen, vor allem in Form von Boden- und Wasserverschmutzung.',
          recyclability: 'Zinn ist relativ gut recycelbar, besonders in Form von Zinnlot.',
          description: 'Verwendet in Lötmitteln auf Leiterplatten.',
          country: 'Indonesien',
          miningConditions: 'Hauptsächlich Tagebau, führt zu erheblichen Umweltbelastungen.',
          productionDetails: 'Schmelzverfahren häufig mit umweltfreundlichen Technologien.',
          imagePath: 'assets/zinn.jpg'
      ),
    ];


    _colorMappers = <TreemapColorMapper>[
      TreemapColorMapper.range(from: 1, to: 3, color: Colors.green, name: 'Gut'),
      TreemapColorMapper.range(from: 4, to: 6, color: Colors.orange, name: 'Mittel'),
      TreemapColorMapper.range(from: 7, to: 10, color: Colors.red, name: 'Schlecht'),
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
                                              '${tile.group} (${_resourceDetailsList[tile.indices[0]].usagePercentage}%)',
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
                                                    border: Border(right: BorderSide(width: 1, color: Colors.black)),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 3,
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
                                                    top: 0,
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
                                        flex: 1,
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
            child: Container(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                value,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
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
    required this.imagePath,
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
  final String imagePath;
}