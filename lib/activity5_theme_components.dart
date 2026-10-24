
 // Activity 5: Customizing UI components with a theme
import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const ThemeDemoApp());
}

// 1. The app is Stateful because the dark-mode switch changes the theme
class ThemeDemoApp extends StatefulWidget {
  const ThemeDemoApp({super.key});

  @override
  State<ThemeDemoApp> createState() => _ThemeDemoAppState();
}

class _ThemeDemoAppState extends State<ThemeDemoApp> {
  bool _isDark = false;

  void _setDark(bool value) {
    setState(() {
      _isDark = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 5',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(Brightness.light),
      darkTheme: buildTheme(Brightness.dark),
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: SettingsPage(
        isDark: _isDark,
        onDarkChanged: _setDark,
      ),
    );
  }
}

// 2. One place to customize the look of the WHOLE app
ThemeData buildTheme(Brightness brightness) {
  return ThemeData(
    colorSchemeSeed: studentColor,
    brightness: brightness,
    appBarTheme: const AppBarTheme(centerTitle: true),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
      ),
    ),
  );
}

// 3. The page receives the data and a callback from its parent
class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
    required this.isDark,
    required this.onDarkChanged,
  });

  final bool isDark;
  final ValueChanged<bool> onDarkChanged;

  void _showMessage(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 5 - $studentName'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 4. Card + ListTile: a ready-made row layout
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: colors.primary,
                foregroundColor: colors.onPrimary,
                child: const Icon(Icons.person),
              ),
              title: const Text(studentName),
              subtitle: Text('Theme color: $studentColorName'),
              trailing: const Icon(Icons.verified),
            ),
          ),

          const SizedBox(height: 16),

          // 5. A switch that changes the theme of the whole app
          Card(
            child: SwitchListTile(
              title: const Text('Dark mode'),
              subtitle: const Text(
                'Switch between light and dark theme',
              ),
              secondary: const Icon(Icons.dark_mode),
              value: isDark,
              onChanged: onDarkChanged,
            ),
          ),

          const SizedBox(height: 16),

          // 6. Chips and Wrap
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preferences',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      Chip(
                        avatar: Icon(Icons.palette),
                        label: Text('Theme'),
                      ),
                      Chip(
                        avatar: Icon(Icons.widgets),
                        label: Text('Widgets'),
                      ),
                      Chip(
                        avatar: Icon(Icons.phone_android),
                        label: Text('Mobile'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 7. Three kinds of buttons and a SnackBar
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Actions',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      _showMessage(context, 'Settings saved!');
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save Settings'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () {
                      _showMessage(context, 'Edit action selected.');
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profile'),
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: () {
                      _showMessage(context, 'Help selected.');
                    },
                    icon: const Icon(Icons.help_outline),
                    label: const Text('Help'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
