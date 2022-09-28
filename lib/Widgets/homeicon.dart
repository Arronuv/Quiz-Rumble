import 'package:flutter/material.dart';

InkWell homeIcon({required IconData icon,required double size,required Color iconColor}) {
  return InkWell(
    customBorder: const CircleBorder(),
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
          child: Icon(
        icon,
        size: size,
        color: iconColor,
      )),
    ),
  );
}
