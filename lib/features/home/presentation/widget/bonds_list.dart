part of '../pages/home_screen.dart';

class BondsList extends StatelessWidget {
  const BondsList({super.key, required this.bonds, required this.onTap});
  final List<BondsModel> bonds;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder:
            (_, index) => BondItem(bondsModel: bonds[index], onTap: onTap),
        separatorBuilder:
            (_, _) => const Divider(
              endIndent: 16,
              indent: 16,
              color: AppColors.dividerColor,
              thickness: 0.7,
            ),
        itemCount: bonds.length,

        ///bonds.length > 3 ? 3 :
      ),
    );
  }
}
