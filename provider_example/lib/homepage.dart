import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/horizontal_page.dart';
import 'package:provider_example/provider_class.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
        builder: ((context, NumberProviderModel, child) => Scaffold(
              appBar: AppBar(),
              body: SizedBox(
                child: Column(
                  children: [
                    Text(
                      NumberProviderModel.numbers.last.toString(),
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                        child: ListView.builder(
                            itemCount: NumberProviderModel.numbers.length,
                            itemBuilder: (context, index) {
                              return Center(
                                  child: Text(
                                      NumberProviderModel.numbers[index]
                                          .toString(),
                                      style: const TextStyle(fontSize: 20)));
                            })),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HorizontalPage()));
                        },
                        child: const Text('Horizontal View')),
                    const SizedBox(height: 25)
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  NumberProviderModel.add();
                },
                child: const Icon(Icons.add),
              ),
            )));
  }
}
