import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pujan_portfolio/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background.withBlue(30),
            AppColors.background,
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: isDesktop
              ? _buildDesktopLayout(context)
              : _buildMobileLayout(context),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: _buildContactForm(context),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 4,
          child: _buildSocialLinks(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          _buildContactForm(context),
          const SizedBox(height: 60),
          _buildSocialLinks(context),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Contact Me",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: AppColors.primaryAccent,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 200.ms),

        const SizedBox(height: 16),

        Text(
          "Have a project in mind or want to discuss opportunities? Feel free to reach out!",
          style: Theme.of(context).textTheme.bodyLarge,
        ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

        const SizedBox(height: 32),

        Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                controller: _nameController,
                label: "Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                delay: 600,
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _emailController,
                label: "Email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
                delay: 800,
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _messageController,
                label: "Message",
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your message";
                  }
                  return null;
                },
                delay: 1000,
              ),

              const SizedBox(height: 24),

              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    minimumSize: const Size(150, 50),
                  ),
                  child: _isSubmitting
                      ? const CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : const Text("Send Message"),
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 1200.ms),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    required String? Function(String?) validator,
    required int delay,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white30),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryAccent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay));
  }

  Widget _buildSocialLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Connect With Me",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: AppColors.primaryAccent,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

        const SizedBox(height: 32),

        _buildSocialLink(
          icon: Icons.link,
          label: "Portfolio",
          url: "https://bohorapujan.com.np",
          delay: 600,
        ),

        _buildSocialLink(
          icon: Icons.code,
          label: "GitHub",
          url: "https://github.com/pujanbohora",
          delay: 800,
        ),

        _buildSocialLink(
          icon: Icons.business,
          label: "LinkedIn",
          url: "https://www.linkedin.com/in/pujan-bohora/",
          delay: 1000,
        ),

        _buildSocialLink(
          icon: Icons.email,
          label: "Email",
          url: "mailto:contact@bohorapujan.com.np",
          delay: 1200,
        ),
      ],
    );
  }

  Widget _buildSocialLink({
    required IconData icon,
    required String label,
    required String url,
    required int delay,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: InkWell(
        onTap: () => _launchUrl(url),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.background.withOpacity(0.7),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: AppColors.primaryAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              child: Icon(
                icon,
                color: AppColors.primaryAccent,
              ),
            ),

            const SizedBox(width: 16),

            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay));
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Simulate form submission
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isSubmitting = false;
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Message sent successfully!"),
            backgroundColor: Colors.green,
          ),
        );
      });
    }
  }
}
