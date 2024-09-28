import 'package:bloc_pattern_mvp/src/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_pattern_mvp/src/blocs/internet_bloc/internet_state.dart';
import 'package:bloc_pattern_mvp/src/modules/product_home/product_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screeen'),
        ),
        body: Column(
          children: [
            Center(
                child: state is InternetGainedState
                    ? const Text('Internet Connected')
                    : state is InternetLostState
                        ? const Text('InternetLost')
                        : const Text('Loading')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductHome()),
                  );
                },
                child: const Text('Product screen'))
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BottomTabWidget(),
                        BottomTabWidget(),
                        BottomTabWidget(),
                        BottomTabWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //     FloatingActionButton(
        //   onPressed: () {
        //     setState(() {
        //       _selectedIndex = 2;
        //     });
        //   },
        //   child: Icon(Icons.add),
        //   backgroundColor: Colors.blue,
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}

class BottomTabWidget extends StatelessWidget {
  const BottomTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.red,
      ),
    );
  }
}
