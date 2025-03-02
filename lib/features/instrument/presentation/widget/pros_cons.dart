part of '../pages/instrument_detail.dart';

class ProsCons extends StatefulWidget {
  const ProsCons({super.key});

  @override
  State<ProsCons> createState() => _ProsConsState();
}

class _ProsConsState extends State<ProsCons>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.borderColor),
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppConst.prosCons,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    AppConst.pros,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                BlocBuilder<InstrumentBloc, InstrumentState>(
                  buildWhen: (previous, current) {
                    return (current is InstrumentLoading ||
                            current is InstrumentLoaded) &&
                        current is! InstrumentCurrentChart;
                  },
                  builder:
                      (_, state) => state.maybeMap(
                        currentChart: (value) => Text("Current chart"),

                        loaded:
                            (value) => _prosConsItem(
                              context: context,
                              info: value.bondDetail.prosAndCons?.pros ?? [],
                            ),
                        orElse: () => const SizedBox.shrink(),
                      ),
                ),

                const SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    AppConst.cons,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.brown,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                BlocBuilder<InstrumentBloc, InstrumentState>(
                  buildWhen: (previous, current) {
                    return (current is InstrumentLoading ||
                            current is InstrumentLoaded) &&
                        current is! InstrumentCurrentChart;
                  },
                  builder:
                      (_, state) => state.maybeMap(
                        loaded:
                            (value) => _prosConsItem(
                              context: context,
                              info: value.bondDetail.prosAndCons?.cons ?? [],
                              isPros: false,
                            ),
                        orElse: () => const SizedBox.shrink(),
                      ),
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _prosConsItem({
    required BuildContext context,
    required List<String> info,
    bool isPros = true,
  }) => ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemBuilder: (_, index) {
      final String title = info[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: SizedBox(
                height: 20,
                child: CircleAvatar(
                  backgroundColor:
                      isPros
                          ? AppColors.green.withValues(alpha: 0.12)
                          : AppColors.brown.withValues(alpha: 0.12),
                  child:
                      isPros
                          ? Icon(Icons.check, color: AppColors.green, size: 12)
                          : Text(
                            "!",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              color: AppColors.brown,
                              fontSize: 12,
                            ),
                          ),
                ),
              ),
            ),

            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.headerColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
    },
    separatorBuilder: (_, _) => const SizedBox(height: 24),
    itemCount: info.length,
  );
}
