import 'package:agecalculator/mydrawer/mydrawer.dart';
import 'package:agecalculator/theme/theme_provider.dart';
import 'package:agecalculator/utils/const.dart';
import 'package:agecalculator/views/age_calculator_result/age_calculator_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgeCalculatorView extends StatefulWidget {
  const AgeCalculatorView({Key? key}) : super(key: key);

  @override
  _AgeCalculatorViewState createState() => _AgeCalculatorViewState();
}

class _AgeCalculatorViewState extends State<AgeCalculatorView> {
  final _formKey = GlobalKey<FormState>();
  final _yearController = TextEditingController();
  final _monthController = TextEditingController();
  final _dayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('احسب عمرك'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: themeProvider.toggleTheme,
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(_dayController, 'أدخل اليوم', 'day'),
                  const SizedBox(height: 20),
                  _buildTextField(_monthController, 'أدخل الشهر', 'month'),
                  const SizedBox(height: 20),
                  _buildTextField(_yearController, 'أدخل السنة', 'year'),
                  const SizedBox(height: 20),
                  ElevatedButton(

                    onPressed: _calculateAge,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kbuttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // تحديد نصف القطر لجعل الزر ذو حواف مدورة
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24), // تحسين المسافة داخل الزر
                    ),
                    child: const Text(
                      'احسب عمرك',
                      style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 18, // تغيير حجم النص ليبدو أفضل
                        fontWeight: FontWeight.bold, // جعل النص بالخط العريض لجعله أكثر وضوحًا
                      ),
                    ),

                  )
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, String type) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }

        final int? number = int.tryParse(value);
        if (number == null) {
          return 'الرجاء إدخال رقم صحيح';
        }

        if (type == 'day' && (number < 1 || number > 31)) {
          return 'اليوم يجب أن يكون بين 1 و 31';
        } else if (type == 'month' && (number < 1 || number > 12)) {
          return 'الشهر يجب أن يكون بين 1 و 12';
        } else if (type == 'year') {
          final currentYear = DateTime.now().year;
          if (number < 1900 || number > currentYear) {
            return 'السنة يجب أن تكون بين 1900 و $currentYear';
          }
        }

        return null;
      },
    );
  }

  void _calculateAge() {
    if (_formKey.currentState?.validate() ?? false) {
      final int year = int.parse(_yearController.text);
      final int month = int.parse(_monthController.text);
      final int day = int.parse(_dayController.text);

      final birthDate = DateTime(year, month, day);
      final currentDate = DateTime.now();

      if (birthDate.isAfter(currentDate)) {
        _showErrorDialog('تاريخ الميلاد لا يمكن أن يكون في المستقبل.');
        return;
      }

      final duration = currentDate.difference(birthDate);
      final int years = duration.inDays ~/ 365;
      final int months = (duration.inDays % 365) ~/ 30;
      final int days = (duration.inDays % 365) % 30;

      final String age = '$years سنوات, $months أشهر, $days أيام';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AgeResult(age: age)),
      );
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('خطأ'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسنًا'),
          ),
        ],
      ),
    );
  }
}

