import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // ایک سادہ ماڈیول کی تفصیل
  final List<Map<String, dynamic>> modules = const [
    {'title': 'وضو، تیمم، غسل', 'icon': Icons.water_drop, 'route': '/wudu'},
    {'title': 'نماز کی ادائیگی', 'icon': Icons.accessibility_new, 'route': '/namaz'},
    {'title': 'روزہ اور نیت', 'icon': Icons.wb_sunny, 'route': '/fasting'},
    {'title': 'نورانی قاعدہ', 'icon': Icons.menu_book, 'route': '/qaida'},
    {'title': 'ایمانیات و کلمے', 'icon': Icons.star, 'route': '/aqeedah'},
    {'title': 'آداب و اخلاق', 'icon': Icons.ramen_dining, 'route': '/adab'},
    {'title': 'دینی واقعات', 'icon': Icons.history, 'route': '/events'},
    {'title': 'پہیلیاں اور گیمز', 'icon': Icons.extension, 'route': '/games'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'مسلم کڈز',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            // یہاں 'شعیب' کے نام کا لوگو امیج استعمال کیا جائے گا
            Image.asset(
              'assets/images/logo/shoaib_logo_dark.png', 
              height: 40,
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // دو کالم
          childAspectRatio: 1.0,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
        ),
        itemCount: modules.length,
        itemBuilder: (context, index) {
          return ModuleCard(module: modules[index]);
        },
      ),
    );
  }
}

class ModuleCard extends StatelessWidget {
  final Map<String, dynamic> module;

  const ModuleCard({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // یہاں نیویگیشن لاجک آئے گا: Navigator.pushNamed(context, module['route']);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${module['title']} لوڈ ہو رہا ہے...')),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(module['icon'] as IconData, size: 50, color: Theme.of(context).primaryColor),
            const SizedBox(height: 10),
            Text(
              module['title'] as String,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
