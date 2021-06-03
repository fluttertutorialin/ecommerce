/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import '../../import_package.dart';
import 'custom_back_button.dart';

class CustomAppbarWidget extends PreferredSize {
  final String title;
  final Color? backgroundColor, backButtonColor, textColor;
  final TextStyle? textStyle;
  final List<Widget>? actions;
  final Function()? onActionButtonTap, onBackPress;
  final double? actionButtonWidth;
  final Widget? leading, bottom;
  final bool showBackButton;

  CustomAppbarWidget({
    Key? key,
    required this.title,
    this.leading,
    this.showBackButton = false,
    this.onBackPress,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.backButtonColor = Colors.white,
    this.textColor,
    this.textStyle,
    this.actions,
    this.onActionButtonTap,
    this.actionButtonWidth = 100,
    this.bottom,
  })  : assert(
            textColor == null || textStyle == null,
            'Cannot provide both a textColor and a textStyle\n'
            'To provide both, use "textStyle: TextStyle(color: color)".'),
        super(
            key: key,
            child: const SizedBox.shrink(),
            preferredSize:
                Size.fromHeight(bottom == null ? kToolbarHeight : 98.h));

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        actions: actions,
        automaticallyImplyLeading: false,
        actionsIconTheme: IconThemeData(size: 30.w),
        bottom: bottom == null
            ? null
            : PreferredSize(
                preferredSize: Size.fromHeight(100.h),
                child: bottom!,
              ),
        leading: showBackButton
            ? CustomBackButton(leading: leading, onBackTap: onBackPress)
            : null,
        leadingWidth: 45.w,
        backgroundColor: backgroundColor,
        title: Text(title,
            style: AppTextStyle.appBarTitleStyle));
  }
}
