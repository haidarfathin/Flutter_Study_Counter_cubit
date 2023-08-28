import 'package:cubit_counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Counter Cubit'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.isIncrement == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue % 2 == 0 && state.counterValue != 0) {
                  return Column(
                    children: [
                      const Text('Kamu menemukan angka GENAP!'),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.counterValue.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  );
                } else if (state.counterValue < 0) {
                  return Column(
                    children: [
                      const Text('Kamu menemukan angka NEGATIF!'),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.counterValue.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  );
                } else if (state.counterValue == 0) {
                  return Column(
                    children: [
                      const Text('Kamu menemukan angka 0!'),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.counterValue.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      const Text('Kamu menemukan angka GANJIL!'),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.counterValue.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  );
                }
              },
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'decrement',
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'increment',
                  child: const Icon(
                    Icons.add,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
