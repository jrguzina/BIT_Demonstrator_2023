import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';

class SmartHomeResourcePage extends StatelessWidget {
  const SmartHomeResourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ressourcen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Ressourcenverwendung und damit verbundene Umweltauswirkungen',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            FractionallySizedBox(
              widthFactor: 1.00,
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hintergrund:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Viele Smart-Home-Geräte enthalten Kunststoffe, Metalle (wie Kupfer und Aluminium), seltene Erden und manchmal auch wertvolle Metalle wie Gold. Die Gewinnung dieser Materialien kann umweltschädlich sein, insbesondere wenn sie nicht verantwortungsbewusst abgebaut werden.',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
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
  _TreemapRangeColorMappingSampleState createState() =>
      _TreemapRangeColorMappingSampleState();
}

class _TreemapRangeColorMappingSampleState
    extends State<TreemapRangeColorMappingSample> {
  late List<_ResourceDetails> _resourceDetailsList;
  late List<TreemapColorMapper> _colorMappers;
  late bool _isLightTheme;
  late bool isDesktop;

  @override
  void initState() {
    _resourceDetailsList = <_ResourceDetails>[
      const _ResourceDetails(
        resourceName: 'Aluminium',
        usagePercentage: 15,
        environmentalImpact: 3,
        description: 'Leichtmetall, oft in Gehäusen verwendet.',
      ),
      const _ResourceDetails(
        resourceName: 'Silizium',
        usagePercentage: 25,
        environmentalImpact: 2,
        description: 'Hauptbestandteil von Mikrochips und Sensoren.',
      ),
      const _ResourceDetails(
        resourceName: 'Kupfer',
        usagePercentage: 20,
        environmentalImpact: 3,
        description: 'Wichtig für elektrische Verbindungen und Kabel.',
      ),
      const _ResourceDetails(
        resourceName: 'Glas',
        usagePercentage: 10,
        environmentalImpact: 2,
        description: 'Verwendet in Displays und Sensoren.',
      ),
      const _ResourceDetails(
        resourceName: 'Kunststoff',
        usagePercentage: 20,
        environmentalImpact: 4,
        description: 'Vielfältig eingesetzt für Gehäuse und Komponenten.',
      ),
      const _ResourceDetails(
        resourceName: 'Eisen',
        usagePercentage: 5,
        environmentalImpact: 3,
        description: 'Wird in einigen Komponenten und als strukturelles Material verwendet.',
      ),
      const _ResourceDetails(
        resourceName: 'Gold',
        usagePercentage: 3,
        environmentalImpact: 6,
        description: 'Verwendet in hochwertigen elektrischen Verbindungen.',
      ),
      const _ResourceDetails(
        resourceName: 'Silber',
        usagePercentage: 2,
        environmentalImpact: 5,
        description: 'Ebenfalls in elektrischen Verbindungen und Leiterplatten eingesetzt.',
      ),
      const _ResourceDetails(
        resourceName: 'Lithium',
        usagePercentage: 10,
        environmentalImpact: 7,
        description: 'Wichtig für Batterien in mobilen Smart-Home-Geräten.',
      ),
      const _ResourceDetails(
        resourceName: 'Zinn',
        usagePercentage: 5,
        environmentalImpact: 4,
        description: 'Verwendet in Lötmitteln auf Leiterplatten.',
      ),
    ];

    _colorMappers = <TreemapColorMapper>[
      TreemapColorMapper.range(
        from: 1,
        to: 3,
        color: Colors.green,
        name: 'Niedrig',
      ),
      TreemapColorMapper.range(
        from: 4,
        to: 6,
        color: Colors.yellow,
        name: 'Mittel',
      ),
      TreemapColorMapper.range(
        from: 7,
        to: 10,
        color: Colors.red,
        name: 'Hoch',
      ),
    ];

    super.initState();
  }

  @override
  void dispose() {
    _resourceDetailsList.clear();
    _colorMappers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    _isLightTheme = themeData.colorScheme.brightness == Brightness.light;
    isDesktop = kIsWeb ||
        themeData.platform == TargetPlatform.macOS ||
        themeData.platform == TargetPlatform.linux ||
        themeData.platform == TargetPlatform.windows;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size size = Size(constraints.maxWidth, constraints.maxHeight);
        return Center(
          child: Padding(
            padding: MediaQuery
                .of(context)
                .orientation == Orientation.portrait ||
                isDesktop
                ? const EdgeInsets.all(12.5)
                : const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20), // Adjusted spacing here
                Text(
                  'Ressourcenanteile dargestellt durch Containergröße, Umweltbelastung dargestellt durch Farbcodes.',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10), // Adjusted spacing here
                _buildLegend(_colorMappers),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SfTreemap(
                      dataCount: _resourceDetailsList.length,
                      weightValueMapper: (int index) {
                        return _resourceDetailsList[index].usagePercentage;
                      },
                      tooltipSettings: TreemapTooltipSettings(
                        color: _isLightTheme
                            ? const Color.fromRGBO(45, 45, 45, 1)
                            : const Color.fromRGBO(242, 242, 242, 1),
                      ),
                      colorMappers: _colorMappers,
                      levels: <TreemapLevel>[
                        TreemapLevel(
                          groupMapper: (int index) =>
                          _resourceDetailsList[index].resourceName,
                          colorValueMapper: (TreemapTile tile) =>
                          _resourceDetailsList[tile.indices[0]]
                              .environmentalImpact,
                          labelBuilder:
                              (BuildContext context, TreemapTile tile) {
                            final Brightness brightness =
                            ThemeData.estimateBrightnessForColor(
                                tile.color);
                            final Color color = brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black;
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                tile.group,
                                style: themeData.textTheme.bodyText1!.copyWith(
                                  fontSize: 12,
                                  color: color,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                          tooltipBuilder:
                              (BuildContext context, TreemapTile tile) {
                            final _ResourceDetails resourceDetails =
                            _resourceDetailsList[tile.indices[0]];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Ressource: ' + resourceDetails.resourceName,
                                  style: themeData.textTheme.bodyText1!
                                      .copyWith(
                                    height: 1.5,
                                    color: _isLightTheme
                                        ? const Color.fromRGBO(255, 255, 255, 1)
                                        : const Color.fromRGBO(10, 10, 10, 1),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '\nNutzungsanteil: ${resourceDetails.usagePercentage}%',
                                      style: themeData.textTheme.bodyText1!
                                          .copyWith(
                                        color: _isLightTheme
                                            ? const Color.fromRGBO(
                                            255, 255, 255, 1)
                                            : const Color.fromRGBO(
                                            10, 10, 10, 1),
                                      ),
                                    ),
                                    TextSpan(
                                      text: '\nUmweltbelastung: ${resourceDetails.environmentalImpact}',
                                      style: themeData.textTheme.bodyText1!
                                          .copyWith(
                                        color: _isLightTheme
                                            ? const Color.fromRGBO(
                                            255, 255, 255, 1)
                                            : const Color.fromRGBO(
                                            10, 10, 10, 1),
                                      ),
                                    ),
                                    TextSpan(
                                      text: '\nBeschreibung: ${resourceDetails.description}',
                                      style: themeData.textTheme.bodyText1!
                                          .copyWith(
                                        color: _isLightTheme
                                            ? const Color.fromRGBO(
                                            255, 255, 255, 1)
                                            : const Color.fromRGBO(
                                            10, 10, 10, 1),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
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
            SizedBox(width: 8),
            Text(colorMapper.name ?? 'Unnamed'), // Using null-aware operator and providing a default value
          ],
        ),
      );
    }).toList(),
  );
}

class _ResourceDetails {
  const _ResourceDetails({
    required this.resourceName,
    required this.usagePercentage,
    required this.environmentalImpact,
    required this.description,
  });

  final String resourceName;
  final double usagePercentage;
  final int environmentalImpact;
  final String description;
}
