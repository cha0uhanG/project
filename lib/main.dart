import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Network.dart';
import 'Todoform.dart';
import 'animal_screen.dart';
import 'Animal_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TodoListPage(),
        '/addTodo': (context) => TodoTaskPage(),
        '/animalList': (context) => AnimalListPage(),
        '/animalDetails': (context) => AnimalDetailsPage(animalName: '',),
      },
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<dynamic> todos = [];
  List<dynamic> filteredTodos = [];
  bool loading = true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    try {
      final fetchedTodos = await APIService.fetchTodos();
      setState(() {
        todos = fetchedTodos;
        filteredTodos = List.from(todos);
        loading = false;
      });
    } catch (e) {
      print('Error fetching todos: $e');
    }
  }

  void filterTodos(String query) {
    List<dynamic> filteredList = [];
    filteredList.addAll(todos); // Copy all todos to filteredList

    if (query.isNotEmpty) {
      filteredList.retainWhere((todo) => todo['title'].toLowerCase().contains(query.toLowerCase()));
    }

    setState(() {
      filteredTodos = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Todo List',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),)),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterTodos,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search for a todo...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTodos.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(filteredTodos[index]['title']),
                  subtitle: Text('Completed: ${filteredTodos[index]['completed']}'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addTodo');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

