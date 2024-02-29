import 'package:flutter/material.dart';

class MyTile extends StatefulWidget {
  final String text;
  final String image;
  final Color? color;
  final Color? textColor;

  const MyTile({
    super.key,
    required this.text,
    required this.image,
    required this.color,
    required this.textColor,
  });

  @override
  State<MyTile> createState() => _MYTileState();
}

class _MYTileState extends State<MyTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: widget.color ?? Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(widget.image),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.textColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
