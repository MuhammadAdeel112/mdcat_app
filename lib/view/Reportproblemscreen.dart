import 'package:flutter/material.dart';
import 'package:mdcat/providers/report_problem_provider.dart';
import 'package:mdcat/view/profile_screen.dart';
import 'package:mdcat/widgets/custom_background.dart';
import 'package:provider/provider.dart';

class ReportProblemScreen extends StatelessWidget {
  const ReportProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReportProblemProvider(),
      child: Consumer<ReportProblemProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                CustomHeader(
                  title: "Report A Problem",
                  counterText: "",
                  onBack: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfilePage()),
                    );
                  },
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        const Text(
                          'If you encounter any issues or bugs while using the app, please report them below.',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),

                        TextField(
                          controller: provider.nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name (optional)',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 15),

                        TextField(
                          controller: provider.emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email (optional)',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 15),

                        TextField(
                          controller: provider.descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Describe the problem',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.report_problem),
                          ),
                          maxLines: 5,
                        ),

                        if (provider.errorMessage != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            provider.errorMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                            ),
                          ),
                        ],

                        const SizedBox(height: 20),

                        ElevatedButton.icon(
                          onPressed: provider.isLoading
                              ? null
                              : () async {
                                  final success = await provider
                                      .submitProblem();

                                  if (success) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "✅ Issue reported successfully",
                                        ),
                                      ),
                                    );

                                    provider.nameController.clear();
                                    provider.emailController.clear();
                                    provider.descriptionController.clear();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          provider.errorMessage ??
                                              "Failed to report issue",
                                        ),
                                      ),
                                    );
                                  }
                                },
                          icon: provider.isLoading
                              ? const SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.send),
                          label: Text(
                            provider.isLoading ? "Submitting..." : "Submit",
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
