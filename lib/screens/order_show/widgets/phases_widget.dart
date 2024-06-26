import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhasesWidget extends StatefulWidget {
  final List<PhaseInfo> phases;

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
    _isChecked = widget.phases.map((e) => e.isDone).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.phases
          .map((e) => e.label)
          .toList()
          .asMap()
          .entries
          .map((entry) {
        int index = entry.key;
        String phase = entry.value;
        return SizedBox(
          height: Get.height * 0.1,
          child: LayoutBuilder(
            builder: (context, size) => SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: size.maxHeight * 0.55,
                        height: size.maxHeight * 0.55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.purple, // Border color
                            width: 1.5, // Border width
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(color: Colors.purple),
                          ),
                        ),
                      ),
                      SizedBox(width: size.maxWidth * 0.04),
                      Text(phase),
                      SizedBox(width: size.maxWidth * 0.04),
                      Expanded(
                        child: _isChecked[index]
                            ? Row(
                                children: [
                                  ///this widget does not show any thing on the screen , fix it
                                  Expanded(
                                    child:   DashedLine()
                                  ),

                                  Icon(Icons.arrow_right),
                                ],
                              )
                            : Container(),
                      ),
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
                      padding: EdgeInsets.only(left: size.maxWidth * 0.015),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: size.maxWidth * 0.05),
                          child: CustomPaint(
                            size: Size(1, size.maxHeight * 0.34),
                            painter: DashedLinePainter(),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}


class DashedLine extends StatelessWidget {
  final double height;
  final Color color;

  const DashedLine({Key? key, this.height = 1, this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (constraints.maxWidth / (2 * dashWidth)).floor();
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) => SizedBox(width: dashWidth, height: dashHeight, child: DecoratedBox(decoration: BoxDecoration(color: color)))),
        );
      },
    );
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

class PhaseInfo {
  String label;
  bool isDone;

  PhaseInfo(this.label, this.isDone);
}
