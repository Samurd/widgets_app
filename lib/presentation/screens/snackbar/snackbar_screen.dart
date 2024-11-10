import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Snackbar and Dialogs"),
        ),
        body: _SnackbarView());
  }
}

class _SnackbarView extends StatelessWidget {
  const _SnackbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text("Widgets in Flutter"),
                  ]
                  );
              }, child: const Text("Used licensing")),


          const SizedBox(height: 20),


          FilledButton.tonal(
              onPressed: () {
                showDialog(context: context, builder: (context) => AlertDialog(
                  title: const Text("Title"),
                  content: const Text("Content"),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                    FilledButton(onPressed: () => Navigator.pop(context), child: const Text("Ok"))
                  ],
                ));
              }, child: const Text("Show Alert Dialog")),

          Switch(value: false, onChanged: (value) {})

        ],
      ),
    );
  }
}
