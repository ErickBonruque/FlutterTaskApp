import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _see = true;

  // List of tasks to store the current levels
  List<int> _taskLevels = List.generate(5, (index) => 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Teste",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Container(
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.only(left: 60),
            child: const Text(
              "Tarefas",
              style: TextStyle(fontSize: 25),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 30),
              child: IconButton(
                onPressed: _resetLevels,
                icon: const Icon(Icons.refresh, size: 30),
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.deepPurpleAccent,
                ),
                child: const DrawerHeader(
                  child: Text(
                    'Configurações',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: ListTile(
                  title: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onPressed: () {
                      // Implementar ação para a opção 1
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'Opção 1',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),


                ),
              ),
              ListTile(
                title: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    // Implementar ação para a opção 1
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Opção 2',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),

              ),
              ListTile(
                title: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    // Implementar ação para a opção 1
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Opção 3',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),

              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _see = !_see;
            });
          },
          backgroundColor: Colors.blue.withOpacity(0.6),
          child: const Icon(Icons.remove_red_eye_outlined),
        ),
        body: Container(
          color: Colors.black38,
          child: ListView(
            children: [
              Container(),
              AnimatedOpacity(
                opacity: _see ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    Task("Tarefa 1",
                        level: _taskLevels[0],
                        onLevelUp: () => _levelUpTask(0),
                        difi: 5),
                    Task("Tarefa 2",
                        level: _taskLevels[1],
                        onLevelUp: () => _levelUpTask(1),
                        difi: 2),
                    Task("Tarefa 3",
                        level: _taskLevels[2],
                        onLevelUp: () => _levelUpTask(2),
                        difi: 4),
                    Task("Tarefa 4",
                        level: _taskLevels[3],
                        onLevelUp: () => _levelUpTask(3),
                        difi: 4),
                    Task("Tarefa 5",
                        level: _taskLevels[4],
                        onLevelUp: () => _levelUpTask(4),
                        difi: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetLevels() {
    setState(() {
      _taskLevels = List.generate(5, (index) => 0);
    });
  }

  void _levelUpTask(int taskIndex) {
    setState(() {
      if (_taskLevels[taskIndex] < 10) {
        _taskLevels[taskIndex]++;
      }
    });
  }
}

class Task extends StatefulWidget {
  final String name;
  final int level;
  final VoidCallback onLevelUp;
  final int difi;

  const Task(this.name,
      {required this.level, required this.onLevelUp, required this.difi, Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomEnd,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.deepPurpleAccent,
            ),
            width: double.infinity,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 280,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    value: widget.level / 10,
                  ),
                ),
                Text(
                  "Nível: ${widget.level}",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black12,
                  ),
                  width: 100,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 15, color: Colors.blue),
                          Icon(Icons.star, size: 15,
                              color: (widget.difi >= 2)
                                  ? Colors.blue
                                  : Colors.blue.withOpacity(0.3)),
                          Icon(Icons.star, size: 15,
                              color: (widget.difi >= 3)
                                  ? Colors.blue
                                  : Colors.blue.withOpacity(0.3)),
                          Icon(Icons.star, size: 15,
                              color: (widget.difi >= 4)
                                  ? Colors.blue
                                  : Colors.blue.withOpacity(0.3)),
                          Icon(Icons.star, size: 15,
                              color: (widget.difi == 5)
                                  ? Colors.blue
                                  : Colors.blue.withOpacity(0.3)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: widget.onLevelUp,
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                    ),
                    child: const SizedBox(
                      height: 60,
                      width: 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.arrow_drop_up),
                          Text(
                            'Lvl Up',
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}