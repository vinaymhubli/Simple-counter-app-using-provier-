import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider_class.dart';

class HorizontalPage extends StatefulWidget {
  const HorizontalPage({
    super.key,
  });

  @override
  State<HorizontalPage> createState() => _HorizontalPageState();
}

class _HorizontalPageState extends State<HorizontalPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
        builder: ((context, NumberInputElement, child) => Scaffold(
              appBar: AppBar(),
              body: SizedBox(
                child: Column(
                  children: [
                    Text(
                      NumberInputElement.numbers.last.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    Container(
                        height: 50,
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: NumberInputElement.numbers.length,
                            itemBuilder: (context, index) {
                              return Center(
                                  child: Text(
                                      NumberInputElement.numbers[index]
                                          .toString(),
                                      style: const TextStyle(fontSize: 20)));
                            }))
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  NumberInputElement.add();
                },
                child: const Icon(Icons.add),
              ),
            )));
  }
}
