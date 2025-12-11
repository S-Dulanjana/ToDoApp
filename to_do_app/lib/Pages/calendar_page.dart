import 'package:flutter/material.dart';

class CalendarTask {
  String title;
  String category;
  Color categoryColor;
  String time;
  bool completed;

  CalendarTask({
    required this.title,
    required this.category,
    required this.categoryColor,
    required this.time,
    this.completed = false,
  });
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final Color primary = const Color(0xFF13ECA4);
  final Color backgroundLight = const Color(0xFFF6F8F7);
  final Color backgroundDark = const Color(0xFF10221C);
  final Color surfaceLight = Colors.white;
  final Color surfaceDark = const Color(0xFF1C2E28);

  String selectedView = 'Month';
  int selectedDay = 15;

  final List<CalendarTask> tasks = [
    CalendarTask(
      title: 'Team Standup',
      category: 'Project A',
      categoryColor: Colors.purple,
      time: '09:00 AM',
    ),
    CalendarTask(
      title: 'Design Review',
      category: 'Design',
      categoryColor: Colors.blue,
      time: '11:30 AM',
    ),
    CalendarTask(
      title: 'Submit Report',
      category: 'Admin',
      categoryColor: Colors.orange,
      time: '02:00 PM',
    ),
    CalendarTask(
      title: 'Gym Session',
      category: 'Personal',
      categoryColor: Colors.grey,
      time: '06:00 PM',
      completed: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pageBg = isDark ? backgroundDark : backgroundLight;

    return Scaffold(
      backgroundColor: pageBg,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chevron_left,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            'September 2023',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chevron_right,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      FloatingActionButton(
                        backgroundColor: primary,
                        onPressed: () {},
                        child: const Icon(Icons.add, color: Colors.black),
                        mini: true,
                      ),
                    ],
                  ),
                ),

                // View Switcher (Segmented Control)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Row(
                    children: ['Day', 'Week', 'Month'].map((view) {
                      final bool active = selectedView == view;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => selectedView = view),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: active
                                  ? (isDark ? surfaceDark : Colors.white)
                                  : (isDark
                                        ? surfaceDark
                                        : Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: active
                                  ? [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Center(
                              child: Text(
                                view,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: active
                                      ? (isDark ? Colors.white : Colors.black)
                                      : (isDark
                                            ? Colors.grey.shade400
                                            : Colors.grey.shade600),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 8),

                // Calendar Grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      // Weekday headers
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                            .map<Widget>(
                              (d) => SizedBox(
                                width: 32,
                                child: Center(
                                  child: Text(
                                    d,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: isDark
                                          ? Colors.grey.shade500
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(), // Dart now knows this is List<Widget>
                      ),

                      const SizedBox(height: 4),
                      // Days Grid (simple 30-day month example)
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: List.generate(30, (index) {
                          final day = index + 1;
                          final bool isSelected = selectedDay == day;
                          return GestureDetector(
                            onTap: () => setState(() => selectedDay = day),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? primary
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: primary.withOpacity(0.3),
                                          blurRadius: 8,
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    '$day',
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.black
                                          : (isDark
                                                ? Colors.white
                                                : Colors.black87),
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                  if ([4, 8, 12, 16, 21].contains(day))
                                    Positioned(
                                      bottom: 4,
                                      child: Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color: day == 21
                                              ? primary
                                              : (isDark
                                                    ? Colors.grey.shade600
                                                    : Colors.grey.shade400),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Task List for selected day
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark ? surfaceDark : surfaceLight,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(isDark ? 0.4 : 0.05),
                          blurRadius: 12,
                          offset: const Offset(0, -4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'September $selectedDay',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                              Text(
                                '${tasks.length} Tasks',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: isDark
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.only(bottom: 20),
                            itemCount: tasks.length,
                            separatorBuilder: (_, __) =>
                                const Divider(height: 0),
                            itemBuilder: (context, index) {
                              final task = tasks[index];
                              return ListTile(
                                onTap: () {
                                  setState(() {
                                    task.completed = !task.completed;
                                  });
                                },
                                leading: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: task.completed
                                        ? (isDark
                                              ? Colors.grey.shade600
                                              : Colors.grey.shade300)
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: task.completed
                                          ? Colors.transparent
                                          : (isDark
                                                ? Colors.grey.shade600
                                                : Colors.grey.shade300),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: task.completed
                                      ? const Icon(
                                          Icons.check,
                                          size: 16,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                title: Text(
                                  task.title,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: task.completed
                                        ? Colors.grey
                                        : isDark
                                        ? Colors.white
                                        : Colors.black87,
                                    decoration: task.completed
                                        ? TextDecoration.lineThrough
                                        : null,
                                  ),
                                ),
                                subtitle: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: task.categoryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    task.category.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: task.categoryColor,
                                    ),
                                  ),
                                ),
                                trailing: Text(
                                  task.time,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: task.completed
                                        ? Colors.grey
                                        : primary,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
