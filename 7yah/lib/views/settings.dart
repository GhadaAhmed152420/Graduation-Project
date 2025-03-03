import 'package:flutter/material.dart';

import '../cubit/app/cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.language_outlined,
                      color: Colors.teal,
                    ),
                  ),
                  Text("Language"),
                  Spacer(),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Divider(
                thickness: 1,
                height: 1,
                color: Colors.white70,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.dark_mode,
                      color: Colors.teal,
                    ),
                  ),
                  const Text("Dark Mode"),
                  const Spacer(),
                  Switch(
                      value: AppCubit.get(context).isDark,
                      onChanged: (state) {
                        setState(() {
                          AppCubit.get(context).changeAppMode();
                          AppCubit.get(context).isDark = state;
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Divider(
                thickness: 1,
                height: 1,
                color: Colors.white70,
              ),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
