import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app_with_global_api/view/categories/apple_widget.dart';
import 'package:news_app_with_global_api/view/categories/business_widget.dart';
import 'package:news_app_with_global_api/view/categories/magazines_widget.dart';
import 'package:news_app_with_global_api/view/categories/tech_widgets.dart';
import 'package:news_app_with_global_api/view/categories/tesla_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("World News"),
        bottom: TabBar(
          controller:  _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: "Apple",),
            Tab(text: "Tesla",),
            Tab(text: "Technology",),
            Tab(text: "Business",),
            Tab(text: "Magazine",),
          ]),),
      body: TabBarView( 
        controller: _tabController,
        children: _newsBody),
    );
  }

  final List<Widget> _newsBody = [const AppleNewsWidget(),const TeslaNewsWidget(),const TechNewsWidget(),const BusinessNewsWidget(),const MagazineNewsWidget()];
}