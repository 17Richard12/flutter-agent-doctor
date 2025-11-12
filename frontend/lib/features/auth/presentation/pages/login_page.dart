import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter untuk navigasi

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    // Media Query untuk responsivitas
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Warna yang digunakan
    const Color primaryTosca = Color(0xFF3ED0A0);
    const Color primaryBlue = Color(0xFF4C7BFF);
    const Color lightGreyBackground = Color(0xFFF5F5F5);

    return Scaffold(
      backgroundColor: lightGreyBackground, // Background abu-abu muda
      body: SingleChildScrollView(
        // Agar bisa discroll di layar kecil
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, // Padding horizontal responsif
            vertical: screenHeight * 0.05, // Padding vertikal responsif
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05), // Spasi atas
              // Logo dan Tulisan LOGIN
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.15, // Ukuran ikon bundar responsif
                    height: screenWidth * 0.15,
                    decoration: const BoxDecoration(
                      color: primaryTosca, // Warna hijau toska
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: screenWidth * 0.08, // Ukuran ikon responsif
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08, // Ukuran teks responsif
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05), // Spasi
              // TextField Email
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background putih untuk TextField
                  borderRadius: BorderRadius.circular(10), // Sudut melengkung
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Pergeseran bayangan
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: primaryTosca),
                    hintText: 'Email',
                    border: InputBorder.none, // Hilangkan border default
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Spasi antar TextField
              // TextField Password
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background putih untuk TextField
                  borderRadius: BorderRadius.circular(10), // Sudut melengkung
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  obscureText: true, // Untuk password
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: primaryTosca),
                    hintText: 'Password',
                    border: InputBorder.none, // Hilangkan border default
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04), // Spasi sebelum tombol
              // Tombol LOGIN
              Container(
                width: double.infinity,
                height: screenHeight * 0.07, // Tinggi tombol responsif
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      primaryTosca,
                      primaryBlue,
                    ], // Gradient hijau toska ke biru
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Logika login di sini (belum diimplementasi)
                    print('Tombol Login ditekan');
                    // context.go('/symptom_input'); // Contoh navigasi setelah login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Transparan agar gradient terlihat
                    shadowColor: Colors.transparent, // Hilangkan shadow default
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: Icon(
                    Icons.login,
                    color: Colors.white,
                    size: screenWidth * 0.06,
                  ),
                  label: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Spasi antar tombol
              // Tombol REGISTER
              Container(
                width: double.infinity,
                height: screenHeight * 0.07, // Tinggi tombol responsif
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      primaryBlue,
                      primaryTosca,
                    ], // Gradient biru ke hijau toska
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Navigasi ke halaman register
                    context.pushNamed('register');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: Icon(
                    Icons.app_registration,
                    color: Colors.white,
                    size: screenWidth * 0.06,
                  ),
                  label: Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // Spasi
              // Teks "OR" dengan garis horizontal
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: screenWidth * 0.05,
                      endIndent: screenWidth * 0.02,
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: screenWidth * 0.02,
                      endIndent: screenWidth * 0.05,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03), // Spasi
              // Tombol "Continue with Google"
              Container(
                width: double.infinity,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextButton.icon(
                  onPressed: () {
                    print('Continue with Google');
                  },
                  icon: Image.asset(
                    'assets/google_logo.png', // Anda perlu menambahkan logo Google di sini jika ingin ikon
                    height: screenWidth * 0.05,
                  ),
                  label: Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ), // Spasi sebelum gambar rumah sakit
              // Ilustrasi rumah sakit
              Image.asset(
                'assets/hospital.png',
                width: screenWidth * 0.8, // Ukuran gambar responsif
                fit: BoxFit.fitWidth,
              ),

              SizedBox(height: screenHeight * 0.02), // Spasi bawah
            ],
          ),
        ),
      ),
    );
  }
}
