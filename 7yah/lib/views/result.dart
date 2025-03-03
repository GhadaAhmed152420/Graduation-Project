import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    Key? key,
    required this.status,
    required this.type,
    required this.description,
  }) : super(key: key);
  final String status;
  final String type;
  final String description;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Result Screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/result.png'),
                  ),
                  const Text(
                    'Status',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.teal),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(widget.status),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    'Type',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.teal),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(widget.type),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.teal),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(widget.description),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
