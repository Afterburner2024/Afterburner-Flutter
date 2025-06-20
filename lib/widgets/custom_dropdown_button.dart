import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomDropdownButton extends StatefulWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;
  final Color backgroundColor;
  final Color textColor;
  final Color activeColor;

  const CustomDropdownButton({
    required this.value,
    required this.items,
    required this.onChanged,
    this.backgroundColor = kCard,
    this.textColor = kPrimary,
    this.activeColor = kAccent,
    super.key,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  void _toggleDropdown() {
    if (_isOpen) {
      _removeDropdown();
    } else {
      _showDropdown();
    }
  }

  void _showDropdown() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: _removeDropdown,
          behavior: HitTestBehavior.translucent,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: offset.dy + size.height + 4,
                width: size.width,
                child: CompositedTransformFollower(
                  link: _layerLink,
                  showWhenUnlinked: false,
                  offset: Offset(0, size.height + 4),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kCard,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: kGray.withOpacity(0.13),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(color: kGray),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: widget.items.map((item) {
                          final isSelected = item == widget.value;
                          return InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              widget.onChanged(item);
                              _removeDropdown();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              decoration: isSelected
                                  ? BoxDecoration(
                                color: widget.activeColor.withOpacity(0.09),
                                borderRadius: BorderRadius.circular(16),
                              )
                                  : null,
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: isSelected
                                      ? widget.activeColor
                                      : widget.textColor,
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
    setState(() {
      _isOpen = true;
    });
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    setState(() {
      _isOpen = false;
    });
  }

  @override
  void dispose() {
    _removeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          height: 52,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isOpen ? widget.activeColor : kGray,
              width: _isOpen ? 2 : 1,
            ),
            boxShadow: _isOpen
                ? [
              BoxShadow(
                  color: widget.activeColor.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 2))
            ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.value,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                _isOpen
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: kPrimary,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
