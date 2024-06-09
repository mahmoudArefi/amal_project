import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled5/common/extension/ui_extension.dart';
import 'package:untitled5/common/fonts_variable.dart';
import 'package:untitled5/common/icons_svg_code.dart';
import 'package:untitled5/common/widgets/a_text.dart';
import 'package:untitled5/public_files/const.dart';

class MyBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Test();
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) => Column(
        children: [
          Center(
              child: CustomPaint(
            size: Size(size.maxWidth * 0.38, 40),
            // Specify the size of the CustomPaint
            painter: HalfCirclePainter(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: AText(
                "SAVE",
                fontFamily: MyFont.Bauhaus93,
                fontSize: 18.sp,
              ),
            ),
          )),
          SizedBox(
            height: Get.height * 0.04,
            width: Get.width,
            child: Container(
              decoration: const BoxDecoration(
                  color: purple,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(60))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    List.generate(3, (index) => SvgPicture.string(MyIcon.star)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gray.withOpacity(0.6)
      ..style = PaintingStyle.fill
      ..strokeWidth = 4; // Set the border width

    // Create a rectangle that defines the bounds of the half-circle
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    // Draw the half-circle
    canvas.drawArc(
      rect,
      -3.14, // Start angle (top of the circle)
      3.14, // Sweep angle (half circle)
      true, // Use center
      paint,
    );

    final borderPaint = Paint()
      ..color = purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Draw the half-circle
    canvas.drawArc(
      rect,
      -3.14, // Start angle (top of the circle)
      3.14, // Sweep angle (half circle)
      true, // Use center
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
