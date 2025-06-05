import 'package:flutter/material.dart';

void main() {
  runApp(const FinTrackProApp());
}

// PUBLIC_INTERFACE
class FinTrackProApp extends StatelessWidget {
  /// Root widget of the FinTrackPro application.
  const FinTrackProApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define theme colors from specification.
    const primaryColor = Color(0xFF2E86AB);
    const secondaryColor = Color(0xFFF6F7EB);
    const accentColor = Color(0xFFF26419);

    return MaterialApp(
      title: 'FinTrackPro',
      // ThemeData with custom colors as per requirements.
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: accentColor,
          surface: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
        ),
        scaffoldBackgroundColor: secondaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 1.0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: accentColor,
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const MainContainer(),
    );
  }
}

/// MainContainer provides the skeleton for the navigation and layout of FinTrackPro.
/// Contains routes/views for dashboard, add transaction, reports, budgets and categorization.
class MainContainer extends StatefulWidget {
  /// Main container housing tab navigation for the core features.
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  // Tracks the current tab.
  int _currentIndex = 0;

  // List of pages (stubs for now; to be implemented in detail).
  final List<Widget> _pages = const [
    DashboardPage(),
    AddTransactionPage(),
    ReportsPage(),
    BudgetsPage(),
    CategoriesPage(),
  ];

  // Navigation bar items for bottom navigation.
  static const List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard_rounded),
      label: "Dashboard",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_circle_outline),
      label: "Add",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.show_chart),
      label: "Reports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_balance_wallet),
      label: "Budgets",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: "Categories",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FinTrackPro', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 2.0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey[600],
        currentIndex: _currentIndex,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        type: BottomNavigationBarType.fixed,
        items: _navItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// PUBLIC_INTERFACE
class DashboardPage extends StatelessWidget {
  /// Displays the dashboard summary with income, expenses, savings, charts, and recent transactions.
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // TODO: Integrate with real data
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Row: Total Income, Expenses, Savings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _SummaryCard(
                  label: "Income",
                  value: "\$2,400",
                  color: theme.colorScheme.primary,
                  icon: Icons.arrow_downward,
                ),
                _SummaryCard(
                  label: "Expenses",
                  value: "\$1,450",
                  color: theme.colorScheme.secondary,
                  icon: Icons.arrow_upward,
                ),
                _SummaryCard(
                  label: "Savings",
                  value: "\$950",
                  color: theme.colorScheme.primary.withAlpha(100),
                  icon: Icons.savings,
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              "Spending Trends",
              style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _TrendsChartPlaceholder(),
            const SizedBox(height: 28),
            Text(
              "Recent Transactions",
              style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _RecentTransactionsListPlaceholder(),
          ],
        ),
      ),
    );
  }
}

// PUBLIC_INTERFACE
class AddTransactionPage extends StatelessWidget {
  /// UI for adding new income or expense transactions
  const AddTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder; to be implemented with real form & logic.
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_circle, size: 80, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          const Text("Add Transaction", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Add income or expense with details.", textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// PUBLIC_INTERFACE
class ReportsPage extends StatelessWidget {
  /// Shows visual reports and charts for spending trends, income vs expenses, etc.
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder; to be implemented with real chart widgets.
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.stacked_line_chart_outlined, size: 80, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          const Text("Reports & Charts", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Visualize your spending and income trends.", textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// PUBLIC_INTERFACE
class BudgetsPage extends StatelessWidget {
  /// Enables users to manage and set budgets
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder; to be implemented with budget management logic.
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_balance_wallet_outlined, size: 80, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          const Text("Budgets", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Set your monthly or category-wise budgets.", textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// PUBLIC_INTERFACE
class CategoriesPage extends StatelessWidget {
  /// Allows users to categorize transactions.
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder; to be implemented with categorization logic.
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.category_outlined, size: 80, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          const Text("Categories", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Assign and manage transaction categories.", textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

/// PRIVATE: Visual summary card for dashboard KPIs.
class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;
  const _SummaryCard({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: color,
      child: Container(
        width: 105,
        height: 105,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

/// PRIVATE: Placeholder for the trends chart.
class _TrendsChartPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: 130,
        alignment: Alignment.center,
        child: Text(
          "Charts coming soon...",
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
    );
  }
}

/// PRIVATE: Placeholder for the recent transactions list/table.
class _RecentTransactionsListPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: List.generate(3, (i) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: i == 0 ? Colors.green : (i == 1 ? Colors.red : Colors.orange),
              child: Icon(
                i == 0 ? Icons.arrow_downward : Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
            title: Text(
              i == 0
                  ? "Salary"
                  : (i == 1 ? "Groceries" : "Dining Out"),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '2024-06-15',
              style: TextStyle(color: Colors.grey[600]),
            ),
            trailing: Text(
              i == 0 ? "+\$2,000" : "-\$80",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: i == 0 ? Colors.green[700] : Colors.red[700],
              ),
            ),
          );
        }),
      ),
    );
  }
}
