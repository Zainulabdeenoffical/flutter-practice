import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      title: 'Welcome to Scan2PDF Pro',
      description: 'The ultimate document scanning solution for your mobile device.',
      icon: Icons.document_scanner,
      image: 'assets/images/onboarding1.png',
    ),
    OnboardingItem(
      title: 'Scan Any Document',
      description: 'Quickly scan documents, receipts, IDs, and more with your camera.',
      icon: Icons.camera_alt,
      image: 'assets/images/onboarding2.png',
    ),
    OnboardingItem(
      title: 'Edit & Organize',
      description: 'Crop, rotate, and enhance your scans. Organize them into folders.',
      icon: Icons.edit,
      image: 'assets/images/onboarding3.png',
    ),
    OnboardingItem(
      title: 'Share & Export',
      description: 'Share your PDFs via email or messaging apps. Export to various formats.',
      icon: Icons.share,
      image: 'assets/images/onboarding4.png',
    ),
    OnboardingItem(
      title: 'Cloud Sync',
      description: 'Automatically back up your documents to the cloud for safekeeping.',
      icon: Icons.cloud_upload,
      image: 'assets/images/onboarding5.png',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _onboardingItems.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Skip Button
            Positioned(
              top: 16,
              right: 16,
              child: TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                child: const Text('Skip'),
              ),
            ),
            
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _onboardingItems.length,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return _buildOnboardingPage(_onboardingItems[index]);
                    },
                  ),
                ),
                
                // Page Indicators
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _onboardingItems.length,
                      (index) => _buildPageIndicator(index),
                    ),
                  ),
                ),
                
                // Navigation Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: _currentPage == 0 ? null : _previousPage,
                        icon: const Icon(Icons.chevron_left),
                        label: const Text('Back'),
                      ),
                      _currentPage < _onboardingItems.length - 1
                          ? ElevatedButton.icon(
                              onPressed: _nextPage,
                              icon: const Text('Next'),
                              label: const Icon(Icons.chevron_right),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                              child: const Text('Get Started'),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingItem item) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image Container
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  item.icon,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                ),
                // In a real app, you would use Image.asset instead of a placeholder
                // Image.asset(item.image, width: 200, height: 200),
                // Using a placeholder for this example
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      item.icon,
                      size: 100,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Text(
            item.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            item.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int index) {
    bool isCurrentPage = index == _currentPage;
    return GestureDetector(
      onTap: () => _goToPage(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        width: isCurrentPage ? 12.0 : 8.0,
        height: isCurrentPage ? 12.0 : 8.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCurrentPage
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final IconData icon;
  final String image;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.image,
  });
}
