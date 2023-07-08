import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: massages(),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class massages extends StatelessWidget {
  const massages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Messages",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return massagesItem();
          }
      ),
    );
  }

  Widget massagesItem(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
              child: CircleAvatar(
                radius: 30,
                backgroundImage:
                NetworkImage('https://picsum.photos/id/237/200/300'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Claire",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      ),
                      SizedBox(width: 10,),
                      Text("20:18"),
                    ],
                  ),
                  SizedBox(
                    width: 240,
                    child: Text("How about meeting ?aaaaaaaaaaaaaaaaaaaaaaaa",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black38
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.navigate_next)),
          ],
        ),
        Divider(
          color: Colors.black12,
          thickness: 1,
        ),
      ],
    ),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final textFieldFocusNode = FocusNode();
  bool _obscured = false;
  bool isChecked = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Register",
          style: TextStyle(
              color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            onPressed: () {} ,
            icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.blue),
                    ),
                    labelText: 'Phone number',
                    labelStyle: TextStyle(
                      color: Colors.black38
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black38,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.blue),
                    ),
                    labelText: 'Address',
                    labelStyle: TextStyle(
                        color: Colors.black38
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      color: Colors.black38,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.blue),
                    ),
                    labelText: 'Company Name',
                    labelStyle: TextStyle(
                        color: Colors.black38
                    ),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Colors.black38,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.blue),
                      ),
                      labelText: 'Website name',
                      labelStyle: TextStyle(
                          color: Colors.black38
                      ),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.web,
                        color: Colors.black38,
                      )),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.blue),
                      ),
                      labelText: 'Email adress',
                      labelStyle: TextStyle(
                          color: Colors.black38
                      ),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black38,
                      )),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscured,
                  focusNode: textFieldFocusNode,
                  decoration:  InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.blue),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.black38
                      ),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.black38,
                      ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: GestureDetector(
                        onTap: _toggleObscured,
                        child: Icon(
                          _obscured
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          size: 24,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged:  (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                    ),
                    Text("I agree with"),
                    SizedBox(width: 10,),
                    Text("Terms and conditions",
                    style: TextStyle(
                        color: Colors.blue
                    ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(color: Colors.blue)),
                        onPressed: () {},
                        child: const Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 10,),
                    Text("Log in",
                      style: TextStyle(
                          color: Colors.blue
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
