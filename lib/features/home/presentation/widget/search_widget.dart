part of '../pages/home_screen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.textEditingController,
    this.onChange,
  });
  final TextEditingController textEditingController;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.white,
      ),
      child: CustomInput(
        textEditingController: textEditingController,
        hintText: AppConst.hintText,
        prefix: Icon(Icons.search, color: Color(0xff6A7282)),
        onChange: onChange,
      ),
    );
  }
}
