import 'package:flutter/material.dart';

class NeonActionCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color neon;
  final VoidCallback onTap;
  const NeonActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.neon,
    required this.onTap,
    super.key,
  });

  @override
  State<NeonActionCard> createState() => _NeonActionCardState();
}

class _NeonActionCardState extends State<NeonActionCard> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              blurRadius: 12,
              offset: const Offset(0, 7),
            ),
            if (_isPressed)
              BoxShadow(
                color: widget.neon.withOpacity(0.30),
                blurRadius: 32,
                spreadRadius: 4,
                offset: const Offset(0, 0),
              ),
          ],
          border: Border.all(
            color: Colors.grey.withOpacity(0.10),
            width: 1.2,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: widget.color, size: 40),
              const SizedBox(height: 13),
              Text(
                widget.label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.grey[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
