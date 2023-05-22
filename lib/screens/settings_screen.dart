import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/classes/theme_notifier.dart';
import 'package:flutter_projet_4a/services/sql_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isResetBookmarksLoading = false;
  bool hideNSFW = false;
  bool hideNSFWLoading = false;

  void getSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final _hideNSFW = prefs.getBool("hideNSFW");
    if (_hideNSFW != null) {
      setState(() {
        hideNSFW = _hideNSFW;
      });
    }
  }

  void setSharedPreferences(value) async {
    setState(() {
      hideNSFWLoading = true;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("hideNSFW", value);
    setState(() {
      hideNSFW = value;
      hideNSFWLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Enable dark mode"),
                Switch(
                    value: Theme.of(context).brightness == Brightness.dark,
                    onChanged: (value) {
                      Provider.of<ThemeNotifier>(context, listen: false)
                          .toggleTheme();
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Hide NSFW content"),
                Switch(
                    value: hideNSFW,
                    onChanged: hideNSFWLoading
                        ? null
                        : (value) {
                            setSharedPreferences(value);
                          })
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                  onPressed: isResetBookmarksLoading
                      ? null
                      : () async {
                          setState(() {
                            isResetBookmarksLoading = true;
                          });
                          await SQLHelper.deleteAllMangas();
                          setState(() {
                            isResetBookmarksLoading = false;
                          });
                        },
                  icon: Icon(Icons.delete),
                  label: Text("Delete favorites"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.error),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(16)))),
            ),
          ]),
        ));
  }
}
