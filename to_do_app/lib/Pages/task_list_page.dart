import 'package:flutter/material.dart';

// Paste this file into your lib/ and use it as the home page:
// runApp(MaterialApp(home: TaskListPage()));

class Task {
  String title;
  String category;
  Color categoryColor;
  String timeText;
  bool completed;
  bool highPriority;

  Task({
    required this.title,
    required this.category,
    required this.categoryColor,
    required this.timeText,
    this.completed = false,
    this.highPriority = false,
  });
}

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final Color primary = const Color(0xFF13ECA4);
  final Color backgroundLight = const Color(0xFFF6F8F7);
  final Color backgroundDark = const Color(0xFF10221C);
  final Color surfaceLight = Colors.white;
  final Color surfaceDark = const Color(0xFF1C2E28);

  final List<Task> tasks = [
    Task(
      title: 'Design System Review',
      category: 'Work',
      categoryColor: const Color(0xFF0EA5E9),
      timeText: '10:00 AM',
    ),
    Task(
      title: 'Buy Groceries',
      category: 'Personal',
      categoryColor: const Color(0xFF60A5FA),
      timeText: '6:00 PM',
    ),
    Task(
      title: 'Gym Session',
      category: 'Health',
      categoryColor: const Color(0xFF9F7AEA),
      timeText: '7:00 AM',
      completed: true,
    ),
    Task(
      title: 'Call Mom',
      category: 'Personal',
      categoryColor: const Color(0xFF60A5FA),
      timeText: 'High Priority',
      highPriority: true,
    ),
    Task(
      title: 'Prepare Q4 Presentation',
      category: 'Work',
      categoryColor: const Color(0xFF13ECA4),
      timeText: 'Tomorrow',
    ),
  ];

  bool notificationsOn = true;
  String activeFilter = 'To Do';

  String getFormattedDate() {
    final now = DateTime.now();
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final weekday = weekdays[now.weekday - 1];
    final month = months[now.month - 1];
    return '$weekday, $month ${now.day}';
  }

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
            child: Stack(
              children: [
                // --------------------------
                // NEW BACK BUTTON (TOP-LEFT)
                // --------------------------
                Positioned(
                  top: 16,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isDark ? surfaceDark : surfaceLight,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(2, 6, 23, 0.06),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),

                // Main UI column
                Column(
                  children: [
                    const SizedBox(height: 40),

                    // Header
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: isDark ? surfaceDark : surfaceLight,
                              borderRadius: BorderRadius.circular(999),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(2, 6, 23, 0.03),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(Icons.calendar_today, size: 20),
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(999),
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(999),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(999),
                                    child: Image.network(
                                      'https://lh3.googleusercontent.com/aida-public/AB6AXuD0IDo9VBQxG0mzTradOAcEJvfJ5o5Kz7FTDBp26QeQzepDt7_UVcakhzkOjOnbL9L6eEw1OMtCdYLMeZQ3WJ4ladPrxE8Sj9s62FBCkhseoU0sWdG8_qmRbYV3wsnOGB2u6t37wCpbqiGwi_AXs632Ekb9wMnaG_urs8v1iXeJM7fpoWt_AIZeWM3ZPbCAEcXNeec0DJ8Lmue_-HtHNOtrFhCauapHJSsBOFpKu8Juun6nvVobQ-Q8TukpYKromTd9b2k1q7UKmwfi',
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) =>
                                          Container(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Greeting
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Morning',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            getFormattedDate(),
                            style: TextStyle(
                              color: isDark
                                  ? Colors.grey.shade300
                                  : Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Filter chips
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: 44,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _filterChip(
                              'To Do',
                              count: tasks.where((t) => !t.completed).length,
                            ),
                            const SizedBox(width: 10),
                            _filterChip(
                              'Done',
                              count: tasks.where((t) => t.completed).length,
                              active: false,
                            ),
                            const SizedBox(width: 10),
                            _filterChip('Overdue', count: 0, active: false),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Task list
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.separated(
                          padding: const EdgeInsets.only(bottom: 110, top: 6),
                          itemCount: tasks.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            return _buildTaskItem(tasks[index], index, isDark);
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                // FAB
                Positioned(
                  bottom: 18,
                  right: 18,
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: primary,
                    child: const Icon(Icons.add, size: 32, color: Colors.black),
                    elevation: 8,
                  ),
                ),

                // top gradient
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primary.withOpacity(0.05),
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
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

  Widget _filterChip(String label, {int count = 0, bool active = true}) {
    final bool isActive = active && (activeFilter == label);

    return GestureDetector(
      onTap: () => setState(() => activeFilter = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        height: 40,
        decoration: BoxDecoration(
          color: isActive
              ? primary
              : (Theme.of(context).brightness == Brightness.dark
                    ? surfaceDark
                    : Colors.grey.shade200),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                color: isActive
                    ? Colors.black
                    : (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black87),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: isActive
                    ? (Theme.of(context).brightness == Brightness.dark
                          ? backgroundDark.withOpacity(0.2)
                          : Colors.black12)
                    : (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white10
                          : Colors.black12),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Center(
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: isActive
                        ? Colors.black
                        : (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black87),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(Task task, int index, bool isDark) {
    final bool completed = task.completed;

    return Material(
      color: isDark ? surfaceDark : surfaceLight,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          setState(() {
            tasks[index].completed = !tasks[index].completed;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    tasks[index].completed = !tasks[index].completed;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: completed ? primary : Colors.transparent,
                    border: Border.all(
                      color: completed
                          ? primary
                          : (isDark
                                ? Colors.grey.shade600
                                : Colors.grey.shade300),
                      width: 2,
                    ),
                  ),
                  child: completed
                      ? const Icon(Icons.check, size: 14, color: Colors.black)
                      : null,
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: completed
                            ? Colors.grey.shade400
                            : (isDark ? Colors.white : Colors.black87),
                        decoration: completed
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: task.categoryColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            task.category,
                            style: TextStyle(
                              color: task.categoryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          task.timeText,
                          style: TextStyle(
                            color: isDark
                                ? Colors.grey.shade400
                                : Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 6),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 160),
                opacity: 1.0,
                child: task.completed
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: isDark
                              ? Colors.grey.shade400
                              : Colors.grey.shade600,
                        ),
                      )
                    : IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: isDark
                              ? Colors.grey.shade400
                              : Colors.grey.shade600,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
