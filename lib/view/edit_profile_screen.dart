import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController(
    text: 'Melissa Peters',
  );
  final TextEditingController fatherNameController = TextEditingController(
    text: 'Melissa Peters',
  );
  final TextEditingController emailController = TextEditingController(
    text: 'melpeters@gmail.com',
  );
  final TextEditingController passwordController = TextEditingController(
    text: '********',
  );
  final TextEditingController phoneController = TextEditingController(
    text: '+92354277527',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              children: [
                // Back Button and Title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back icon at top-left
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // ⬅️ This takes the user back
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0x0F793FFF),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Title centered
                    Center(
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                // Profile Picture
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        "assets/images/userprofile.png",
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/camera.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // Fields
                _buildTextField("Name", nameController),
                SizedBox(height: 15),
                _buildTextField("Father name", fatherNameController),
                SizedBox(height: 15),
                _buildDropdownField("Course", ["MDCAT", "ECAT", "SAT"]),
                SizedBox(height: 15),
                _buildTextField("Email", emailController),
                SizedBox(height: 15),
                _buildTextField(
                  "Password",
                  passwordController,
                  isPassword: true,
                ),
                SizedBox(height: 15),
                _buildDropdownField("City", [
                  "Abbottabad",
                  "Lahore",
                  "Karachi",
                ]),
                SizedBox(height: 15),
                _buildTextField("Phone no", phoneController),
                SizedBox(height: 30),
                // Save Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8266F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  ),
                  child: Text(
                    "Saved Changes",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color(0x40333333), // 25% opacity
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color(0xFF333333), // Full opacity on focus
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, List<String> items) {
    String selectedValue = items[0];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 6),
        StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: items
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.normal, // 🔥 Set to normal!
                              color: Color(
                                0xFF333333,
                              ), // Optional: consistent with your design
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
