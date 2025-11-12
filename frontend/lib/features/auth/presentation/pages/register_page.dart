import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Untuk navigasi tombol Login
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Media Query untuk layout responsif
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Warna yang digunakan
    const Color primaryTosca = Color(0xFF3ED0A0);
    const Color primaryBlue = Color(0xFF4C7BFF);
    const Color lightGreyBackground = Color(0xFFF5F5F5);

    return Scaffold(
      backgroundColor: lightGreyBackground, // Latar belakang abu-abu muda
      body: SingleChildScrollView(
        // Agar bisa discroll
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05), // Spasi atas
              // --- Header ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    decoration: const BoxDecoration(
                      color: primaryTosca, // Warna hijau toska
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: screenWidth * 0.08,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Text(
                    'REGISTRATION',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),

              // --- Form Container ---
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white, // Warna kontainer form
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // TextField Name
                    _buildTextField(
                      hintText: 'Name',
                      icon: Icons.person,
                      iconColor: primaryBlue,
                      screenWidth: screenWidth,
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // TextField Email
                    _buildTextField(
                      hintText: 'Email',
                      icon: Icons.email,
                      iconColor: primaryBlue,
                      screenWidth: screenWidth,
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // TextField Password
                    _buildTextField(
                      hintText: 'Password',
                      icon: Icons.lock,
                      iconColor: primaryBlue,
                      screenWidth: screenWidth,
                      isPassword: true,
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // TextField Confirm Password
                    _buildTextField(
                      hintText: 'Confirm Password',
                      icon: Icons.lock,
                      iconColor: primaryBlue,
                      screenWidth: screenWidth,
                      isPassword: true,
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // --- Tombol Login & Register ---
                    Row(
                      children: [
                        // Tombol LOGIN
                        Expanded(
                          child: _buildGradientButton(
                            text: 'LOGIN',
                            gradient: const LinearGradient(
                              colors: [primaryTosca, primaryBlue],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            icon: Icons.login,
                            screenWidth: screenWidth,
                            onPressed: () {
                              // Kembali ke halaman Login
                              if (context.canPop()) {
                                context.pop();
                              } else {
                                context.goNamed('login');
                              }
                            },
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        // Tombol REGISTER
                        Expanded(
                          child: _buildGradientButton(
                            text: 'REGISTER',
                            gradient: const LinearGradient(
                              colors: [primaryBlue, primaryTosca],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            icon: Icons.app_registration,
                            screenWidth: screenWidth,
                            onPressed: () {
                              // Logika register di sini (belum diimplementasi)
                              print('Tombol Register ditekan');
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // --- Garis "OR" ---
                    Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02,
                          ),
                          child: Text(
                            'OR',
                            style: GoogleFonts.poppins(color: Colors.grey),
                          ),
                        ),
                        const Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // --- Tombol "Continue with Google" ---
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.065,
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
                          'assets/google_logo.png', // Pastikan aset ini ada
                          height: screenWidth * 0.05,
                        ),
                        label: Text(
                          'Continue with Google',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              // --- Ilustrasi Rumah Sakit ---
              Image.asset(
                'assets/hospital.png', // Pastikan aset ini ada
                width: screenWidth * 0.8,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk TextField
  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    required Color iconColor,
    required double screenWidth,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Background abu-abu muda
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: isPassword,
        style: GoogleFonts.poppins(fontSize: screenWidth * 0.04),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: iconColor),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(color: Colors.grey.shade600),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.045,
            horizontal: screenWidth * 0.04,
          ),
        ),
      ),
    );
  }

  // Widget helper untuk Tombol Gradient
  Widget _buildGradientButton({
    required String text,
    required LinearGradient gradient,
    required IconData icon,
    required double screenWidth,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: screenWidth * 0.12, // Tinggi tombol responsif
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Icon(icon, color: Colors.white, size: screenWidth * 0.05),
        label: Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
