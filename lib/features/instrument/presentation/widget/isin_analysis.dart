part of '../pages/instrument_detail.dart';

class IsinAnalysis extends StatelessWidget {
  const IsinAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstrumentBloc, InstrumentState>(
      buildWhen:
          (previous, current) =>
              current is InstrumentLoading || current is InstrumentLoaded,
      builder:
          (_, state) => state.maybeMap(
            loading: (_) => const LoaderWidget(),
            loaded: (bond) {
              final BondDetail bondDetail = bond.bondDetail;
              final issuerDetail = bondDetail.issuerDetails;
              Map<String, dynamic> infoData = {
                AppConst.issuerName: issuerDetail?.issuerName,
                AppConst.issuerType: issuerDetail?.typeOfIssuer,
                AppConst.sector: issuerDetail?.sector,
                AppConst.industry: issuerDetail?.industry,
                AppConst.issuerNature: issuerDetail?.issuerNature,
                AppConst.cin: issuerDetail?.cin,
                AppConst.leadManager: issuerDetail?.leadManager,
                AppConst.registrar: issuerDetail?.registrar,
                AppConst.debentureTrustee: issuerDetail?.debentureTrustee,
              };
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    IssuerDetails(
                      bondDetail: bond.bondDetail,
                      issuerInfo: infoData,
                    ),
                    const SizedBox(height: 16),
                    ChartWidget(financialsModel: bond.bondDetail.financials),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            },
            orElse: () => SizedBox.fromSize(),
          ),
    );
  }
}
