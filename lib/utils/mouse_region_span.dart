import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MouseRegionSpan extends WidgetSpan {
  MouseRegionSpan({
    @required MouseCursor mouseCursor,
    @required InlineSpan inlineSpan,
    @required VoidCallback onTap,
  }) : super(
          child: GestureDetector(
            onTap: onTap,
            child: MouseRegion(
              cursor: mouseCursor,
              child: Text.rich(
                inlineSpan,
              ),
            ),
          ),
        );
}
