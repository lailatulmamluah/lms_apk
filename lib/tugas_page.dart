import 'package:flutter/material.dart';
import 'home_page.dart';
import 'my_classes_page.dart';
import 'notification_page.dart';
import 'materi_page.dart';
import 'profile_page.dart';

class TugasPage extends StatefulWidget {
  final String mataKuliah; // Nama mata kuliah yang akan ditampilkan

  const TugasPage({Key? key, required this.mataKuliah}) : super(key: key);

  @override
  State<TugasPage> createState() => _TugasPageState();
}

class _TugasPageState extends State<TugasPage> with TickerProviderStateMixin {
  int _selectedIndex = 1; // Kelas Saya (index 1) selected initially

  @override
  void dispose() {
    super.dispose();
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
      body: Column(
        children: [
          // Header dengan latar belakang merah tua
          Container(
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
              color: Color(0xFF2196F3), // Biru
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                // Tombol kembali
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MateriPage(mataKuliah: widget.mataKuliah),
                        ),
                      );
                    },
                  ),
                ),
                // Judul mata kuliah di tengah
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Text(
                      'TUGAS - ${widget.mataKuliah}'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Header Tugas Yang Akan Datang
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2196F3), // Biru
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.assignment,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'TUGAS YANG AKAN DATANG',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // Area konten tab
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.separated(
                  itemCount: 7, // Jumlah total tugas dan kuis
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    // Data dummy untuk contoh tugas dan kuis dalam satu daftar
                    final List<Map<String, String>> tugasKuisData = [
                      {
                        'judul': 'Tugas 01 - Desain UI Aplikasi',
                        'deskripsi':
                            'Buat desain UI untuk aplikasi mobile dengan Figma',
                        'deadline': '15 Juni 2023, 23:59',
                        'status': 'Belum Dikumpulkan',
                        'jenis': 'Tugas',
                      },
                      {
                        'judul': 'Kuis Minggu 1 - Pengenalan UI/UX',
                        'deskripsi': 'Kuis tentang dasar-dasar UI/UX',
                        'deadline': '10 Juni 2023, 23:59',
                        'status': 'Belum Dikerjakan',
                        'jenis': 'Kuis',
                      },
                      {
                        'judul': 'Tugas 02 - Implementasi Backend',
                        'deskripsi':
                            'Buat implementasi backend dengan Node.js dan Express',
                        'deadline': '22 Juni 2023, 23:59',
                        'status': 'Belum Dikumpulkan',
                        'jenis': 'Tugas',
                      },
                      {
                        'judul': 'Kuis Minggu 2 - Prinsip Desain',
                        'deskripsi':
                            'Kuis tentang prinsip desain dan elemen visual',
                        'deadline': '17 Juni 2023, 23:59',
                        'status': 'Belum Dikerjakan',
                        'jenis': 'Kuis',
                      },
                      {
                        'judul': 'Tugas 03 - Testing Aplikasi',
                        'deskripsi':
                            'Lakukan testing aplikasi dan buat laporan testing',
                        'deadline': '29 Juni 2023, 23:59',
                        'status': 'Belum Dikumpulkan',
                        'jenis': 'Tugas',
                      },
                      {
                        'judul': 'Kuis Akhir Semester',
                        'deskripsi': 'Kuis komprehensif seluruh materi',
                        'deadline': '5 Juli 2023, 23:59',
                        'status': 'Belum Dikerjakan',
                        'jenis': 'Kuis',
                      },
                      {
                        'judul': 'Tugas 04 - Dokumentasi',
                        'deskripsi':
                            'Buat dokumentasi aplikasi dalam format PDF',
                        'deadline': '5 Juli 2023, 23:59',
                        'status': 'Belum Dikumpulkan',
                        'jenis': 'Tugas',
                      },
                    ];

                    final item = tugasKuisData[index];

                    // Menentukan apakah item ini sudah lewat deadline
                    bool isLate =
                        index == 2; // Misalnya tugas ke-3 sudah lewat deadline

                    // Menentukan warna status berdasarkan jenis dan status
                    Color statusColor = item['jenis'] == 'Tugas'
                        ? (item['status'] == 'Belum Dikumpulkan'
                              ? Colors.red
                              : Colors.green)
                        : (item['status'] == 'Belum Dikerjakan'
                              ? Colors.orange
                              : Colors.green);

                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isLate ? Colors.red : Colors.grey.shade300,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  item['judul']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: statusColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  item['status']!,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['deskripsi']!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: isLate ? Colors.red : Colors.black54,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Deadline: ${item['deadline']!}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isLate ? Colors.red : Colors.black54,
                                  fontWeight: isLate
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation
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
        backgroundColor: const Color(0xFF2196F3), // Biru background
        elevation: 10,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
      ),
    );
  }
}
