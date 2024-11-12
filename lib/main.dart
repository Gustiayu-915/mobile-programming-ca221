import 'package:flutter/material.dart';

void main() {
  runApp(const CreateCommentApp());
}

class CreateCommentApp extends StatelessWidget {
  const CreateCommentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CreateCommentScreen(),
    );
  }
}

class CreateCommentScreen extends StatefulWidget {
  const CreateCommentScreen({super.key});

  @override
  _CreateCommentScreenState createState() => _CreateCommentScreenState();
}

class _CreateCommentScreenState extends State<CreateCommentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _creatorController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _creatorController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Implementasi logika untuk submit
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Comment submitted successfully!')),
      );
    }
  }

  void _cancelForm() {
    _creatorController.clear();
    _commentController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form has been cleared')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Comment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _creatorController,
                decoration: const InputDecoration(
                  labelText: 'Creator',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the creator name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _commentController,
                decoration: const InputDecoration(
                  labelText: 'Comment',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a comment';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Send'),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: _cancelForm,
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
