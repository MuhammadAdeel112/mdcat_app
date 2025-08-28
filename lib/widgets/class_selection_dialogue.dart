import 'package:flutter/material.dart';
import 'package:mdcat/providers/class_selection_provider.dart';
import 'package:provider/provider.dart';

class ClassSelectionDialog extends StatelessWidget {
  const ClassSelectionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header section
            Column(
              children: [
                // Cross button (top-right aligned)
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    // onTap: () => Navigator.of(context).pop(),
                    onTap: () =>
                        //Navigator.of(context, rootNavigator: true).pop(),
                        Navigator.of(context).pop("cancel"),
                    child: Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.only(top: 8, right: 8),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFF2F2F2,
                        ), // light gray circle background
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFCCCCCC), // #CCCCCC in Flutter
                          width: 1, // 1px
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(
                              0x66000000,
                            ), // #00000040 → 40 = 25% opacity black
                            offset: Offset(0, 4), // x=0, y=4
                            blurRadius: 4, // blur
                            spreadRadius: 0, // same as CSS
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                // spacing between cross & title
                // Title centered
                const Text(
                  "Choose Your Class",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Radio options
            Consumer<ClassSelectionProvider>(
              builder: (context, classProvider, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 1st Year option
                    ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.only(
                        left: -10,
                      ), // shift text left
                      leading: Transform.translate(
                        offset: const Offset(-12, 0), // shift radio left
                        child: Radio<String>(
                          value: "1st Year",
                          groupValue: classProvider.selectedClass,
                          onChanged: (value) {
                            classProvider.selectClass(value);
                          },
                        ),
                      ),
                      title: Transform.translate(
                        offset: Offset(-8, 0), // shift text left
                        child: Text("1st Year"),
                      ),
                    ),

                    // 2nd Year option
                    ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.only(left: -10),
                      leading: Transform.translate(
                        offset: const Offset(-12, 0),
                        child: Radio<String>(
                          value: "2nd Year",
                          groupValue: classProvider.selectedClass,
                          onChanged: (value) {
                            classProvider.selectClass(value);
                          },
                        ),
                      ),
                      title: Transform.translate(
                        offset: Offset(-8, 0),
                        child: Text("2nd Year"),
                      ),
                    ),

                    // Both option
                    ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.only(left: -10),
                      leading: Transform.translate(
                        offset: const Offset(-12, 0),
                        child: Radio<String>(
                          value: "Both",
                          groupValue: classProvider.selectedClass,
                          onChanged: (value) {
                            classProvider.selectClass(value);
                          },
                        ),
                      ),
                      title: Transform.translate(
                        offset: Offset(-8, 0),
                        child: Text("Both"),
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            // Continue button with gradient
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 150, // Set a specific width instead of full width
                height: 40,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8C59FF), Color(0xFF492699)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop("continue"),
                  // onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
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
}
