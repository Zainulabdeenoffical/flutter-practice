import 'package:flutter/material.dart';

class FilterContrastScreen extends StatefulWidget {
  const FilterContrastScreen({Key? key}) : super(key: key);

  @override
  _FilterContrastScreenState createState() => _FilterContrastScreenState();
}

class _FilterContrastScreenState extends State<FilterContrastScreen> {
  double _contrast = 0.0;
  double _brightness = 0.0;
  double _threshold = 0.5;
  bool _isAutoEnhance = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Adjust Contrast', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Image Preview with Contrast
          Expanded(
            child: Center(
              child: Container(
                width: 300,
                height: 400,
                color: _getContrastColor(),
                child: Center(
                  child: Icon(
                    Icons.description,
                    size: 100,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),
          
          // Controls
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Auto Enhance Toggle
                SwitchListTile(
                  title: const Text('Auto Enhance', style: TextStyle(color: Colors.white)),
                  subtitle: const Text('Automatically adjust contrast and brightness', style: TextStyle(color: Colors.grey)),
                  value: _isAutoEnhance,
                  onChanged: (value) {
                    setState(() {
                      _isAutoEnhance = value;
                      if (value) {
                        // Apply auto enhancement values
                        _contrast = 0.3;
                        _brightness = 0.1;
                        _threshold = 0.6;
                      }
                    });
                  },
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
                
                const SizedBox(height: 16),
                
                // Contrast Control
                Row(
                  children: [
                    const SizedBox(width: 90, child: Text('Contrast', style: TextStyle(color: Colors.white))),
                    Expanded(
                      child: Slider(
                        value: _contrast,
                        min: -1.0,
                        max: 1.0,
                        onChanged: (value) {
                          setState(() {
                            _contrast = value;
                            _isAutoEnhance = false;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Text(
                        '${(_contrast * 100).toInt()}%',
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                
                // Brightness Control
                Row(
                  children: [
                    const SizedBox(width: 90, child: Text('Brightness', style: TextStyle(color: Colors.white))),
                    Expanded(
                      child: Slider(
                        value: _brightness,
                        min: -1.0,
                        max: 1.0,
                        onChanged: (value) {
                          setState(() {
                            _brightness = value;
                            _isAutoEnhance = false;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Text(
                        '${(_brightness * 100).toInt()}%',
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                
                // Threshold Control
                Row(
                  children: [
                    const SizedBox(width: 90, child: Text('Threshold', style: TextStyle(color: Colors.white))),
                    Expanded(
                      child: Slider(
                        value: _threshold,
                        min: 0.0,
                        max: 1.0,
                        onChanged: (value) {
                          setState(() {
                            _threshold = value;
                            _isAutoEnhance = false;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Text(
                        '${(_threshold * 100).toInt()}%',
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Preset Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPresetButton('Text', () {
                      setState(() {
                        _contrast = 0.5;
                        _brightness = 0.2;
                        _threshold = 0.7;
                        _isAutoEnhance = false;
                      });
                    }),
                    _buildPresetButton('Photo', () {
                      setState(() {
                        _contrast = 0.2;
                        _brightness = 0.0;
                        _threshold = 0.4;
                        _isAutoEnhance = false;
                      });
                    }),
                    _buildPresetButton('Receipt', () {
                      setState(() {
                        _contrast = 0.6;
                        _brightness = 0.3;
                        _threshold = 0.8;
                        _isAutoEnhance = false;
                      });
                    }),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _contrast = 0.0;
                            _brightness = 0.0;
                            _threshold = 0.5;
                            _isAutoEnhance = false;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Reset'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Apply contrast and navigate to next screen
                          Navigator.pushNamed(context, '/add-page-flow');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Apply'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPresetButton(String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Color _getContrastColor() {
    // Simulate contrast effect with color
    if (_contrast > 0.5) {
      return Colors.grey.shade100;
    } else if (_contrast > 0) {
      return Colors.grey.shade200;
    } else if (_contrast < -0.5) {
      return Colors.grey.shade600;
    } else if (_contrast < 0) {
      return Colors.grey.shade400;
    } else {
      return Colors.grey.shade300;
    }
  }
}
