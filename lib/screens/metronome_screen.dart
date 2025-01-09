import 'package:flutter/material.dart';

class MetronomeScreen extends StatefulWidget {
  const MetronomeScreen({Key? key}) : super(key: key);

  @override
  State<MetronomeScreen> createState() => _MetronomeScreenState();
}

class _MetronomeScreenState extends State<MetronomeScreen> {
  double _currentBPM = 40;
  final double _minBPM = 40;
  final double _maxBPM = 218;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),  // 연한 보라색 배경
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'MuseMate',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: MetronomePainter(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.deepPurple,
                    inactiveTrackColor: Colors.deepPurple.withOpacity(0.3),
                    thumbColor: Colors.deepPurple,
                    overlayColor: Colors.deepPurple.withOpacity(0.3),
                  ),
                  child: Slider(
                    value: _currentBPM,
                    min: _minBPM,
                    max: _maxBPM,
                    onChanged: (value) {
                      setState(() {
                        _currentBPM = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _minBPM.toInt().toString(),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        _maxBPM.toInt().toString(),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Metronome tab
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_manual_record),
            label: 'Record',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Metronome',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Score',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'My',
          ),
        ],
      ),
    );
  }
}

class MetronomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.black;

    // 메트로놈 외곽선
    final path = Path()
      ..moveTo(size.width * 0.3, size.height * 0.8)
      ..lineTo(size.width * 0.5, size.height * 0.2)
      ..lineTo(size.width * 0.7, size.height * 0.8)
      ..close();
    canvas.drawPath(path, paint);

    // 중앙 게이지 (민트색)
    final gaugePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF40E0D0);  // 민트색

    final gaugeRect = Rect.fromLTWH(
      size.width * 0.45,
      size.height * 0.3,
      size.width * 0.1,
      size.height * 0.4,
    );
    canvas.drawRect(gaugeRect, gaugePaint);

    // 메트로놈 다이얼
    final dialPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.75),
      5.0,
      dialPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}