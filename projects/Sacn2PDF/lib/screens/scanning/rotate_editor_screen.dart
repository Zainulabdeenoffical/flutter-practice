import 'package:flutter/material.dart';

class RotateEditorScreen extends StatefulWidget {
  const RotateEditorScreen({Key? key}) : super(key: key);

  @override
  _RotateEditorScreenState createState() => _RotateEditorScreenState();
}

class _RotateEditorScreenState extends State<RotateEditorScreen> {
  double _rotation = 0.0;
  bool _isGridVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Rotate Document', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isGridVisible ? Icons.grid_on : Icons.grid_off,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isGridVisible = !_isGridVisible;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Image Preview with Rotation
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Grid background (if visible)
                  if (_isGridVisible)
                    Container(
                      width: 320,
                      height: 420,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600),
                        image: const DecorationImage(
                          image: NetworkImage('https://via.placeholder.com/320x420?text=Grid'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  
                  // Rotated image
                  Transform.rotate(
                    angle: _rotation,
                    child: Container(
                      width: 300,
                      height: 400,
                      color: Colors.grey.shade300,
                      child: Center(
                        child: Icon(
                          Icons.description,
                          size: 100,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
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
                // Rotation Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildRotateButton(
                      icon: Icons.rotate_left,
                      label: '-90°',
                      onPressed: () {
                        setState(() {
                          _rotation -= 1.5708; // -90 degrees in radians
                        });
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildRotateButton(
                      icon: Icons.rotate_right,
                      label: '+90°',
                      onPressed: () {
                        setState(() {
                          _rotation += 1.5708; // +90 degrees in radians
                        });
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildRotateButton(
                      icon: Icons.refresh,
                      label: 'Reset',
                      onPressed: () {
                        setState(() {
                          _rotation = 0.0;
                        });
                      },
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Fine Rotation Control
                Row(
                  children: [
                    const Icon(Icons.rotate_left, color: Colors.white),
                    Expanded(
                      child: Slider(
                        value: _rotation % (2 * 3.14159),
                        min: -3.14159,
                        max: 3.14159,
                        onChanged: (value) {
                          setState(() {
                            _rotation = value;
                          });
                        },
                      ),
                    ),
                    const Icon(Icons.rotate_right, color: Colors.white),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Apply rotation and navigate to next screen
                          Navigator.pushNamed(context, '/filter-grayscale');
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

  Widget _buildRotateButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
