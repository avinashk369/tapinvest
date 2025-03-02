library;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tapinvest/core/utils/app_colors.dart';
import 'package:tapinvest/core/utils/app_const.dart';
import 'package:tapinvest/features/home/data/model/bonds_model.dart';
import 'package:tapinvest/features/home/presentation/bloc/home_bloc.dart';
import 'package:tapinvest/routes/route_const.dart';
import 'package:tapinvest/utils/debouncer.dart';
import 'package:tapinvest/widgets/custom_input.dart';
import 'package:tapinvest/widgets/highlighted_text.dart';
import 'package:tapinvest/widgets/image_holder.dart';
import 'package:tapinvest/widgets/loader_widget.dart';
part '../widget/search_widget.dart';
part '../widget/bonds_list.dart';
part '../widget/bond_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textEditingController;
  final debouncer = Debouncer(delay: 500);

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<HomeBloc>()..add(LoadBonds()),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          scrolledUnderElevation: 0,
          forceMaterialTransparency: true,
          title: Text(
            AppConst.home,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 26,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              // SliverAppBar(
              //   expandedHeight: 80,
              //   collapsedHeight: 80,
              //   backgroundColor: AppColors.bgColor,
              //   pinned: true,
              //   elevation: 0,
              //   scrolledUnderElevation: 0,
              //   flexibleSpace: Align(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       AppConst.home,
              //       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              //         fontWeight: FontWeight.w600,
              //         fontSize: 26,
              //       ),
              //     ),
              //   ),
              // ),
              SliverList(
                delegate: SliverChildListDelegate([
                  /// search widget
                  Builder(
                    builder: (context) {
                      return SearchWidget(
                        textEditingController: textEditingController,
                        onChange: (val) {
                          debouncer.run(() {
                            context.read<HomeBloc>().add(
                              SearchBonds(search: val),
                            );
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  /// list title
                  Text(
                    AppConst.header.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.subtitleColor,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),

                  /// bonds list
                  BlocBuilder<HomeBloc, HomeState>(
                    builder:
                        (_, state) => state.maybeMap(
                          loading: (_) => const LoaderWidget(),
                          loaded:
                              (state) => BondsList(
                                bonds: state.filterBonds,
                                searchText: textEditingController.text,
                                onTap:
                                    () => Navigator.of(
                                      context,
                                    ).pushNamed(RouteConst.bondDetail),
                              ),
                          orElse: () => const SizedBox.shrink(),
                        ),
                  ),
                  const SizedBox(height: 16),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
