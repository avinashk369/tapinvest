part of '../pages/home_screen.dart';

class BondItem extends StatelessWidget {
  const BondItem({super.key, required this.bondsModel, required this.onTap});
  final BondsModel bondsModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColors.borderColor, width: 0.4),
            color: AppColors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4.8),
          child: Center(child: ImageHolder(imageUrl: bondsModel.logo ?? '')),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: (bondsModel.isin ?? "").substring(
                  0,
                  ((bondsModel.isin?.length ?? 0) - 4),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: (bondsModel.isin ?? "").substring(
                  ((bondsModel.isin?.length ?? 0) - 4),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        subtitle: Row(
          spacing: 5,
          children: [
            Text(
              bondsModel.tags?.first ?? "",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: AppColors.subtitleColor,
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(6),
              ),
              child: SizedBox(height: 3, width: 3),
            ),
            Expanded(
              child: Text(
                bondsModel.companyName ?? "",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: AppColors.subtitleColor,
                ),
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.arrowColor,
          size: 12,
        ),
      ),
    );
  }
}
