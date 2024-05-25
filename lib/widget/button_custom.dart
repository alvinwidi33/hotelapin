import 'package:flutter/material.dart';

import '../config/app_color.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({super.key, required this.label, required this.onTap, this.isExpand});
  final String label;
  final Function onTap;
  final bool? isExpand;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 0.7),
            child: Container(
              width: isExpand == null 
                ? null
                : isExpand! 
                ? double.infinity : null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: AppColor.primary,
                    offset: Offset(0, 5),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Align(
          child: Material(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => onTap(),
              child: Container(
                width: isExpand == null 
                ? null
                : isExpand! 
                ? double.infinity : null,
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 12,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
