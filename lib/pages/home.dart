import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {} ;

  @override
  Widget build(BuildContext context) {

    // data = ModalRoute.of(context).settings.arguments;
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    //set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png' ;
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo ;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          data['location'],
          style: TextStyle(
            letterSpacing: 3.0,
          ),
        ),
      ),
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0,0,0),
          child: SafeArea(
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                 dynamic result = await Navigator.pushNamed(context, '/Location');
                 setState(() {
                   data = {
                     'time': result['time'],
                     'location': result['location'],
                     'flag': result['flag'],
                     'isDaytime': result['isDaytime'],
                   };
                 });
                },
                  icon: Icon(Icons.edit_location,
                  color: Colors.white,
                  ),
                  label: Text('Edit Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 80.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Text(data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.orange),
                accountName: Text(
                  "Pranshu Agarwal",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("pranshuagarwal70@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Text(
                    "P",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
