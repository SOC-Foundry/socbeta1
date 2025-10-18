
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SocFoundry',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey.shade900,
        fontFamily: 'Times New Roman',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey.shade900, Colors.black],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'SocFoundry',
                      style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Forging Elite Threat Detections from Data for Natalie',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                        color: Colors.tealAccent.shade100,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Divider(color: Colors.blueGrey),
                    const SizedBox(height: 40),
                    const Text(
                      "In a sea of logs, the real threats are hidden between the lines. Standard alerts generate noise, but proactive security requires a deeper, more connected approach. That's where we come in.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'At SocFoundry, we are expert Detection & Response Engineers specializing in advanced threat hunting. We don’t just manage alerts; we build the logic that finds them. By mastering the piped query languages of modern SIEMs, we weave together disparate log sources—from cloud infrastructure to endpoint activity—to construct sophisticated, high-fidelity correlation searches. We turn your security data from a reactive archive into a proactive threat hunting arsenal.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          // Contact logic would go here
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black, 
                          backgroundColor: Colors.tealAccent.shade100,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text('Partner With Us'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
