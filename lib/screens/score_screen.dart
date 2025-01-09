import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isAddMode = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Text(
              'MuseMate',
              style: TextStyle(color: Colors.black),
            ),
            const Spacer(),
            if (!_isAddMode) IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: () {
                setState(() {
                  _isAddMode = true;
                });
              },
            ),
          ],
        ),
        bottom: !_isAddMode ? TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          tabs: const [
            Tab(text: 'ALL'),
            Tab(text: 'Favorite'),
          ],
        ) : null,
      ),
      body: _isAddMode ? _buildAddView() : _buildScoreList(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,  // Score tab
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_manual_record),
            label: 'Record',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Metronome',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
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

  Widget _buildAddView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Add',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _isAddMode = false;
                  });
                },
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          ElevatedButton(
            onPressed: () {
              // 파일 업로드 로직 구현
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text('Upload'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildScoreList() {
    return TabBarView(
      controller: _tabController,
      children: [
        // ALL 탭
        ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple.withOpacity(0.2),
                child: const Text('A', style: TextStyle(color: Colors.deepPurple)),
              ),
              title: Text('악보${index + 1}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.download),
                    onPressed: () {
                      // 다운로드 로직 구현
                    },
                  ),
                  if (_tabController.index == 0)
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        // 삭제 로직 구현
                      },
                    ),
                ],
              ),
            );
          },
        ),
        // Favorite 탭
        ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.star),
              title: Text('악보${index + 1}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {
                  // 삭제 로직 구현
                },
              ),
            );
          },
        ),
      ],
    );
  }
}