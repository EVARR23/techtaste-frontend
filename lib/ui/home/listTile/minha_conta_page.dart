import 'package:flutter/material.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextFormField formField = TextFormField(
      initialValue: '',
      decoration: const InputDecoration(border: InputBorder.none),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados Pessoais'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // spacer
                  const SizedBox(height: 20),

                  // Example of TextFormFieldWrapper with position 'alone'
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    child: Text('Nome'),
                  ),
                  TextFormFieldWrapper(
                    formField: formField,
                    position: TextFormFieldPosition.alone,
                  ),

                  // spacer
                  const SizedBox(height: 20),

                  // Example of TextFormFieldWrapper with position 'alone'
                  // and with a prefix Widget
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    child: Text('E-mail'),
                  ),
                  TextFormFieldWrapper(
                    formField: formField,
                    position: TextFormFieldPosition.alone,
                    
                  ),

                  // spacer
                  const SizedBox(height: 20),

                  // Example of TextFormFieldWrapper with position 'alone'
                  // and with a suffix Widget
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    child: Text('Telefone'),
                  ),
                  TextFormFieldWrapper(
                    formField: formField,
                    position: TextFormFieldPosition.alone,
                    suffix: const Text('Suffix'),
                  ),

                  // spacer
                  const SizedBox(height: 20),

                  // Example of TextFormFieldWrapper with position 'alone'
                  // and with a prefix Widget and suffix
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    child: Text('CPF'),
                  ),
                  TextFormFieldWrapper(
                    formField: formField,
                    position: TextFormFieldPosition.alone,
                    prefix: const Text('Prefix'),
                    suffix: const Text('Suffix'),
                  ),

 
                  const SizedBox(height: 20),

                 
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    child: Text('Data de nascimento'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldWrapper(
                          formField: formField,
                          position: TextFormFieldPosition.left,
                        ),
                      ),
                      Expanded(
                        child: TextFormFieldWrapper(
                          formField: formField,
                          position: TextFormFieldPosition.right,
                        ),
                      ),
                    ],
                  ),
                 Padding(
                  padding: const EdgeInsets.all(16.0), // espaçamento em todos os lados
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('cadastrado'),
                  ),
                )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}