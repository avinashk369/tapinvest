part of '../pages/instrument_detail.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key, required this.financialsModel});
  final FinancialsModel? financialsModel;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppConst.companyFinancials.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.subtitleColor,
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0XFFE5E5E5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            HapticFeedback.mediumImpact();
                            context.read<InstrumentBloc>().add(
                              ChangeChart(chartType: ChartType.ebitda),
                            );
                          },
                          child: BlocBuilder<InstrumentBloc, InstrumentState>(
                            buildWhen:
                                (previous, current) =>
                                    current is InstrumentCurrentChart ||
                                    current is InstrumentLoaded,
                            builder: (_, state) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                  color:
                                      ((state is InstrumentCurrentChart &&
                                                  state.chartType ==
                                                      ChartType.ebitda) ||
                                              state is InstrumentLoaded)
                                          ? AppColors.white
                                          : AppColors.borderColor,

                                  /// should change on state
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    AppConst.ebitda.toUpperCase(),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          ((state is InstrumentCurrentChart &&
                                                      state.chartType ==
                                                          ChartType.ebitda) ||
                                                  state is InstrumentLoaded)
                                              ? AppColors.textColor
                                              : AppColors.subtitleColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            HapticFeedback.mediumImpact();
                            context.read<InstrumentBloc>().add(
                              ChangeChart(chartType: ChartType.revenue),
                            );
                          },
                          child: BlocBuilder<InstrumentBloc, InstrumentState>(
                            buildWhen:
                                (previous, current) =>
                                    current is InstrumentCurrentChart ||
                                    current is InstrumentLoaded,
                            builder: (_, state) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color:
                                      (state is InstrumentCurrentChart &&
                                              state.chartType ==
                                                  ChartType.revenue)
                                          ? AppColors.white
                                          : AppColors.borderColor,

                                  /// should change on state
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    AppConst.revenue,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          (state is InstrumentCurrentChart &&
                                                  state.chartType ==
                                                      ChartType.revenue)
                                              ? AppColors.textColor
                                              : AppColors.subtitleColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// main chart
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<InstrumentBloc, InstrumentState>(
              buildWhen:
                  (previous, current) =>
                      current is InstrumentCurrentChart ||
                      current is InstrumentLoaded,
              builder: (context, state) {
                return ((state is InstrumentCurrentChart &&
                            state.chartType == ChartType.ebitda) ||
                        state is InstrumentLoaded)
                    ? EbitdaChart(ebitdaModel: financialsModel?.ebitda)
                    : RevenueChart(revenueModel: financialsModel?.revenue);
              },
            ),
          ),
        ],
      ),
    );
  }
}
