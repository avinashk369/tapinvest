part of '../pages/instrument_detail.dart';

class IsinAnalysis extends StatefulWidget {
  const IsinAnalysis({super.key, required this.bondDetail});
  final BondDetail bondDetail;

  @override
  State<IsinAnalysis> createState() => _IsinAnalysisState();
}

class _IsinAnalysisState extends State<IsinAnalysis>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late Map<String, dynamic> infoData;
  @override
  void initState() {
    final issuerDetail = widget.bondDetail.issuerDetails;

    infoData = {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          ChartWidget(financialsModel: widget.bondDetail.financials),
          const SizedBox(height: 16),
          IssuerDetails(bondDetail: widget.bondDetail, issuerInfo: infoData),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
