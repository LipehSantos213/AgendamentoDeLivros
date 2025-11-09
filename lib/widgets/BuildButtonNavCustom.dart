import 'package:flutter/material.dart';

class BuildButtonNavCustom extends StatefulWidget {
  final String title;
  final VoidCallback onClick;

  const BuildButtonNavCustom({
    super.key,
    required this.title,
    required this.onClick,
  });

  @override
  State<BuildButtonNavCustom> createState() => _BuildButtonNavCustomState();
}

class _BuildButtonNavCustomState extends State<BuildButtonNavCustom> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        Future.delayed(const Duration(milliseconds: 100), widget.onClick);
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient:
              _isPressed
                  ? const LinearGradient(
                    colors: [Colors.deepPurpleAccent, Colors.purpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                  : const LinearGradient(
                    colors: [Color(0xFF6A1B9A), Colors.black87],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
          boxShadow:
              _isPressed
                  ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ]
                  : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
          border: Border.all(color: Colors.white.withOpacity(0.8), width: 1.3),
        ),
        child: Text(
          widget.title.toUpperCase(),
          style: TextStyle(
            color: _isPressed ? Colors.white70 : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
