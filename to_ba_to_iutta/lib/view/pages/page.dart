import 'package:flutter/material.dart';

abstract class Page extends StatefulWidget {
  const Page({required this.title, super.key});
  final String title;
}
