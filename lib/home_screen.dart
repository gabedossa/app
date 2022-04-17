import 'package:app/dashboard_screen.dart';
import 'package:app/first_page.dart';
import 'package:app/second_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  List<Widget> pageList = [];
  @override
  void initState() {
    pageList.add(const FirstPage());
    pageList.add(const SecondPage());
    pageList.add(const DashBoardScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Condominio'),
        backgroundColor: Colors.red[600],
      ),
      body: IndexedStack(
        children: pageList,
        index: _selectedPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: _onItemTepped,
        backgroundColor: Colors.grey[300],
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Categorias'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
      ]),
    );
  }
  void _onItemTepped(int index){
    setState(() {
    _selectedPage = index;  
    });
  }
}
