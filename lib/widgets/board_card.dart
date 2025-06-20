import 'package:flutter/material.dart';

class BoardCard extends StatelessWidget {
  final String title;
  final String description;
  const BoardCard({required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }
}
