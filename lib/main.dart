// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student BioData',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? name, f_name;
  int? cnic, age;

  String std_name = "Student Name:";
  String father_Name = " Father Name:";
  String std_cnic = "CNIC:";
  String std_Age = "AGE:";


  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BioData Project')),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      ' STUDENT BIO DATA',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Enter Student Name:',
                      //filled: true,
                      //fillColor: Colors.blueGrey,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 4,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (txt) {
                      if (txt == null || txt.length < 5) {
                        return ' Provide Student Name ';
                      }
                      name = txt;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Enter S/Father Name:',
                      //filled: true,
                      //fillColor: Colors.blueGrey,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 4,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (txt) {
                      if (txt == null || txt.length < 5) {
                        return ' Provide S/Father Name ';
                      }
                      f_name = txt;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Student CNIC:',
                      //filled: true,
                      //fillColor: Colors.blueGrey,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 4,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (txt) {
                      if (txt == null || txt.isEmpty) {
                        return 'Provide Student  CNIC Number';
                      }
                      cnic = int.parse(txt);

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    decoration: InputDecoration(
                      hintText: "Enter Student Age:",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 4,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (txt) {
                      if (txt == null || txt.isEmpty) {
                        return 'Provide Student Age ';
                      }
                      age = int.parse(txt);

                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            formKey.currentState!.reset();
                            setState(() {
                              std_name = '';
                              father_Name = '';
                              std_cnic = '';
                              std_Age = '';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: const Text(
                            'Clear',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Fluttertoast.showToast(
                                msg: "Valid",
                                backgroundColor: Colors.green,
                              );


                              setState(() {

                              std_name = "Student Name: $name";
                              father_Name = "Father Name: $f_name";
                              std_cnic = "CNIC: $cnic";
                              std_Age = "AGE: $age";
                              });
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Invalid', backgroundColor: Colors.red);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          child: const Text(
                            'Show',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(std_name, style: const TextStyle(fontSize: 20, ),
                  ),
                  Text(father_Name, style: const TextStyle(fontSize: 20,),
                  ),
                  Text(std_cnic, style: const TextStyle(fontSize: 20,),
                  ),
                  Text(std_Age, style: const TextStyle(fontSize: 20,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
