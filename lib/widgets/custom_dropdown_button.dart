import 'package:flutter/material.dart';

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
    this.backgroundColor = const Color(0xFF23252D),
    this.textColor = const Color(0xFFF1F5F9),
    this.activeColor = const Color(0xFF3B82F6),
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
                        color: Colors.grey[900]?.withOpacity(0.98),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: widget.items.map((item) {
                          final isSelected = item == widget.value;
                          return InkWell(
                            borderRadius: BorderRadius.circular(14),
                            onTap: () {
                              widget.onChanged(item);
                              _removeDropdown();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              decoration: isSelected
                                  ? BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(14),
                              )
                                  : null,
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: Colors.white,
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
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isOpen ? Colors.white : Colors.white24,
              width: _isOpen ? 2 : 1,
            ),
            boxShadow: _isOpen
                ? [
              BoxShadow(
                  color: Colors.white12,
                  blurRadius: 8,
                  offset: Offset(0, 2))
            ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                _isOpen
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.white70,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
