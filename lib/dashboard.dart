import 'package:flutter/material.dart';
import 'profil.dart';

class DashboardPage extends StatelessWidget {
  final String userName;
  const DashboardPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // custom appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('KlinikSehat'),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          const SizedBox(width: 8)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // greeting + quick card
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Halo, $userName", style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 6),
                      const Text("Selamat datang kembali", style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                // small avatar
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilPage()));
                  },
                  child: CircleAvatar(
                    radius: 26,
                    backgroundImage: const AssetImage('assets/pp.jpg'),
                    backgroundColor: Colors.grey.shade100,
                  ),
                )
              ],
            ),

            const SizedBox(height: 16),

            // kartu pasien / saldo janji
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF06B6D4), Color(0xFF06A89A)]),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 8)],
              ),
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Informasi Pasien', style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 6),
                  Text('Nama: Latif Junia Angreani', style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(height: 6),
                  Text('ID Pasien: 23670052', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // grid menu layanan
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      children: [
                        menuItem(Icons.calendar_today, 'Janji', () {
                          // open janji
                        }),
                        menuItem(Icons.person_search, 'Dokter', () {}),
                        menuItem(Icons.medical_services, 'Layanan', () {}),
                        menuItem(Icons.receipt_long, 'Resep', () {}),
                        menuItem(Icons.history, 'Riwayat', () {}),
                        menuItem(Icons.payment, 'Pembayaran', () {}),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // upcoming appointment card
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Janji Mendatang', style: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 10),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFECFEFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.calendar_month, color: Color(0xFF06B6D4)),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Dr. Budi Gunawan - Umum'),
                                SizedBox(height: 6),
                                Text('Senin, 10 Nov 2025 • 09:30', style: TextStyle(color: Colors.black54)),
                              ],
                            ),
                          ),
                          TextButton(onPressed: () {}, child: const Text('Ubah')),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // simple doctor list preview
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Dokter Tersedia', style: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 10),

                    Column(
                      children: [
                        doctorTile('Dr. Budi Gunawan', 'Spesialis Umum'),
                        doctorTile('Dr. Rina Melati', 'Spesialis Anak'),
                        doctorTile('Dr. Agus Santoso', 'Spesialis Gigi'),
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: const Color(0xFF06B6D4)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget doctorTile(String name, String specialty) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 6)],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundImage: const AssetImage('assets/-'),
            backgroundColor: Colors.grey.shade100,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                const SizedBox(height: 6),
                Text(specialty, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF06B6D4),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Booking'),
          ),
        ],
      ),
    );
  }
}
