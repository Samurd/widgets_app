import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();


    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Widgets in Flutter"),
      ),
      body: const HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListView.builder(

      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return ListTile(
          splashColor: Colors.transparent,
          hoverColor: colors.secondaryContainer,
          leading: Icon(menuItem.icon, color: colors.primary),
          title: Text(menuItem.title),
          subtitle: Text(menuItem.subTitle),
          trailing: Icon(Icons.arrow_forward_ios_outlined, color: colors.primary),
          onTap: () {
            context.push(menuItem.link);
          },
        );
      },
    );
  }
}