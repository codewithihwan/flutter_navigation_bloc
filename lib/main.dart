import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_navigation_bloc/cubit/my_cubit_cubit.dart';

void main() {
  runApp( BlocProvider(
    create: (context) => MyCubit(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        '/': (context) => const PageA(),
        '/pageB': (context) => const PageB(),
      },
      initialRoute: '/',
    );
  }
}

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyCubit, MyCubitState>(
      listener: (context, state) {
        if (state is StateB) {
          Navigator.of(context).pushNamed('/pageB');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Page A'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Go to PageB'),
            onPressed: () {
              context.read<MyCubit>().changeState(StateB());
            },
          ),
        ),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page B'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pop'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}