import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:faker/faker.dart' hide Color;
import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../services/contact_service.dart';
import 'contacts_page.dart';
import 'profile_page.dart';
import 'search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late List<Contact> _contacts;
  final Faker _faker = Faker();

  @override
  void initState() {
    super.initState();
    // Inisialisasi minimal 20 data kontak dummy (melebihi batas minimal 15)
    _contacts = ContactService.generateContacts(count: 20);
  }

  void _addRandomContact() {
    final offlineCategories = ['Keluarga', 'Teman', 'Kerja', 'Bisnis', 'Organisasi'];
    final firstName = _faker.person.firstName();
    final lastName = _faker.person.lastName();
    final newContact = Contact(
      id: 'contact_${_contacts.length + 1}',
      name: '$firstName $lastName',
      phone: '0812-${_faker.randomGenerator.integer(9999, min: 1000)}-${_faker.randomGenerator.integer(9999, min: 1000)}',
      email: '${firstName.toLowerCase()}.${lastName.toLowerCase()}@kontak.id',
      category: offlineCategories[_contacts.length % offlineCategories.length],
      addedAt: DateTime.now(),
      avatarColor: const Color(0xFF6366F1),
    );

    setState(() {
      _contacts.insert(0, newContact);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Kontak baru "${newContact.name}" ditambahkan!'),
        backgroundColor: const Color(0xFF4F46E5),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  String get _appBarTitle {
    switch (_currentIndex) {
      case 0:
        return 'Daftar Kontak';
      case 1:
        return 'Cari Kategori Kontak';
      case 2:
        return 'Profil Pengguna';
      default:
        return 'Kontak App';
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      ContactsPage(
        contacts: _contacts,
        onAddRandomContact: _addRandomContact,
      ),
      SearchPage(
        contacts: _contacts,
      ),
      ProfilePage(
        totalContacts: _contacts.length,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          if (_currentIndex == 0)
            IconButton(
              icon: const Icon(Icons.refresh_rounded, color: Color(0xFF4F46E5)),
              tooltip: 'Acak Ulang Kontak',
              onPressed: () {
                setState(() {
                  _contacts = ContactService.generateContacts(count: 20);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Daftar kontak diacak ulang dengan Faker!'),
                    backgroundColor: Color(0xFF4F46E5),
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      // Navigasi menggunakan ConvexAppBar sesuai instruksi soal
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: const Color(0xFF4F46E5),
        activeColor: Colors.white,
        color: Colors.white70,
        items: const [
          TabItem(
            icon: Icons.contacts_rounded,
            title: 'Kontak',
          ),
          TabItem(
            icon: Icons.search_rounded,
            title: 'Cari',
          ),
          TabItem(
            icon: Icons.person_rounded,
            title: 'Profil',
          ),
        ],
        initialActiveIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
