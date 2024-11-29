import 'package:flutter/material.dart';

void main() {
  runApp(NutriMapApp());
}

class NutriMapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriMap',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Roboto'),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/data-collection': (context) => DataCollectionScreen(),
        '/history': (context) => HistoryScreen(),
        '/help': (context) => HelpSupportScreen(),
      },
    );
  }
}

/// LOGIN SCREEN
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to NutriMap App',
              style: TextStyle(
                color: Colors.green.shade700,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // TODO: Add Forgot Password functionality
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Forgot Password'),
                      content: Text('Password recovery is not implemented yet.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Forgot Password?'),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700),
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Add Google Sign-In functionality
              },
              icon: Icon(Icons.login, color: Colors.orange),
              label: Text('Sign in with Google'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade600),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: Text('Don’t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

/// SIGNUP SCREEN
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up to NutriMap')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

/// HOME SCREEN WITH MENU
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NutriMap App'),
        backgroundColor: Colors.green.shade700,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green.shade700),
              child: Text(
                'NutriMap Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.data_usage),
              title: Text('Collect Data'),
              onTap: () => Navigator.pushNamed(context, '/data-collection'),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('View History'),
              onTap: () => Navigator.pushNamed(context, '/history'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help & Support'),
              onTap: () => Navigator.pushNamed(context, '/help'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.orange.shade200,
            child: Center(
              child: ListTile(
                title: Text('Collect Data', textAlign: TextAlign.center),
                onTap: () => Navigator.pushNamed(context, '/data-collection'),
              ),
            ),
          ),
          Card(
            color: Colors.green.shade200,
            child: Center(
              child: ListTile(
                title: Text('View History', textAlign: TextAlign.center),
                onTap: () => Navigator.pushNamed(context, '/history'),
              ),
            ),
          ),
          Card(
            color: Colors.orange.shade200,
            child: Center(
              child: ListTile(
                title: Text('Help & Support', textAlign: TextAlign.center),
                onTap: () => Navigator.pushNamed(context, '/help'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/// DATA COLLECTION SCREEN
class DataCollectionScreen extends StatelessWidget {
  final List<String> parameters = [
    'Child Name',
    'Age (months)',
    'Weight (kg)',
    'Height (cm)',
    'MUAC (cm)',
    'BMI',
    'Z-score',
    'Province',
    'District',
    'Sector',
    'Cell',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collect Data'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ...parameters.map(
                (param) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: param,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Handle Submit
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}


/// HISTORY SCREEN
class HistoryScreen extends StatelessWidget {
  final List<String> names = [
    'Heritier',
    'Eric',
    'John',
    'Mary',
    'Emily',
    'Elysee',
    'Rose',
    'Innocent',
    'Christian',
    'Jackson'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.green.shade700,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
            subtitle: Text('Details for ${names[index]}'),
          );
        },
      ),
    );
  }
}

/// HELP & SUPPORT SCREEN
class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.email, color: Colors.orange),
            title: Text('support@nutrimap.com'),
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.green),
            title: Text('+123 456 7890'),
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.orange),
            title: Text('123 NutriMap Street, Health City'),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Your Message',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Text('Send Message'),
          ),
        ],
      ),
    );
  }
}
