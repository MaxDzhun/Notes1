import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String _userToDo;
  List toDoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toDoList.addAll(['приклад№1','приклад№2','приклад№3']);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
        ),
        body: ListView.builder(
            itemCount:toDoList.length,//кількість
            itemBuilder:(BuildContext contex ,int index){ //що знаходиться всередині
              return Dismissible(
                key: Key(toDoList[index]),
                child: Card(
                    child:ListTile(
                        title: Text(toDoList[index]),
                      trailing: IconButton(
                        icon:Icon(
                          Icons.delete_sweep,
                      color: Colors.blue
                    ),
                    onPressed: (){
                          setState(() {
                            toDoList.removeAt(index);
                          });
                        },
                    ),
                  ),
                ),
                onDismissed: (direction){
                  setState(() {
                    toDoList.removeAt(index);
                  });
                }
              );
            }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                  title: Text('додати нотатку'),
                  content: TextField(
                    onChanged: (String value){
                      _userToDo = value;
                    },
                  ),
                actions: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      toDoList.add(_userToDo);
                    });
                    Navigator.of(context).pop();
              }, child: Text('додати'))
                ],
                );
            });
          },
          child: Icon(
            Icons.add_box,
            color: Colors.white
          )
        ),
    );
  }
}
