import 'package:flutter/material.dart';
import 'package:hivelearning/boxes.dart';
import 'package:hivelearning/person.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 16, 70),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Hive Training",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: 180,
                  width: 450,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Name",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          controller: ageController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Age",
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            boxPersons.put(
                              "key_${nameController.text}.text",
                              Person(
                                name: nameController.text,
                                age: int.parse(ageController.text),
                              ),
                            );
                          });
                        },
                        child: const Text("add"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              height: 400,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    width: 4.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: boxPersons.length,
                  itemBuilder: (context, index) {
                    Person person = boxPersons.getAt(index);
                    return ListTile(
                      leading: IconButton(
                        onPressed: () {
                          setState(() {
                            boxPersons.deleteAt(index);
                          });
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      title: Text(person.name),
                      subtitle: const Text("Name"),
                      trailing: Text("age: ${person.age.toString()}"),
                    );
                  },
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  boxPersons.clear();
                });
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete),
                  Text("remove all"),
                ],
              ))
        ],
      ),
    );
  }
}
