import 'package:fluent_ui/fluent_ui.dart';

class QPanel extends StatelessWidget {
  final Widget child;

  const QPanel({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Acrylic(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      blurAmount: 100,
      luminosityAlpha: 1.0,
      shadowColor: Colors.black,
      elevation: 20,
      tint: Colors.white,
      child: child,
    );
  }
}
