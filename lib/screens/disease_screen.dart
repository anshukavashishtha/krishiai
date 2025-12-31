import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/gemini_service.dart';

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({super.key});

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  bool _isAnalyzing = false;
  bool _hasResult = false;

  String _diseaseName = '';
  double _confidence = 0.0;
  String _recommendation = '';

  String _selectedCrop = 'Wheat';
  String _symptoms = '';

  final List<String> _crops = [
    'Wheat',
    'Rice',
    'Maize',
    'Barley',
    'Millet',
    'Sorghum',
    'Tomato',
    'Potato',
    'Onion',
    'Garlic',
    'Chilli',
    'Brinjal',
    'Cabbage',
    'Cauliflower',
    'Cotton',
    'Sugarcane',
    'Soybean',
    'Groundnut',
    'Mustard',
    'Sunflower',
    'Apple',
    'Banana',
    'Mango',
    'Grapes',
    'Orange',
  ];

  Future<void> _pickImage() async {
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image != null) {
      setState(() {
        _selectedImage = image;
        _hasResult = false;
      });
    }
  }

  Future<void> _detectDisease() async {
    if (_symptoms.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please describe symptoms')),
      );
      return;
    }

    setState(() {
      _isAnalyzing = true;
      _hasResult = false;
    });

    try {
      final result = await GeminiService.analyzeCropText(
        crop: _selectedCrop,
        symptoms: _symptoms,
      );

      setState(() {
        _diseaseName = result['disease'];
        _confidence = (result['confidence'] ?? 0) / 100;
        _recommendation = result['recommendation'];
        _hasResult = true;
      });
    } catch (e) {
      setState(() {
        _diseaseName = 'Analysis Failed';
        _confidence = 0;
        _recommendation =
            'Unable to analyze crop data at the moment.';
        _hasResult = true;
      });
    } finally {
      setState(() {
        _isAnalyzing = false;
      });
    }
  }

  String getSeverity(double c) {
    if (c < 0.6) return 'Mild';
    if (c < 0.8) return 'Moderate';
    return 'Severe';
  }

  Color getSeverityColor(double c) {
    if (c < 0.6) return Colors.amber;
    if (c < 0.8) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: const Text('Crop Disease Detection')),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Card(
              margin: const EdgeInsets.all(24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Upload Crop Image',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium),
                    const SizedBox(height: 6),
                    const Text(
                        'Upload an image and describe visible symptoms.'),
                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border:
                              Border.all(color: primary, width: 2),
                        ),
                        child: _selectedImage == null
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.cloud_upload_outlined,
                                      size: 52, color: primary),
                                  const SizedBox(height: 10),
                                  const Text(
                                      'Tap to upload crop image'),
                                ],
                              )
                            : ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(16),
                                child: Image(
                                  image: kIsWeb
                                      ? NetworkImage(
                                          _selectedImage!.path)
                                      : FileImage(File(
                                              _selectedImage!.path))
                                          as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    DropdownButtonFormField<String>(
                      value: _selectedCrop,
                      decoration: const InputDecoration(
                        labelText: 'Select Crop',
                        border: OutlineInputBorder(),
                      ),
                      items: _crops
                          .map((c) => DropdownMenuItem(
                                value: c,
                                child: Text(c),
                              ))
                          .toList(),
                      onChanged: (v) =>
                          setState(() => _selectedCrop = v!),
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Describe symptoms',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (v) => _symptoms = v,
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed:
                            _isAnalyzing ? null : _detectDisease,
                        child: _isAnalyzing
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text('Analyze Crop'),
                      ),
                    ),

                    const SizedBox(height: 28),

                    if (_hasResult)
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(16),
                          border:
                              Border.all(color: primary.withOpacity(.3)),
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text('Disease: $_diseaseName',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                    'Confidence: ${(_confidence * 100).toStringAsFixed(1)}%'),
                                const SizedBox(width: 10),
                                Chip(
                                  label: Text(getSeverity(_confidence)),
                                  backgroundColor:
                                      getSeverityColor(_confidence)
                                          .withOpacity(.2),
                                  labelStyle: TextStyle(
                                      color:
                                          getSeverityColor(_confidence)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text('Recommendation',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(_recommendation),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
