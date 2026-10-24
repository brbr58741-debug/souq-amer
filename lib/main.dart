import 'package:flutter/material.dart';

void main() => runApp(const SouqAmirApp());

class SouqAmirApp extends StatelessWidget {
  const SouqAmirApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'سوق أمير',
      theme: ThemeData(primaryColor: const Color(0xFF008069)),
      home: const MainNav(),
    );
  }
}

class MainNav extends StatefulWidget {
  const MainNav({super.key});
  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int i = 0;
  final p = [const HomePage(), const CartPage(), const ProfilePage()];
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: p[i],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: i,
        onTap: (v) => setState(() => i = v),
        selectedItemColor: const Color(0xFF008069),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'السوق'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'السلة'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(title: const Text('سوق أمير'), backgroundColor: const Color(0xFF008069), foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: const Color(0xFF008069), borderRadius: BorderRadius.circular(15)),
            child: const Text('أهلاً بيك في سوق أمير 🛒\nأفضل المنتجات', style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          const SizedBox(height: 15),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _card('ساعة ذكية', '12000 ج', Icons.watch),
              _card('سماعة', '8500 ج', Icons.headset),
              _card('شاحن', '3500 ج', Icons.battery_charging_full),
              _card('جراب', '2000 ج', Icons.phone_android),
            ],
          )
        ],
      ),
    );
  }

  static Widget _card(String n, String pr, IconData ic) {
    return Card(
      margin: const EdgeInsets.all(6),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(ic, size: 45, color: const Color(0xFF008069)),
            const SizedBox(height: 8),
            Text(n, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(pr, style: const TextStyle(color: Colors.green)),
            ElevatedButton(onPressed: () {}, child: const Text('أضف'))
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext c) => const Scaffold(body: Center(child: Text('السلة فاضية')));
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext c) => const Scaffold(body: Center(child: Text('حسابي')));
}
