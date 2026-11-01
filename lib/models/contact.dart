import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Contact {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String category;
  final DateTime addedAt;
  final Color avatarColor;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.category,
    required this.addedAt,
    required this.avatarColor,
  });

  /// Mengembalikan tanggal terformat dengan locale Indonesia (id_ID),
  /// contoh: "05 September 2026"
  String get formattedAddedAt {
    return DateFormat('dd MMMM yyyy', 'id_ID').format(addedAt);
  }

  /// Inisial dari nama kontak untuk avatar
  String get initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts[0][0] + parts[parts.length - 1][0]).toUpperCase();
  }
}
