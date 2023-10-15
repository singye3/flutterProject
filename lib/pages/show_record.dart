import 'package:flutter/material.dart';

class ShowWord extends StatefulWidget {
  const ShowWord({super.key});

  @override
  State<ShowWord> createState() => _ShowWordState();
}

class _ShowWordState extends State<ShowWord> {
  Map data = {};
  bool deleteFav = false;
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    var theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.primary,
          title: Text(
            'Favorite Word',
            style: TextStyle(color: theme.colorScheme.onPrimary),
          ),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
            onPressed: () {
              Navigator.pop(context, {'deleteFav': deleteFav});
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(data['wordName']),
              subtitle: Text(data['description']),
              leading: IconButton(
                icon: Icon(
                  deleteFav ? Icons.favorite_border : Icons.favorite,
                  color: theme.colorScheme.primary,
                  semanticLabel: deleteFav ? "Delete" : "Favorite",
                ),
                // color: Colors.red,
                onPressed: () {
                  // appState.removeFavorite(pair);
                  setState(() {
                    deleteFav = !deleteFav;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
