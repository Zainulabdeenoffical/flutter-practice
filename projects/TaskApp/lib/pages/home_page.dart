import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late  double  _deviceHeight,_deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight  * 0.15,
        title: Text('Task App',style: TextStyle(fontSize: 25),),
      ),
      body: _taskList(),
      floatingActionButton:TaskAddActionButoon() ,
    );
  }
  Widget _taskList(){
    return ListView(
      children: [
        ListTile(
          title: Text("Do Laundary",style: TextStyle(decoration: TextDecoration.lineThrough,),
          ),
    subtitle: Text(DateTime.now().toString()),
          trailing: Icon(Icons.check_box_outlined,
          color: Colors.red)
          ,

        )
        
      ],
    );
  }
  Widget  TaskAddActionButoon(){
    return FloatingActionButton(onPressed: (){},
    child:Icon(Icons.add),);

  }
}
