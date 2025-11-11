import 'package:flutter/material.dart';
import 'tampil_data.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final _namaMahasiswaController = TextEditingController();
  final _nimMahasiswaController = TextEditingController();
  final _tanggallahirMahasiswaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Form Mahasiswa'),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header Icon
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.indigo.shade200,
              child: const Icon(
                Icons.edit_note_rounded,
                size: 55,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Isi Data Mahasiswa',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 25),

            // Card Form Container
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                  children: [
                    _buildTextField(
                      controller: _namaMahasiswaController,
                      label: 'Nama Mahasiswa',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: _nimMahasiswaController,
                      label: 'Nomor Induk Mahasiswa',
                      icon: Icons.badge_outlined,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: _tanggallahirMahasiswaController,
                      label: 'Tahun Lahir',
                      icon: Icons.cake_outlined,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Gradient Button
            GestureDetector(
              onTap: () {
                String namaMahasiswa = _namaMahasiswaController.text.trim();
                String nimMahasiswa = _nimMahasiswaController.text.trim();
                String tanggallahirMahasiswa =
                    _tanggallahirMahasiswaController.text.trim();

                if (namaMahasiswa.isEmpty ||
                    nimMahasiswa.isEmpty ||
                    tanggallahirMahasiswa.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Semua field wajib diisi!"),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                  return;
                }

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MahasiswaDetail(
                    namaMahasiswa: namaMahasiswa,
                    nimMahasiswa: nimMahasiswa,
                    tanggallahirMahasiswa: tanggallahirMahasiswa,
                  ),
                ));
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.indigo, Colors.blueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    'SIMPAN DATA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom TextField Widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.indigo),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.indigo.shade100),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.indigo.shade400, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
