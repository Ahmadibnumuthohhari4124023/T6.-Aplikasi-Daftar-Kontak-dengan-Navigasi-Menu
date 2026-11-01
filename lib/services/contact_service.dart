import 'package:faker/faker.dart' hide Color;
import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactService {
  static final Faker _faker = Faker();

  static const List<String> categories = [
    'Semua Kategori',
    'Keluarga',
    'Teman',
    'Kerja',
    'Bisnis',
    'Organisasi',
  ];

  static const List<Color> _avatarColors = [
    Color(0xFF4F46E5), // Indigo
    Color(0xFF0EA5E9), // Ocean Blue
    Color(0xFF10B981), // Emerald
    Color(0xFFF59E0B), // Amber
    Color(0xFFEC4899), // Pink
    Color(0xFF8B5CF6), // Purple
    Color(0xFF14B8A6), // Teal
    Color(0xFFEF4444), // Rose
  ];

  /// Menghasilkan minimal 20 data kontak dummy menggunakan Faker
  static List<Contact> generateContacts({int count = 20}) {
    final List<Contact> contacts = [];
    final offlineCategories = ['Keluarga', 'Teman', 'Kerja', 'Bisnis', 'Organisasi'];

    for (int i = 0; i < count; i++) {
      final firstName = _faker.person.firstName();
      final lastName = _faker.person.lastName();
      final fullName = '$firstName $lastName';

      // Nomor telepon format seluler Indonesia
      final prefix = ['0812', '0813', '0821', '0852', '0857', '0878', '0896', '0895'][i % 8];
      final part1 = _faker.randomGenerator.integer(9999, min: 1000).toString();
      final part2 = _faker.randomGenerator.integer(9999, min: 1000).toString();
      final phone = '$prefix-$part1-$part2';

      // Email dummy berbasis nama
      final emailDomain = ['gmail.com', 'yahoo.com', 'outlook.com', 'kampus.ac.id'][i % 4];
      final email = '${firstName.toLowerCase()}.${lastName.toLowerCase()}@$emailDomain';

      // Kategori kontak
      final category = offlineCategories[i % offlineCategories.length];

      // Tanggal ditambahkan acak dalam kurun 2025 - 2026
      final addedAt = _faker.date.dateTimeBetween(
        DateTime(2025, 1, 1),
        DateTime(2026, 11, 1),
      );

      final color = _avatarColors[i % _avatarColors.length];

      contacts.add(
        Contact(
          id: 'contact_${i + 1}',
          name: fullName,
          phone: phone,
          email: email,
          category: category,
          addedAt: addedAt,
          avatarColor: color,
        ),
      );
    }

    // Urutkan berdasarkan tanggal terbaru
    contacts.sort((a, b) => b.addedAt.compareTo(a.addedAt));
    return contacts;
  }
}
