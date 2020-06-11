import 'dart:io';

import 'package:bug/theme_color_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark().copyWith(
        dividerColor: Colors.white.withOpacity(0.25),
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: TextStyle(color: Colors.white),
          actionTextColor: Colors.white,
        ),
        accentColor: ThemeColorPallete.lightIcayTeal,
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        canvasColor: ThemeColorPallete.lighterBlack,
        primaryColor: ThemeColorPallete.lighterBlack,
        applyElevationOverlayColor: true,
        appBarTheme: AppBarTheme(color: Colors.black, elevation: 0),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white30,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        accentTextTheme: TextTheme(
          button: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline6: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.dark().copyWith(
            secondary: ThemeColorPallete.icayRed,
            primary: ThemeColorPallete.lightIcayTeal,
            background: ThemeColorPallete.lightIcayTeal,
          ),
        ),
        cupertinoOverrideTheme:
            CupertinoThemeData(primaryColor: ThemeColorPallete.lightIcayTeal),
        textSelectionColor: ThemeColorPallete.lightIcayTeal,
        cursorColor: ThemeColorPallete.lightIcayTeal,
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          labelStyle: TextStyle(
            color: ThemeColorPallete.placeholderText,
          ),
          filled: true,
          fillColor: ThemeColorPallete.lighterBlack,
          prefixStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: ThemeColorPallete.lighterBlack,
          ),
          textStyle: TextStyle(color: Colors.white),
        ),
        colorScheme: ColorScheme.dark().copyWith(
          primary: ThemeColorPallete.lightIcayTeal,
          secondary: ThemeColorPallete.icayRed,
          error: ThemeColorPallete.icayRed,
        ),
      ),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) => Container(
                width: 100,
                child: const Center(
                  child: FlutterLogo(size: 80),
                ),
              ),
              childCount: 100,
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildSliverAppBar() {
    var estimatedBrightness = ThemeData.estimateBrightnessForColor(Colors.teal);

    Color textColor =
        estimatedBrightness == Brightness.light ? Colors.black : Colors.white;

    return SliverAppBar(
      brightness: estimatedBrightness,
      pinned: true,
      stretch: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      expandedHeight: MediaQuery.of(context).size.height / 3,
      backgroundColor: Color(4283215696),
      actions: <Widget>[
        IconButton(
          icon: Icon(Platform.isIOS ? CupertinoIcons.share : Icons.share),
          onPressed: () {},
        ),
      ],
      iconTheme: IconThemeData(color: textColor),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Color(4283215696).withOpacity(0.75),
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return OtherPage();
              }));
            },
            child: Text(
              'Test',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        background: Stack(
          children: <Widget>[
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height / 3) + 50,
              top: -(100 / 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        FlutterLogo(),
                        Positioned.fill(
                          child: Material(
                            shape: CircleBorder(),
                            clipBehavior: Clip.hardEdge,
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtherPage extends StatefulWidget {
  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) => Container(
                width: 100,
                child: const Center(
                  child: FlutterLogo(size: 80),
                ),
              ),
              childCount: 100,
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildSliverAppBar() {
    var estimatedBrightness = ThemeData.estimateBrightnessForColor(Colors.teal);

    Color textColor =
        estimatedBrightness == Brightness.light ? Colors.black : Colors.white;

    return SliverAppBar(
      brightness: estimatedBrightness,
      pinned: true,
      stretch: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      expandedHeight: MediaQuery.of(context).size.height / 3,
      backgroundColor: Colors.teal,
      actions: <Widget>[
        IconButton(
          icon: Icon(Platform.isIOS ? CupertinoIcons.share : Icons.share),
          onPressed: () {},
        ),
      ],
      iconTheme: IconThemeData(color: textColor),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.75),
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Test Title',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        background: Stack(
          children: <Widget>[
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height / 3) + 50,
              top: -(100 / 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        FlutterLogo(),
                        Positioned.fill(
                          child: Material(
                            shape: CircleBorder(),
                            clipBehavior: Clip.hardEdge,
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
