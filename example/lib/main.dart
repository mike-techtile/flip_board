import 'package:flutter/material.dart';

import 'pages/board/flip_frase_board_page.dart';
import 'pages/board/flip_matrix_board_single_child_page.dart';
import 'pages/board/flip_matrix_board_stream_page.dart';
import 'pages/clock/flip_clock_page.dart';
import 'pages/clock/flip_countdown_clock_page.dart';
import 'pages/widget/flip_widget_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flip Board',
        routes: {
          'flip_widget': (_) => FlipWidgetPage(),
          'flip_image': (_) => _flipImagePage(),
          'flip_stream': (_) => _flipStreamPage(),
          'flip_frase_board': (_) => FlipFraseBoardPage(),
          'flip_clock': (_) => FlipClockPage(),
          'countdown_clock': (_) => CountdownClockPage(),
        },
        home: HomePage(),
      );

  Widget _flipImagePage() => const FlipMatrixBoardSingleChildPage(
        imageName: 'assets/flutter.png',
        axis: Axis.vertical,
        width: 375.0,
        height: 200.0,
        columns: 8,
        rows: 4,
      );

  Widget _flipStreamPage() => FlipMatrixBoardStreamPage(
        axis: Axis.vertical,
        width: 375.0,
        height: 200.0,
        columns: 8,
        rows: 4,
        imageNames: [
          'assets/flower.png',
          'assets/butterfly.png',
          'assets/sea.png',
          'assets/bird.png',
        ],
      );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Flip Board')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTileTheme(
            tileColor: Colors.black12,
            contentPadding: const EdgeInsets.all(8.0),
            shape: Border.all(color: Colors.black38),
            child: ListView(
              children: [
                _tile(
                  context,
                  Icons.flip,
                  'Flip Widget',
                  'Simple Flip Widgets',
                  'flip_widget',
                ),
                _tile(
                  context,
                  Icons.dashboard,
                  'Flip Image Board',
                  'Animate the display of a single image',
                  'flip_image',
                ),
                _tile(
                  context,
                  Icons.blur_on,
                  'Flip Stream Board',
                  'Animate a stream of images',
                  'flip_stream',
                ),
                _tile(
                  context,
                  Icons.sort_by_alpha,
                  'Flip Frase Board',
                  'Flip FLUTTER FLIP BOARD',
                  'flip_frase_board',
                ),
                _tile(
                  context,
                  Icons.watch,
                  'Flip Clock',
                  'A nice looking clock',
                  'flip_clock',
                ),
                _tile(
                  context,
                  Icons.run_circle,
                  'Flip Countdown Clock',
                  'A nice looking countdown clock',
                  'countdown_clock',
                ),
              ],
            ),
          ),
        ),
      );

  Widget _tile(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    String route,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: ListTile(
          leading: Icon(icon, size: 48.0),
          title: Text(title),
          subtitle: Text(subtitle),
          onTap: () => Navigator.of(context).pushNamed(route),
        ),
      );
}
