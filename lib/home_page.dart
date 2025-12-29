import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'my_classes_page.dart';
import 'profile_page.dart';
import 'notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _userName =
      'Pengguna'; // Default value, will be replaced with actual user name

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi ke halaman lain jika diperlukan
    if (index == 0) {
      // Tetap di halaman home
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyClassesPage()),
      );
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

  String _getUserName() {
    // Return the stored user name
    return _userName;
  }

  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('user_name');
    if (name != null) {
      setState(() {
        _userName = name;
      });
    }
    // Jika tidak ada nama tersimpan, gunakan default
    else {
      setState(() {
        _userName = 'Pengguna';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Background container dengan rounded bottom corners
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF800000), // Merah marun solid
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30), // Rounded bottom corners
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  // Bagian Profil
                  Row(
                    children: [
                      // Teks sapaan di kiri
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hallo,',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              _getUserName(), // Fungsi untuk mendapatkan nama pengguna
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Badge profil di kanan
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            20,
                          ), // Bentuk kapsul
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Icon(
                                Icons.person,
                                size: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Tugas Yang Akan Datang Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tugas Yang Akan Datang',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                // Card Tugas Utama
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF800000), // Merah marun
                    borderRadius: BorderRadius.circular(
                      15,
                    ), // corner radius besar
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA', // Nama Matakuliah
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tugas 01 - UID Android Mobile Game', // Detail Tugas
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        // Waktu Pengumpulan terpusat
                        child: Column(
                          children: [
                            Text(
                              'Waktu Pengumpulan',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              '15 Juni 2023, 23:59', // Contoh tanggal dan jam
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Pengumuman Terakhir Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pengumuman Terakhir',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lihat Semua',
                        style: TextStyle(
                          color: Colors.blue, // Biru
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Banner Image
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFE6F0FF), // Latar belakang putih kebiruan
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: Text(
                      'Maintenance LMS',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Maintenance Pra UAS Semester Genap 2020/2021',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Progres Kelas Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Progres Kelas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                // List View untuk Progres Kelas
                ListView.separated(
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // Prevent conflicts with parent scroll
                  itemCount: 3, // Jumlah kelas
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    // Data dummy untuk contoh
                    final List<Map<String, String>> classData = [
                      {
                        'year': '2021/2',
                        'name': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                        'code': 'D4SM-42-03 [ADY]',
                        'progress': '75',
                      },
                      {
                        'year': '2021/2',
                        'name': 'PEMROGRAMAN BERORIENTASI OBJEK',
                        'code': 'D4SM-41-02 [BUDI]',
                        'progress': '60',
                      },
                      {
                        'year': '2021/2',
                        'name': 'BASIS DATA',
                        'code': 'D4SM-40-01 [SARI]',
                        'progress': '90',
                      },
                    ];

                    final classItem = classData[index];

                    return Container(
                      padding: EdgeInsets.all(12),
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
                              color: Color(0xFFE6F0FF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.book,
                              color: Colors.blue,
                              size: 30,
                            ),
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
                                  style: TextStyle(
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
                                              double.parse(
                                                classItem['progress']!,
                                              ) /
                                              100,
                                          minHeight: 6,
                                          backgroundColor:
                                              Colors.grey[300], // Abu-abu muda
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                const Color(
                                                  0xFF800000,
                                                ), // Merah marun
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
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
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
