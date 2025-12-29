import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'notification_page.dart';
import 'materi_page.dart';

class MyClassesPage extends StatefulWidget {
  const MyClassesPage({super.key});

  @override
  State<MyClassesPage> createState() => _MyClassesPageState();
}

class _MyClassesPageState extends State<MyClassesPage> {
  int _selectedIndex = 1; // Kelas Saya is selected
  String _userName = 'Pengguna'; // Default value

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('user_name');
    if (name != null) {
      setState(() {
        _userName = name;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi ke halaman lain jika diperlukan
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (index == 1) {
      // Tetap di halaman kelas saya
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NotificationPage()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          surfaceTintColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Kelas Saya',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(height: 1, color: Colors.grey.shade300),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 15.0),
          itemCount: 3, // Jumlah kelas
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            // Data dummy untuk contoh
            final List<Map<String, String>> classData = [
              {
                'year': '2021/2',
                'name': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                'code': 'D4SM-42-03 [ADY]',
                'progress': '89',
              },
              {
                'year': '2021/2',
                'name': 'PEMROGRAMAN BERORIENTASI OBJEK',
                'code': 'D4SM-41-02 [BUDI]',
                'progress': '75',
              },
              {
                'year': '2021/2',
                'name': 'BASIS DATA',
                'code': 'D4SM-40-01 [SARI]',
                'progress': '92',
              },
            ];

            final classItem = classData[index];

            return GestureDetector(
              onTap: () {
                // Navigasi ke halaman materi dengan meneruskan nama mata kuliah
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MateriPage(mataKuliah: classItem['name']!),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Thumbnail: Gambar persegi di sisi kiri
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F0FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.book, color: Colors.blue, size: 30),
                    ),
                    const SizedBox(width: 12),
                    // Informasi Teks
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tahun akademik
                          Text(
                            classItem['year']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          // Nama Mata Kuliah (Bold, Kapital)
                          Text(
                            classItem['name']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          // Kode Kelas/Dosen
                          Text(
                            classItem['code']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Progress Bar
                          Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: LinearProgressIndicator(
                                    value:
                                        double.parse(classItem['progress']!) /
                                        100,
                                    minHeight: 6,
                                    backgroundColor:
                                        Colors.grey[300], // Abu-abu muda
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Color(0xFF800000), // Merah marun
                                        ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Teks persentase
                              Text(
                                '\${classItem["progress"]}% Selesai',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.white : Colors.grey[400],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              color: _selectedIndex == 1 ? Colors.white : Colors.grey[400],
            ),
            label: 'Kelas Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: _selectedIndex == 2 ? Colors.white : Colors.grey[400],
            ),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 3 ? Colors.white : Colors.grey[400],
            ),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF800000), // Maroon background
        elevation: 10,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
      ),
    );
  }
}
