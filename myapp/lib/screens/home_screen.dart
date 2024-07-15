import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/data/user_model.dart';
import 'package:myapp/screens/apply_now_screen.dart';
import 'package:myapp/services/data_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _searchController = TextEditingController();
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    fetchUsersData();
  }

  Future<void> fetchUsersData() async {
    try {
      List<User> users = await fetchUsers();
      setState(() {
        _users = users;
      });
    } catch (e) {
      print(e); // Handle the exception properly, maybe show a snackbar or alert
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Text("Welcome!"),
                trailing: CircleAvatar(),
                subtitle: Text("Experience the Eternity"),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search items",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      primaryColor,
                      const Color.fromARGB(255, 77, 176, 60),
                      secondaryColor
                    ]),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Looking for dream internship?",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Click Below and grab your internship now ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ApplyNowScreen()));
                          },
                          child: Text("Apply Now"))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Available Internships",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap:
                    true, // This ensures the GridView takes the height it needs
                physics:
                    NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                children: _users.map<Widget>((user) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 237, 237, 237),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images.jpeg",
                          height: 100,
                          width: 200,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Wordpress',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ApplyNowScreen()));
                            },
                            child: Text(
                              "Apply Now",
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ))
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
