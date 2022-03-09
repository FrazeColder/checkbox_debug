import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: FormBuilder(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormBuilderTextField(
                  name: 'username',
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                ),
                const SizedBox(height: 30),
                FormBuilderCheckbox(
                  name: 'accept_terms1',
                  initialValue: false,
                  title: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'This works',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  validator: FormBuilderValidators.required(context),
                ),
                FormBuilderCheckbox(
                  name: 'accept_terms2',
                  initialValue: false,
                  title: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'This does NOT works ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              const url = "https://google.de";
                              if (await canLaunch(url)) {
                                launch(url, forceWebView: true);
                              }
                            },
                        ),
                      ],
                    ),
                  ),
                  validator: FormBuilderValidators.required(context),
                ),
                const SizedBox(height: 50),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text:
                            'But it works when being by itself without the FormBuilderCheckbox ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            const url = "https://google.de";
                            if (await canLaunch(url)) {
                              launch(url, forceWebView: true);
                            }
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
