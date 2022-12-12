import 'package:flutter/material.dart';

class TestingScreens extends StatefulWidget {
  Map? item;
  TestingScreens({this.item, Key? key}) : super(key: key);

  @override
  State<TestingScreens> createState() => _TestingScreensState();
}

class _TestingScreensState extends State<TestingScreens> {
  bool status = false;

  cekData(int data) {
    if (data < 200) {
      status = false;
    } else {
      status = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.item != null) {
      debugPrint("item: ${widget.item}");
      status = widget.item!['status'];
      if (widget.item!['status'] == false) {}
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: (status == false)
            ? SizedBox(
                child: Center(
                  child: Text(
                    "Mendekat ke area kantor untuk melakukan absen",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          onPressed: () => cekData(100),
                          child: const Text("button 1"),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                          onPressed: () => cekData(201),
                          child: const Text("button 1"),
                        ),
                      ],
                    ),
                    Container(
                      height: 40.0,
                      width: 200,
                      decoration: BoxDecoration(
                        color: (status == false) ? Colors.grey : Colors.red,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            24.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class FirstScreens extends StatefulWidget {
  const FirstScreens({Key? key}) : super(key: key);

  @override
  State<FirstScreens> createState() => _FirstScreensState();
}

class _FirstScreensState extends State<FirstScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page pertama"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestingScreens(
                              item: const {
                                "latitute": "15",
                                "longitute": "20",
                                "status": false
                              },
                            )),
                  ),
                  child: const Text("Pindah ke page 2"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
