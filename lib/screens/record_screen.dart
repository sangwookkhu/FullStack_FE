import 'package:flutter/material.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3E5F5),  // 연한 보라색 배경
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'MuseMate',
          style: TextStyle(color: Colors.black),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'ALL'),
            Tab(text: 'Voice'),
            Tab(text: 'Video'),
            Tab(text: 'Favorite'),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 5,  // 녹음 항목 개수
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              leading: const Icon(Icons.star_border),
              title: Text('녹음${index + 1}'),
              subtitle: const Text('voice'),
              trailing: const Icon(Icons.delete_outline),
              onTap: () {
                // 녹음 항목 탭 처리
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_manual_record),
            label: 'Record',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Unfinished',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 삭제 버튼 처리
        },
        child: const Icon(Icons.delete),
        backgroundColor: Colors.grey,
      ),
    );
  }
}