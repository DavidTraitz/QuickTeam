import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';
import 'home.dart';
import 'about_us.dart';
import 'service.dart';
import 'locations.dart';
import 'myfav.dart';
import 'bookings.dart';
import 'settings.dart';
import 'elite_ship.dart';
import 'new_features.dart';
import 'talk_to_us.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickTeam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickTeam'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text('QuickTeam Menu', style: TextStyle(color: Colors.white)),
            ),
            _createDrawerItem(context, 'Home', const Home()),
            _createDrawerItem(context, 'About Us', const AboutUs()),
            _createDrawerItem(context, 'Service', const Service()),
            _createDrawerItem(context, 'Locations', const Locations()),
            _createDrawerItem(context, 'MyFav', const MyFav()),
            _createDrawerItem(context, 'Bookings', const Bookings()),
            _createDrawerItem(context, 'Settings', const Settings()),
            _createDrawerItem(context, 'Elite Ship', const EliteShip()),
            _createDrawerItem(context, 'New Features', const NewFeatures()),
            _createDrawerItem(context, 'Talk to Us', const TalkToUs()),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to QuickTeam!'),
      ),
    );
  }

  ListTile _createDrawerItem(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:fire1base_core/firebase_core.dart';
// import 'screens/login_screen.dart';
// import 'home.dart';
// import 'about_us.dart';
// import 'service.dart';
// import 'locations.dart';
// import 'myfav.dart';
// import 'bookings.dart';
// import 'settings.dart';
// import 'elite_ship.dart';
// import 'new_features.dart';
// import 'talk_to_us.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'QuickTeam',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       // home: const MyHomePage(title: 'QuickTeam'),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             const DrawerHeader(
//               decoration: BoxDecoration(color: Colors.deepPurple),
//               child: Text('QuickTeam Menu', style: TextStyle(color: Colors.white)),
//             ),
//             _createDrawerItem(context, 'Home', const Home()),
//             _createDrawerItem(context, 'About Us', const AboutUs()),
//             _createDrawerItem(context, 'Service', const Service()),
//             _createDrawerItem(context, 'Locations', const Locations()),
//             _createDrawerItem(context, 'MyFav', const MyFav()),
//             _createDrawerItem(context, 'Bookings', const Bookings()),
//             _createDrawerItem(context, 'Settings', const Settings()),
//             _createDrawerItem(context, 'Elite Ship', const EliteShip()),
//             _createDrawerItem(context, 'New Features', const NewFeatures()),
//             _createDrawerItem(context, 'Talk to Us', const TalkToUs()),
//           ],
//         ),
//       ),
//       home: const LoginScreen(),
      
//     );
    
//   }
// }

// class Locations {
//   const Locations();
// }

// class AboutUs {
//   const AboutUs();
// }

// class Home {
//   const Home();
// }

/* class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InterestsPage()),
            );
          },
          child: const Text('Go to Interests Page'),
        ),
      ),
    );
  }
}

class InterestsPage extends StatefulWidget {
  const InterestsPage({super.key});

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  final List<String> interests = [
    'Sports',
    'Education',
    'Cooking',
    'Travel',
    'Music',
    'Art',
    'Technology',
    'Health',
    'Finance'
  ];

  final Set<String> selectedInterests = {};

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Interests'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Select your interest',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: interests.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => toggleInterest(interests[index]),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedInterests.contains(interests[index])
                          ? Colors.blueAccent
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      interests[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/