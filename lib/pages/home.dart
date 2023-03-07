import 'package:bad_names/models/models.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textcontroller = TextEditingController();

  List<Band> bands = [
    Band(id: '1', name: 'Alberto', votes: 2),
    Band(id: '2', name: 'Alvaro', votes: 3),
    Band(id: '3', name: 'Alfredo', votes: 4),
    Band(id: '4', name: 'Amritsar', votes: 5),
    Band(id: '5', name: 'Andrea', votes: 6),
    Band(id: '6', name: 'Anaheim', votes: 7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Socket IO'),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              
              print('direccion  :$direction');
              print(bands[index].id);
            },
            key: Key(bands[index].id),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(bands[index].name.substring(0, 2)),
              ),
              title: Text(bands[index].name),
              trailing: Text(bands[index].votes.toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_reaction_sharp),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Nuevo usuario'),
                  content: TextField(
                    controller: textcontroller,
                  ),
                  actions: [
                    MaterialButton(
                      child: const Text('Agregar'),
                      onPressed: () {
                        bands.add(Band(
                            id: DateTime.now().toString(),
                            name: textcontroller.text,
                            votes: 3));
                        setState(() {});
                      },
                    )
                  ],
                );
              });
        },
      ),
    );
  }
}
