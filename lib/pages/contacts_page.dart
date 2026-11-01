import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../widgets/contact_card.dart';

class ContactsPage extends StatefulWidget {
  final List<Contact> contacts;
  final VoidCallback onAddRandomContact;

  const ContactsPage({
    super.key,
    required this.contacts,
    required this.onAddRandomContact,
  });

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          // Header Info Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withValues(alpha: 0.15),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4F46E5).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.people_alt_rounded,
                        color: Color(0xFF4F46E5),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Daftar Kontak Dummy (Faker)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        Text(
                          '${widget.contacts.length} kontak terdaftar (Min. 15)',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                TextButton.icon(
                  onPressed: widget.onAddRandomContact,
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Tambah'),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF4F46E5),
                    backgroundColor: const Color(0xFF4F46E5).withValues(alpha: 0.08),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ListView.builder Kontak
          Expanded(
            child: widget.contacts.isEmpty
                ? const Center(
                    child: Text('Tidak ada kontak'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 10, bottom: 24),
                    itemCount: widget.contacts.length,
                    itemBuilder: (context, index) {
                      final contact = widget.contacts[index];
                      return ContactCard(contact: contact);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
