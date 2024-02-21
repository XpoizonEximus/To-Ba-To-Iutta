import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/view/generic_page.dart';

class HomePage extends GenericPage {
  const HomePage({super.key}) : super(title: 'To Ba To Iutta');

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Text("Home page");
  }
}
