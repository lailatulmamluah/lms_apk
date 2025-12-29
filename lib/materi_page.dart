import 'package:flutter/material.dart';
import 'home_page.dart';
import 'my_classes_page.dart';
import 'notification_page.dart';
import 'tugas_page.dart';
import 'profile_page.dart';

class MateriPage extends StatefulWidget {
  final String mataKuliah; // Nama mata kuliah yang akan ditampilkan

  const MateriPage({Key? key, required this.mataKuliah}) : super(key: key);

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 1; // Kelas Saya (index 1) selected initially

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
              color: Color(0xFF800000), // Merah tua
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
                          builder: (context) => const MyClassesPage(),
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
                      widget.mataKuliah.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18,
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

          // Sistem Tab
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 3),
                ),
              ),
              tabs: const [
                Tab(text: 'Materi'),
                Tab(text: 'Tugas Dan Kuis'),
              ],
            ),
          ),

          // Area konten tab
          Expanded(
            child: Container(
              color: Colors.white,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Tab Materi
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.separated(
                      itemCount: 5, // Jumlah pertemuan
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemBuilder: (context, index) {
                        // Data dummy untuk contoh pertemuan
                        final List<Map<String, String>> pertemuanData = [
                          {
                            'judul': 'Pendahuluan Pemrograman',
                            'metadata': '2 URLs, 1 File, 1 Interactive Content',
                          },
                          {
                            'judul': 'Struktur Data Dasar',
                            'metadata':
                                '3 URLs, 2 Files, 2 Interactive Content',
                          },
                          {
                            'judul': 'Algoritma dan Fungsi',
                            'metadata': '1 URL, 3 Files, 2 Interactive Content',
                          },
                          {
                            'judul': 'Object Oriented Programming',
                            'metadata':
                                '2 URLs, 2 Files, 3 Interactive Content',
                          },
                          {
                            'judul': 'Database Integration',
                            'metadata': '4 URLs, 1 File, 1 Interactive Content',
                          },
                        ];

                        final pertemuan = pertemuanData[index];

                        // Menentukan apakah pertemuan ini yang dipilih (untuk focus state)
                        bool isSelected =
                            index == 2; // Misalnya pertemuan ke-3 yang dipilih

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.blue
                                  : Colors.grey.shade300,
                              width: isSelected
                                  ? 3
                                  : 1, // Border tebal untuk yang dipilih
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
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Badge pertemuan
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Text(
                                            'Pertemuan ${index + 1}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        // Indikator selesai
                                        Icon(
                                          Icons.check_circle,
                                          color: index <= 2
                                              ? Colors.green
                                              : Colors
                                                    .grey, // Hijau jika selesai, abu-abu jika belum
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      pertemuan['judul']!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      pertemuan['metadata']!,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Overlay untuk menandakan bahwa ini dipilih jika memang dipilih
                              if (isSelected)
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  // Tab Tugas Dan Kuis
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.separated(
                      itemCount: 4, // Jumlah total tugas dan kuis
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
                            'judul': 'Kuis Akhir Semester',
                            'deskripsi': 'Kuis komprehensif seluruh materi',
                            'deadline': '5 Juli 2023, 23:59',
                            'status': 'Belum Dikerjakan',
                            'jenis': 'Kuis',
                          },
                        ];

                        final item = tugasKuisData[index];

                        // Menentukan apakah item ini sudah lewat deadline
                        bool isLate =
                            index ==
                            2; // Misalnya tugas ke-3 sudah lewat deadline

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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      color: isLate
                                          ? Colors.red
                                          : Colors.black54,
                                      fontWeight: isLate
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Navigasi ke halaman tugas
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TugasPage(
                                            mataKuliah: widget.mataKuliah,
                                          ),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF800000),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      item['jenis'] == 'Tugas'
                                          ? 'Lihat Tugas'
                                          : 'Kerjakan Kuis',
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
                ],
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
        backgroundColor: const Color(0xFF800000), // Merah tua background
        elevation: 10,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
      ),
    );
  }
}
