import 'package:flutter/material.dart';

class ApplyNowScreen extends StatefulWidget {
  @override
  _ApplyNowScreenState createState() => _ApplyNowScreenState();
}

class _ApplyNowScreenState extends State<ApplyNowScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _instituteController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _projectController = TextEditingController();
  String? _selectedTech;

  final List<String> _internships = [
    'Flutter Development',
    'Web Development',
    'Data Science',
    'Cyber Security',
    'Graphic Design',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply Now'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _fatherNameController,
                  decoration: InputDecoration(labelText: 'Father Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your father\'s name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _instituteController,
                  decoration: InputDecoration(labelText: 'Institute'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your institute name';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Select Tech'),
                  value: _selectedTech,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedTech = newValue;
                    });
                  },
                  items: _internships.map((String tech) {
                    return DropdownMenuItem<String>(
                      value: tech,
                      child: Text(tech),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a technology';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _experienceController,
                  decoration: InputDecoration(labelText: 'Working Experience'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your working experience';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _projectController,
                  decoration: InputDecoration(labelText: 'Past Project (URL)'),
                  keyboardType: TextInputType.url,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a project URL';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the data here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Application Submitted')),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
