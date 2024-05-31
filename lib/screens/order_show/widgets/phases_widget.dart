import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled5/common/extension/ui_extension.dart';
import 'package:untitled5/public_files/const.dart';

class PhasesWidget extends StatefulWidget {
  final List<String> phases;

  PhasesWidget({required this.phases});

  @override
  _PhasesWidgetState createState() => _PhasesWidgetState();
}

class _PhasesWidgetState extends State<PhasesWidget> {
  List<bool> _isChecked;

  _PhasesWidgetState() : _isChecked = [];

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(widget.phases.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return
       Column(
        children: widget.phases.asMap().entries.map((entry) {
          int index = entry.key;
          String phase = entry.value;
          return SizedBox(
            height: Get.height*0.1,
            child: LayoutBuilder(
              builder: (context, size) =>Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: size.maxHeight*0.55, // Adjust the width as needed
                        height: size.maxHeight*0.55, // Adjust the height as needed
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: purple1, // Border color
                            width: 1.5, // Border width
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(color: purple1),
                          ),
                        ),
                      ),
                      SizedBox(width: size.maxWidth*0.04),
                      Text(phase),
                      SizedBox(width: size.maxWidth*0.04),

                      Expanded(
                        child: _isChecked[index]?Row(
                          children: [
                            CustomPaint(
                              //size: Size(, 1),
                              painter: DashedLinePainter(),
                            ).test(),
                            Icon(Icons.arrow_right),
                          ],
                        ):Container(),
                      ) ,

                      Checkbox(
                        value: _isChecked[index],
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked[index] = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  if (index < widget.phases.length - 1)
                    Padding(
                      padding:  EdgeInsets.only(left: size.maxWidth*0.015),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin:  EdgeInsets.only(left: size.maxWidth*0.05),
                          child: CustomPaint(
                            size: Size(1, size.maxHeight*0.34),
                            painter: DashedLinePainter(),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
       )
     ;
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;
    double dashHeight = 5, dashSpace = 3, startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
