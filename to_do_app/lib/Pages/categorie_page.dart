import 'package:flutter/material.dart';
import 'package:to_do_app/Pages/create_new_task.dart';
import 'task_list_page.dart';
import 'calendar_page.dart';
import 'settings_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _selectedIndex = 1; // Categories tab

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    Widget page;
    switch (index) {
      case 0:
        page = const TaskListPage();
        break;
      case 1:
        return; // already on Categories
      case 2:
        page = const CalendarPage();
        break;
      case 3:
        page = const SettingsPage();
        break;
      default:
        return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF10221c)
          : const Color(0xFFF6F8F7),

      appBar: AppBar(
        backgroundColor: isDark
            ? const Color(0xFF10221c)
            : const Color(0xFFF6F8F7),
        elevation: 0,
        title: const Text(
          "Categories",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: isDark ? Colors.white : Colors.black54,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search categories...",
                prefixIcon: Icon(
                  Icons.search,
                  color: isDark ? Colors.white54 : Colors.black45,
                ),
                filled: true,
                fillColor: isDark
                    ? const Color(0xFF19332B)
                    : Colors.grey.shade300,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 15),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  _buildCreateNewCard(isDark),
                  _buildCategoryCard(
                    isDark,
                    "Work",
                    "12 tasks",
                    Icons.work,
                    Colors.blue,
                    0.75,
                  ),
                  _buildCategoryCard(
                    isDark,
                    "Personal",
                    "5 tasks",
                    Icons.person,
                    Colors.purple,
                    0.5,
                  ),
                  _buildCategoryCard(
                    isDark,
                    "Groceries",
                    "0 tasks",
                    Icons.shopping_cart,
                    Colors.green,
                    0.0,
                  ),
                  _buildCategoryCard(
                    isDark,
                    "Urgent",
                    "8 tasks due",
                    Icons.priority_high,
                    Colors.red,
                    0.9,
                  ),
                  _buildCategoryCard(
                    isDark,
                    "Wishlist",
                    "3 tasks",
                    Icons.star,
                    Colors.amber,
                    0.25,
                  ),
                  _buildCategoryCard(
                    isDark,
                    "Finance",
                    "1 task",
                    Icons.attach_money,
                    Colors.teal,
                    0.16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF13ECA4),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddNewTaskPage()),
          );
        },
        child: const Icon(Icons.add, size: 30, color: Colors.black),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: isDark ? const Color(0xFF10221c) : Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF13ECA4),
        unselectedItemColor: isDark ? Colors.white54 : Colors.black45,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  Widget _buildCreateNewCard(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: isDark
              ? const Color(0xFF23483c)
              : Colors.grey.shade400.withOpacity(0.6),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF23483c) : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, size: 28, color: Color(0xFF13ECA4)),
            ),
            const SizedBox(height: 8),
            Text(
              "Create New",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    bool isDark,
    String title,
    String tasks,
    IconData icon,
    Color color,
    double progress,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF19332B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color),
              ),
              Icon(
                Icons.more_horiz,
                color: isDark ? Colors.white54 : Colors.black26,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            tasks,
            style: TextStyle(
              fontSize: 13,
              color: isDark ? Colors.white60 : Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF23483c) : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
