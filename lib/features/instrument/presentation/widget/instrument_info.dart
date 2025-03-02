part of '../pages/instrument_detail.dart';

class InstrumentInfo extends StatelessWidget {
  const InstrumentInfo({super.key, required this.bondDetail});
  final BondDetail bondDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        const SizedBox(height: 8),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor),
            color: AppColors.white,
          ),
          child: ImageHolder(imageUrl: bondDetail.logo ?? "", height: 48),
        ),

        Text(
          bondDetail.companyName ?? "",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.headerColor,
          ),
        ),
        Text(
          bondDetail.description ?? "",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.descColor,
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0XFF2563EB).withValues(alpha: 0.12),
              ),
              child: Text(
                "ISIN: ${bondDetail.isin}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF2563EB),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0XFF059669).withValues(alpha: 0.08),
              ),
              child: Text(
                bondDetail.status ?? "",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF059669),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
