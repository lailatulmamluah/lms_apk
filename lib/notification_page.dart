import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'my_classes_page.dart';
import 'profile_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 2; // Notifikasi is selected
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyClassesPage()),
      );
    } else if (index == 2) {
      // Tetap di halaman notifikasi
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF800000), // Merah marun
        title: const Text(
          'Notifikasi',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF800000), // Merah marun
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, $_userName!',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Anda memiliki 3 notifikasi baru',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Notifikasi Terbaru',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: 5, // Jumlah notifikasi dummy
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  // Data dummy untuk contoh notifikasi
                  final List<Map<String, String>> notificationData = [
                    {
                      'title': 'Tugas Baru: UID Android Mobile Game',
                      'subtitle': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                      'time': '10 menit yang lalu',
                      'icon': 'assignment',
                    },
                    {
                      'title': 'Pengumuman: Jadwal UAS Semester Genap',
                      'subtitle': 'Pengumuman penting dari admin',
                      'time': '1 jam yang lalu',
                      'icon': 'announcement',
                    },
                    {
                      'title': 'Deadline: Tugas Pemrograman Minggu Ini',
                      'subtitle': 'PEMROGRAMAN BERORIENTASI OBJEK',
                      'time': '2 jam yang lalu',
                      'icon': 'schedule',
                    },
                    {
                      'title': 'Pengumpulan Tugas Berhasil',
                      'subtitle': 'Tugas 01 - UID Android Mobile Game',
                      'time': '1 hari yang lalu',
                      'icon': 'check_circle',
                    },
                    {
                      'title': 'Kelas Baru Tersedia',
                      'subtitle': 'MATA KULIAH PILIHAN: ARSITEKTUR KOMPUTER',
                      'time': '2 hari yang lalu',
                      'icon': 'school',
                    },
                  ];

                  final notification = notificationData[index];
                  IconData iconData = Icons.notifications;

                  switch (notification['icon']) {
                    case 'assignment':
                      iconData = Icons.assignment;
                      break;
                    case 'announcement':
                      iconData = Icons.announcement;
                      break;
                    case 'schedule':
                      iconData = Icons.schedule;
                      break;
                    case 'check_circle':
                      iconData = Icons.check_circle;
                      break;
                    case 'school':
                      iconData = Icons.school;
                      break;
                    default:
                      iconData = Icons.notifications;
                  }

                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6F0FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            iconData,
                            color: const Color(0xFF800000), // Merah marun
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification['title']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                notification['subtitle']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                notification['time']!,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.white : Colors.grey[400],
            ),
            label: 'Beranda',
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
        backgroundColor: const Color(0xFF800000), // Merah marun background
        elevation: 10,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
      ),
    );
  }
}
