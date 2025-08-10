import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

class ReferralStepsTimelineWidget extends StatelessWidget {
  const ReferralStepsTimelineWidget({super.key});

  final List<Map<String, String>> steps = const [
    {
      'title': 'Invite your friends',
      'subtitle': 'Share your link or code',
    },
    {
      'title': 'Friends Join In',
      'subtitle': 'They join and enjoy benefits',
    },
    {
      'title': 'Earn Your Reward',
      'subtitle': 'Get rewarded instantly',
    },
  ];

  @override
  Widget build(final BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TimelineTheme(
        //* Node Alignment Config
        data: TimelineThemeData(
          nodePosition: 0.1,
          connectorTheme: ConnectorThemeData(
            color: Colors.grey.shade300,
            thickness: 1.5,
          ),
          indicatorTheme: const IndicatorThemeData(
            size: 42,
          ),
        ),
        child: FixedTimeline.tileBuilder(
          builder: TimelineTileBuilder.connected(
            itemCount: steps.length,
            connectionDirection: ConnectionDirection.before,
            contentsBuilder: (_, final index) {
              final step = steps[index];

              //* Body of the each node
              return Padding(
                padding: const EdgeInsets.only(left: 32, top: 15, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      step['subtitle']!,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },

            //* Indicator designs
            indicatorBuilder: (_, final index) => Indicator.widget(
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Color(0xFF6DDEA2),
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),
                ),
              ),
            ),

            //* Connector design between nodes
            connectorBuilder: (_, final index, final __) =>
                Connector.dashedLine(color: Colors.grey.shade400,
                  dash: 6,
                  gap: 8,),
          ),
        ),
      ),
    );
}
