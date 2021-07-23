import 'package:flip_board/flip_board.dart';
import 'package:flutter/material.dart';

/// Page with two FlipFraseBoards showing frase board animations.
///
/// Frase animate theis chars from "AAAAAAA" to "FLUTTER" on one line,
/// and from "AAAAAAAAAA" to "FLIP BOARD" on the second line
/// FlipFraseBoard uses Theme colors and optional parameterized colors.
/// Chars are flipped in different random speeds.
class FlipFraseBoardPage extends StatefulWidget {
  @override
  _FlipFraseBoardPageState createState() => _FlipFraseBoardPageState();
}

class _FlipFraseBoardPageState extends State<FlipFraseBoardPage> {
  final _completed = [false, false];
  final _startNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Flip Frase Board')),
        body: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlipFraseBoard(
                  startLetter: 'A',
                  endFrase: 'FLUTTER',
                  fontSize: 42.0,
                  letterSpacing: 3.0,
                  onDone: () => _onDone(0),
                  flipSpacing: 0.0,
                  startNotifier: _startNotifier,
                ),
                const SizedBox(height: 10.0),
                FlipFraseBoard(
                  startLetter: 'A',
                  endFrase: 'FLIP BOARD',
                  fontSize: 30.0,
                  flipSpacing: 0.8,
                  endColors: _endColors,
                  onDone: () => _onDone(1),
                  startNotifier: _startNotifier,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: (_completed[0] && _completed[1])
                      ? IconButton(
                          onPressed: _restart,
                          icon: const Icon(
                            Icons.replay_circle_filled,
                            size: 48.0,
                          ),
                        )
                      : const SizedBox(height: 48.0),
                ),
              ],
            ),
          ),
        ),
      );

  List<Color> get _endColors => [
        Colors.teal[900]!,
        Colors.blue[900]!,
        Colors.red[900]!,
        Colors.blueGrey[900]!,
        Colors.lightGreen[900]!,
        Colors.orange[900]!,
        Colors.cyan[800]!,
      ];

  void _onDone(int index) {
    _completed[index] = true;
    if (_completed[0] && _completed[1]) {
      setState(() {});
    }
  }

  void _restart() {
    setState(() {
      _completed[0] = false;
      _completed[1] = false;
      _startNotifier.value = _startNotifier.value + 1;
    });
  }
}