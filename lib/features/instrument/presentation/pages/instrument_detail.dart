library;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tapinvest/core/utils/app_colors.dart';
import 'package:tapinvest/core/utils/app_const.dart';
import 'package:tapinvest/features/instrument/data/chart_type.dart';
import 'package:tapinvest/features/instrument/data/model/bond_detail.dart';
import 'package:tapinvest/features/instrument/data/model/ebitda_model.dart';
import 'package:tapinvest/features/instrument/data/model/financials_model.dart';
import 'package:tapinvest/features/instrument/data/model/revenue_model.dart';
import 'package:tapinvest/features/instrument/presentation/bloc/instrument_bloc.dart';
import 'package:tapinvest/widgets/image_holder.dart';
import 'package:tapinvest/widgets/loader_widget.dart';
part '../widget/instrument_info.dart';
part '../widget/issuer_details.dart';
part '../widget/pros_cons.dart';
part '../widget/chart_widget.dart';
part '../widget/isin_analysis.dart';
part '../widget/revenue_chart.dart';
part '../widget/ebitda_chart.dart';

@injectable
class InstrumentDetail extends StatefulWidget {
  const InstrumentDetail({super.key});

  @override
  State<InstrumentDetail> createState() => _InstrumentDetailState();
}

class _InstrumentDetailState extends State<InstrumentDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late List<Tab> _tabs;
  @override
  void initState() {
    _tabs = [Tab(text: AppConst.isinAnalysis), Tab(text: AppConst.prosConsTab)];

    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<InstrumentBloc>()..add(GetInstrument()),
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                scrolledUnderElevation: 0,
                leadingWidth: 80,
                leading: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back, color: Color(0XFF101828)),
                    ),
                  ),
                ),
                pinned: true,
                expandedHeight: MediaQuery.sizeOf(context).height * .3,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 16, right: 20),
                  child: FlexibleSpaceBar(
                    background: BlocBuilder<InstrumentBloc, InstrumentState>(
                      buildWhen:
                          (previous, current) =>
                              current is InstrumentLoading ||
                              current is InstrumentLoaded,
                      builder:
                          (_, state) => state.maybeMap(
                            loading: (_) => const LoaderWidget(),
                            loaded:
                                (bond) =>
                                    InstrumentInfo(bondDetail: bond.bondDetail),
                            orElse: () => SizedBox.fromSize(),
                          ),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(text: AppConst.isinAnalysis),
                      Tab(text: AppConst.prosConsTab),
                    ],
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    splashFactory: NoSplash.splashFactory,
                    labelColor: AppColors.arrowColor,
                    dividerColor: AppColors.dividerColor,
                    unselectedLabelColor: AppColors.subtitleColor,
                    labelStyle: Theme.of(context).textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                    unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: AppColors.arrowColor,
                    onTap:
                        (value) => context.read<InstrumentBloc>().add(
                          ChangeInstrumentTab(tabIndex: value),
                        ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 12)),
            ];
          },
          body: BlocBuilder<InstrumentBloc, InstrumentState>(
            buildWhen: (previous, current) => current is InstrumentLoaded,
            builder:
                (_, state) => state.maybeMap(
                  loaded: (value) {
                    final bondDetail = value.bondDetail;
                    return TabBarView(
                      controller: _tabController,
                      children: [
                        IsinAnalysis(bondDetail: bondDetail),
                        ProsCons(
                          pros: bondDetail.prosAndCons?.pros ?? [],
                          cons: bondDetail.prosAndCons?.cons ?? [],
                        ),
                      ],
                    );
                  },
                  orElse: () => const SizedBox.shrink(),
                ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.transparent, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
