import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blueGrey,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            color: Colors.grey[500],
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: TextStyle(fontSize: 14, color: Colors.grey[700]),
          bodySmall: TextStyle(fontSize: 12, color: Colors.grey[500]),
        ),
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        elevation: 0,
        title: Text('Profil'),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: Icon(Icons.arrow_back_ios, color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Background
            Container(
              height: 180,
              color: Colors.blueGrey[700],
              child: Center(
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    'https://3.bp.blogspot.com/-Jv3P7sKT4vc/VSed0F_2NeI/AAAAAAAAALE/7apsl216e2Q/s1600/bayi%2Blucu%2B8.jpg', // Ganti URL sesuai gambar profil
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Username and Location
            Text(
              'Akmal AdiCandra',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              'Purwokerto | Joined September 2024',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
            ),
            SizedBox(height: 12),

            // Bio
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'CEO Riverstreet, Because your satisfaction is everything & Standing out from the rest, and that’s what we want you to be as well.',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      height: 1.4,
                      fontSize: 15,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),

            // Buttons: Follow, Message, More
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 48, 60, 66)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                      onPressed: () {
                        // Aksi Follow
                      },
                      child: Text(
                        'Follow',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(color: Colors.blueGrey[700]!, width: 2),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                      onPressed: () {
                        // Aksi Message
                      },
                      child: Text(
                        'Message',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey[700],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.more_horiz, color: Colors.black),
                      onPressed: () {
                        // Aksi More
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Information Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    InfoItem(
                      icon: Icons.language,
                      label: 'Website',
                      value: 'www.riverstreet.com',
                    ),
                    Divider(thickness: 1, indent: 15, endIndent: 15),
                    InfoItem(
                      icon: Icons.email,
                      label: 'Email',
                      value: 'akmal67e@gmail.com',
                    ),
                    Divider(thickness: 1, indent: 15, endIndent: 15),
                    InfoItem(
                      icon: Icons.phone,
                      label: 'Phone',
                      value: '+62 878 238 782 518',
                    ),
                    Divider(thickness: 1, indent: 15, endIndent: 15),
                    InfoItem(
                      icon: Icons.calendar_today,
                      label: 'Joined',
                      value: '26 September, 2024',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Skills with Box Border
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueGrey, width: 1),
                ),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    SkillTag('UI Designer'),
                    SkillTag('UX Designer'),
                    SkillTag('Design System'),
                    SkillTag('Product'),
                    SkillTag('Successful'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  InfoItem({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey[700], size: 28),
          SizedBox(width: 15),
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class SkillTag extends StatelessWidget {
  final String label;

  SkillTag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.blueGrey[700],
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
