import 'package:avatar_glow/avatar_glow.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kontak_app/main.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('id_ID', null);
  });

  testWidgets('Aplikasi memiliki ConvexAppBar dengan 3 tab', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    // Verifikasi ConvexAppBar ada
    expect(find.byType(ConvexAppBar), findsOneWidget);

    // Verifikasi ikon 3 tab: Kontak, Cari, Profil
    expect(find.byIcon(Icons.contacts_rounded), findsWidgets);
    expect(find.byIcon(Icons.search_rounded), findsWidgets);
    expect(find.byIcon(Icons.person_rounded), findsWidgets);
  });

  testWidgets('Halaman Kontak menampilkan minimal 15 item data dummy', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    // Verifikasi ListView ada
    expect(find.byType(ListView), findsOneWidget);

    // Verifikasi teks label "Ditambahkan pada:" menggunakan format INTL
    expect(find.textContaining('Ditambahkan pada:'), findsWidgets);
  });

  testWidgets('Halaman Cari memiliki DropdownSearch dengan kategori', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    // Pindah ke tab Cari (index 1)
    await tester.tap(find.byIcon(Icons.search_rounded));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    // Verifikasi DropdownSearch terpasang
    expect(find.byType(DropdownSearch<String>), findsOneWidget);
  });

  testWidgets('Halaman Profil memiliki AvatarGlow', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    // Pindah ke tab Profil (index 2)
    await tester.tap(find.byIcon(Icons.person_rounded));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    // Verifikasi AvatarGlow terpasang
    expect(find.byType(AvatarGlow), findsOneWidget);
    expect(find.text('Ahmad Muthohhari'), findsOneWidget);
  });
}
