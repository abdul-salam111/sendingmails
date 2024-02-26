import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final emailcontroller = TextEditingController();
  final subjectcontroller = TextEditingController();
  final bodycontroller = TextEditingController();

  sendEmail(String emailto, String subject, String body) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [emailto],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailcontroller,
              decoration: const InputDecoration(hintText: "Mail to"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: subjectcontroller,
              decoration: const InputDecoration(hintText: "Enter subject"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: bodycontroller,
              decoration: const InputDecoration(hintText: "Enter body"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  sendEmail(
                      emailcontroller.text.toString().trim(),
                      subjectcontroller.text.toString(),
                      bodycontroller.text.toString());
                },
                child: const Text("Send mail"))
          ],
        ),
      ),
    );
  }
}
