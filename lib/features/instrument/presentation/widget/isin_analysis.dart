part of '../pages/instrument_detail.dart';

class IsinAnalysis extends StatelessWidget {
  const IsinAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstrumentBloc, InstrumentState>(
      buildWhen: (previous, current) => current is InstrumentLoaded,
      builder: (context, state) {
        return state.maybeMap(
          loaded: (value) {
            final issuerDetail = value.bondDetail.issuerDetails;
            final bondDetail = value.bondDetail;

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
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  ChartWidget(financialsModel: bondDetail.financials),
                  const SizedBox(height: 16),
                  IssuerDetails(bondDetail: bondDetail, issuerInfo: infoData),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
