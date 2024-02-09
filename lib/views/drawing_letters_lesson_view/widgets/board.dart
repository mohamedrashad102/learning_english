import 'package:flutter/material.dart';
import 'package:pick_color/pick_color.dart';

import 'board_letter.dart';
import 'board_painter.dart';

class Board extends StatefulWidget {
  const Board({
    super.key,
    required this.boardKey,
    required this.boardWidth,
    required this.boardHeight,
    required this.letter,
    required this.letterColor,
    required this.letterFontSize,
    required this.letterFontWeight,
    required this.painterStrokeWidth,
    this.boardDecoration,
    this.cleanIcon,
    required this.letterStrokeWidth,
  });
  final double boardWidth;
  final double boardHeight;
  final BoxDecoration? boardDecoration;
  final String letter;
  final double letterFontSize;
  final FontWeight letterFontWeight;
  final double painterStrokeWidth;
  final double letterStrokeWidth;
  final Color letterColor;
  final GlobalKey boardKey;
  final Widget? cleanIcon;
  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  late final List<Offset> _points;

  @override
  void initState() {
    _points = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.boardKey,
      width: widget.boardWidth,
      height: widget.boardHeight,
      decoration: widget.boardDecoration,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: widget.boardWidth,
            height: widget.boardHeight,
            color: Colors.transparent,
            alignment: Alignment.topCenter,
            child: ColorPicker(
              onChanged: (PickerResponse response) {
                if (response.selectionColor == Colors.grey.shade300) {
                  _addPoint(response);
                }
              },
              showMarker: true,
              trackerImage: const SizedBox(),
              child: BoardLetter(
                widget.letter,
                color: widget.letterColor,
                fontSize: widget.letterFontSize,
                fontWeight: widget.letterFontWeight,
                strokeWidth: widget.letterStrokeWidth,
              ),
            ),
          ),
          CustomPaint(
            painter: BoardPainter(
              points: _points,
              color: widget.letterColor,
              strokeWidth: widget.painterStrokeWidth,
            ),
          ),
          IconButton(
            onPressed: () => _clearDrawing(),
            icon: widget.cleanIcon ??
                const Icon(
                  Icons.cleaning_services_rounded,
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  void _clearDrawing() {
    setState(() {
      _points.clear();
    });
  }

  void _addPoint(PickerResponse response) {
    final point = Offset(
      response.xpostion -
          _getDistanceFromLeft(widget.boardKey) -
          widget.boardWidth / 2,
      response.ypostion - _getDistanceFromTop(widget.boardKey),
    );
    setState(() {
      _points.add(point);
    });
  }

  double _getDistanceFromLeft(GlobalKey key) {
    RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    Offset widgetOffset = renderBox.localToGlobal(Offset.zero);
    return widgetOffset.dx;
  }

  double _getDistanceFromTop(GlobalKey key) {
    RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    Offset widgetOffset = renderBox.localToGlobal(Offset.zero);
    return widgetOffset.dy;
  }
}
