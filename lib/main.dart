import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Main App widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner.
      theme: ThemeData(primarySwatch: Colors.blue), // Global theme of the app.
      home: const LoginPage(), // Set the login page as the home screen.
    );
  }
}

// StatefulWidget for the login page.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  // Declare animation controller and animation for logo scaling.
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a duration of 500 ms.
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Create a bouncing animation effect for the logo.
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut, // Apply bounce curve to make the animation feel bouncy.
    );

    // Listen to animation progress and rebuild the widget on each frame.
    _iconAnimation.addListener(() => setState(() {}));

    // Start the animation when the page loads.
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set dark background color for the login screen.
      body: Stack(
        fit: StackFit.expand, // Make the stack expand to fill the whole screen.
        children: <Widget>[
          // Background image with a dark overlay for contrast.
          Image.asset(
            "assets/images/girl.jpeg",
            fit: BoxFit.cover, // Ensure the image covers the screen.
            color: Colors.black54, // Apply a semi-transparent dark overlay.
            colorBlendMode: BlendMode.darken, // Darken the image to enhance visibility.
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center, // Vertically center the content.
            children: <Widget>[
              // Animated Flutter Logo (size changes with the animation).
              FlutterLogo(
                size: _iconAnimation.value * 100.0, // Animate the size of the logo.
              ),
              // Login form with styled input fields and button.
              Form(
                child: Theme(
                  // Apply dark theme for the form elements.
                  data: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: const InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.teal, // Use teal color for label text.
                        fontSize: 20.0, // Set font size of label text.
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(40.0), // Add padding for the form.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Email input field with basic validation.
                        TextFormField(
                          decoration: const InputDecoration(labelText: "Enter Email"),
                          keyboardType: TextInputType.emailAddress, // Email input type.
                        ),
                        // Password input field with hidden text.
                        TextFormField(
                          decoration: const InputDecoration(labelText: "Enter Password"),
                          keyboardType: TextInputType.text, // Text input type.
                          obscureText: true, // Hide password input.
                        ),
                        const Padding(padding: EdgeInsets.only(top: 40.0)), // Space between fields and button.
                        // Styled login button.
                        MaterialButton(
                          height: 50.0, // Increased button height for better touch experience.
                          minWidth: 200.0, // Set minimum width to make the button more prominent.
                          color: Colors.teal, // Button color.
                          textColor: Colors.white, // Text color for the button.
                          splashColor: Colors.blueAccent, // Splash color when the button is pressed.
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0), // Rounded corners for the button.
                          ),
                          onPressed: () {
                            // Handle login button press here.
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18.0, // Font size of the button text.
                              fontWeight: FontWeight.bold, // Make the text bold.
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
