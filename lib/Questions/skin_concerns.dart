import 'package:dramaskin/Provider/userdata.dart';
import 'package:dramaskin/Questions/Gender.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ─────────────────────────────────────────────
//  SKIN CONCERNS SCREEN
// ─────────────────────────────────────────────

class SkinConcernsScreen extends StatefulWidget {
  const SkinConcernsScreen({super.key});

  @override
  State<SkinConcernsScreen> createState() => _SkinConcernsScreenState();
}

class _SkinConcernsScreenState extends State<SkinConcernsScreen> {
  // ✅ changed from int → String
  final Set<String> _selected = {};

  static const Color _bgColor = Color(0xFFF8D7DA);
  static const Color _cardBg = Colors.white;
  static const Color _accentPink = Color(0xFFEC4D7B);
  static const Color _selectedRadio = Color(0xFFEC4D7B);
  static const Color _unselectedRadio = Color(0xFFD0B0B5);
  static const Color _rowBg = Color(0xFFFFF0F2);
  static const Color _rowSelectedBg = Color(0xFFFFE0E6);

  final List<String> skinConcerns = [
    'Acne',
    'Dark spots',
    'Dryness',
    'Redness',
    'Dullness',
    'none',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 160,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5A3B0),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 28),
                    decoration: BoxDecoration(
                      color: _cardBg,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Please select\nwhat your skin\nconcerns are',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '(multiple selection allowed)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF888888),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 54),

            // List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: skinConcerns.length,
                separatorBuilder: (_, __) => const SizedBox(height: 40),
                itemBuilder: (context, i) {
                  final item = skinConcerns[i];

                  // ✅ changed logic: String instead of index
                  final selected = _selected.contains(item);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selected) {
                          _selected.remove(item);
                        } else {
                          _selected.add(item);
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 160),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 22),
                      decoration: BoxDecoration(
                        color: selected ? _rowSelectedBg : _rowBg,
                        borderRadius: BorderRadius.circular(14),
                        border: selected
                            ? Border.all(color: _accentPink, width: 1.5)
                            : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: selected
                                  ? const Color(0xFFB03060)
                                  : const Color(0xFF4A2030),
                            ),
                          ),
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selected
                                    ? _selectedRadio
                                    : _unselectedRadio,
                                width: 2,
                              ),
                            ),
                            child: selected
                                ? Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: _selectedRadio,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _accentPink,
                        shape: const StadiumBorder(),
                        elevation: 0,
                      ),
                      child: const Text('skip',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<UserData>(context, listen: false)
                            .setSkinConcerns(_selected);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GenderScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _accentPink,
                        shape: const StadiumBorder(),
                        elevation: 0,
                      ),
                      child: const Text('next',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}