import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'my_classes_page.dart';
import 'profile_page.dart';
import 'notification_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController(
    text: 'lailatulmamluah01@gmail.com',
  );
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Background putih bersih
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28.0,
            ), // Padding kiri & kanan sekitar 24px-32px
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Header
                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Silakan masuk ke akun Anda',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 40),

                // Form Input
                // Email Input
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'lailatulmamluah01@gmail.com',
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF), // Background putih
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // Corner radius sekitar 12px
                      borderSide: const BorderSide(
                        color: Color(0xFFE0E0E0), // Border abu-abu muda
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFE0E0E0), // Border abu-abu muda
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF56BCE3), // Border biru saat fokus
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Input
                const Text(
                  'Kata Sandi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Masukkan password...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF), // Background putih
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // Corner radius sekitar 12px
                      borderSide: const BorderSide(
                        color: Color(0xFFE0E0E0), // Border abu-abu muda
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFE0E0E0), // Border abu-abu muda
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF56BCE3), // Border biru saat fokus
                        width: 2,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Link "Lupa Kata Sandi?"
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Aksi untuk lupa kata sandi
                    },
                    child: const Text(
                      'Lupa Kata Sandi?',
                      style: TextStyle(
                        color: Color(0xFF56BCE3), // Warna biru
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Tombol "Masuk" (Primary Button)
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Aksi untuk masuk - navigasi ke halaman beranda
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String? userName = prefs.getString('user_name');

                      // Pastikan nama pengguna tersimpan sebelum navigasi
                      if (userName != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      } else {
                        // Jika tidak ada nama tersimpan, tampilkan pesan kesalahan
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Akun tidak ditemukan. Silakan registrasi terlebih dahulu.',
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xFF56BCE3,
                      ), // Warna biru cerah
                      foregroundColor: Colors.white, // Warna teks putih
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Sudut membulat
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold, // Teks bold
                      ),
                    ),
                    child: const Text('Masuk'),
                  ),
                ),
                const SizedBox(height: 20),

                // Pemisah "Atau"
                Row(
                  children: [
                    Expanded(
                      child: Container(height: 1, color: Colors.grey[300]),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Atau',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    Expanded(
                      child: Container(height: 1, color: Colors.grey[300]),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Tombol "Masuk Dengan Google" (Secondary/Outline Button)
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      // Aksi untuk masuk dengan Google
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(
                        0xFFFFFFFF,
                      ), // Background putih
                      side: const BorderSide(
                        color: Color(0xFF56BCE3), // Border biru cerah
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Sudut membulat
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87, // Teks hitam
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo Google (G-color) - menggunakan ikon sederhana
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color(0xFFDB4437), // Merah Google
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text('Masuk Dengan Google'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Footer - "Belum mempunyai akun? Daftar"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Belum mempunyai akun? ',
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigasi ke halaman register
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          color: Color(0xFF56BCE3), // Warna biru cerah
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
