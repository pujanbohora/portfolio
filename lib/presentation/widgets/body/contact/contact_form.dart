import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  late TextEditingController _messageController;
  late TextEditingController _nameController;
  late TextEditingController _subjectController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
    _nameController = TextEditingController();
    _subjectController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    _nameController.dispose();
    _subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getFormWidth(context.width),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              controller: _nameController,
              style: AppStyles.s14,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              readOnly: true,
              // controller: _subjectController,
              initialValue: "bohorapawan@gmail.com",
              style: AppStyles.s14,
              decoration: const InputDecoration(labelText: 'Email To'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              validator: (value) {
                final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value.toString());
                if (value!.isEmpty) {
                  return 'Please enter your E-mail';
                } else if (!emailValid) {
                  return 'Please enter valid E-mail';
                }
                return null;
              },
              controller: _emailController,
              style: AppStyles.s14,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your Subject';
                }
                return null;
              },
              controller: _subjectController,
              style: AppStyles.s14,
              decoration: const InputDecoration(labelText: 'Subject'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
              controller: _messageController,
              maxLines: 5,
              style: AppStyles.s14,
              decoration: const InputDecoration(
                labelText: 'Type a message here...',
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              label: 'Submit',
              onPressed: () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                sendEmail(context);
              },
              backgroundColor: AppColors.primaryColor,
              width: _getFormWidth(context.width),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendEmail(BuildContext context) async {
    var subject = '${_nameController.text} - ${_subjectController.text}';
    final Email email = Email(
      body: _emailController.text,
      subject: subject,
      recipients: ["bohorapawan@gmail.com"],
      cc: [_emailController.text],
      bcc: [_emailController.text],
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'E-mail sent successfully';
    } catch (error) {
      print("ERROR:::${error}");
      platformResponse = 'Failed to send email: ${error.toString()}';
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
        backgroundColor: platformResponse.contains('successfully') ? Colors.green : Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  double _getFormWidth(double deviceWidth) {
    if (deviceWidth < DeviceType.mobile.getMaxWidth()) {
      return deviceWidth;
    } else if (deviceWidth < DeviceType.ipad.getMaxWidth()) {
      return deviceWidth / 1.6;
    } else if (deviceWidth < DeviceType.smallScreenLaptop.getMaxWidth()) {
      return deviceWidth / 2;
    } else {
      return deviceWidth / 2.5;
    }
  }
}
