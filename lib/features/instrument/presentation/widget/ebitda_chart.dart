part of '../pages/instrument_detail.dart';

class EbitdaChart extends StatelessWidget {
  const EbitdaChart({super.key, required this.ebitdaModel});
  final List<EbitdaModel>? ebitdaModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: bottomTitles,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: leftTitles,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  String text = "";
                  if (value == 2.0) {
                    text = "2024";
                  } else if (value == 3.0) {
                    text = " \t\t\t\t\t2025";
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 8, top: 4),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.subtitleColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },

                /// grid value
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            show: true,
            checkToShowHorizontalLine: (value) => value % 10 == 0,
            getDrawingHorizontalLine:
                (value) => FlLine(
                  color: AppColors.black.withValues(alpha: 0.1),
                  strokeWidth: 1,
                ),
            drawVerticalLine: true,
            verticalInterval: 0.26,
            checkToShowVerticalLine: (value) => value <= (0.26),
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: AppColors.black.withValues(alpha: 0.4),
                strokeWidth: 1,
                dashArray: [2],
              );
            },
          ),
          borderData: FlBorderData(show: false),
          maxY: getMaxY(),
          barGroups:
              ebitdaModel
                  ?.map(
                    (dataItem) => BarChartGroupData(
                      x: ebitdaModel?.indexOf(dataItem) ?? 0,

                      barsSpace: 4,
                      barRods: [
                        BarChartRodData(
                          toY: (dataItem.value ?? 0).toDouble(),
                          width: 15,
                          color: AppColors.textColor,
                          borderRadius: BorderRadius.circular(4),

                          rodStackItems: [
                            BarChartRodStackItem(
                              (dataItem.value ?? 0).toDouble() / 1.5,
                              (dataItem.value ?? 0).toDouble(),
                              const Color.fromARGB(255, 190, 209, 251),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  double getMaxY() {
    double max = 0.0;
    for (int i = 0; i < (ebitdaModel ?? []).length - 1; i++) {
      if ((ebitdaModel![i].value ?? 0) > (ebitdaModel![i + 1].value ?? 0)) {
        max = (ebitdaModel![i].value ?? 0).toDouble();
      }
    }
    return max * 1.1;
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'J';
      case 1:
        text = 'F';
      case 2:
        text = 'M';
      case 3:
        text = 'A';
      case 4:
        text = 'M';
      case 5:
        text = 'J';
      case 6:
        text = 'J';
      case 7:
        text = 'A';
      case 8:
        text = 'S';
      case 9:
        text = 'O';
      case 10:
        text = 'N';
      case 11:
        text = 'D';
      default:
        text = '';
    }
    return SideTitleWidget(meta: meta, child: Text(text, style: style));
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return const SizedBox.shrink();
    }
    const style = TextStyle(fontSize: 10);
    return SideTitleWidget(
      meta: meta,
      child: Text(meta.formattedValue, style: style),
    );
  }
}
