import 'package:flutter/material.dart';

class FilterGrayscaleScreen extends StatefulWidget {
  const FilterGrayscaleScreen({Key? key}) : super(key: key);

  @override
  _FilterGrayscaleScreenState createState() => _FilterGrayscaleScreenState();
}

class _FilterGrayscaleScreenState extends State<FilterGrayscaleScreen> {
  String _selectedFilter = 'original';
  double _brightness = 0.0;
  double _contrast = 0.0;
  double _saturation = 0.0;

  final List<Map<String, dynamic>> _filters = [
    {'id': 'original', 'name': 'Original'},
    {'id': 'grayscale', 'name': 'Grayscale'},
    {'id': 'blackwhite', 'name': 'B&W'},
    {'id': 'enhance', 'name': 'Enhance'},
    {'id': 'sharpen', 'name': 'Sharpen'},
    {'id': 'document', 'name': 'Document'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Enhance Document', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Image Preview with Filter
          Expanded(
            child: Center(
              child: Container(
                width: 300,
                height: 400,
                color: _getFilterColor(),
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
          
          // Filter Options
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.black,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final filter = _filters[index];
                final isSelected = filter['id'] == _selectedFilter;
                
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedFilter = filter['id'];
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: _getFilterColor(filterId: filter['id']),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected ? Colors.blue : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.description,
                              size: 30,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        filter['name'],
                        style: TextStyle(
                          color: isSelected ? Colors.blue : Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          
          // Adjustment Controls
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                
                // Saturation Control
                Row(
                  children: [
                    const SizedBox(width: 90, child: Text('Saturation', style: TextStyle(color: Colors.white))),
                    Expanded(
                      child: Slider(
                        value: _saturation,
                        min: -1.0,
                        max: 1.0,
                        onChanged: (value) {
                          setState(() {
                            _saturation = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Text(
                        '${(_saturation * 100).toInt()}%',
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    ),
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
                            _brightness = 0.0;
                            _contrast = 0.0;
                            _saturation = 0.0;
                            _selectedFilter = 'original';
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
                          // Apply filter and navigate to next screen
                          Navigator.pushNamed(context, '/filter-contrast');
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

  Color _getFilterColor({String? filterId}) {
    final filter = filterId ?? _selectedFilter;
    
    switch (filter) {
      case 'grayscale':
        return Colors.grey.shade400;
      case 'blackwhite':
        return Colors.grey.shade100;
      case 'enhance':
        return Colors.grey.shade300;
      case 'sharpen':
        return Colors.grey.shade200;
      case 'document':
        return Colors.grey.shade50;
      case 'original':
      default:
        return Colors.grey.shade300;
    }
  }
}
