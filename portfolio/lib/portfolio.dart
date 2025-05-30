import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const UzuWorksApp());
}
//asdadflñkj
class UzuWorksApp extends StatelessWidget {
  const UzuWorksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my-portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF2F2F2),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFF222222),
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            color: Color(0xFF333333),
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF444444),
          ),
        ),
      ),
      home: const UzuWorksHomePage(),
    );
  }
}//sd5465

class UzuWorksHomePage extends StatelessWidget {
  const UzuWorksHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isDesktop = screenSize.width > 900;
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 48.0 : 16.0,
              vertical: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                const SizedBox(height: 40),
                
                // Main content
                isDesktop
                    ? _buildDesktopHeader(context)
                    : _buildMobileHeader(context),
                
                const SizedBox(height: 80),
                
                // Original Projects section
                _buildSectionHeader(
                  'Original Projects',
                  'Full-stack applications I designed and developed from scratch',
                  Icons.rocket_launch,
                  const Color(0xFF2196F3),
                ),
                const SizedBox(height: 32),
                isDesktop
                    ? _buildDesktopProjects(context)
                    : _buildMobileProjects(context),
                    
                const SizedBox(height: 80),

                // Documentation Projects section
                _buildSectionHeader(
                  'Technical Documentation Contributions',
                  'Open source projects enhanced with comprehensive bilingual documentation (English/German)',
                  Icons.translate,
                  const Color(0xFF4CAF50),
                ),
                const SizedBox(height: 32),
                isDesktop
                    ? _buildDesktopDocumentationProjects(context)
                    : _buildMobileDocumentationProjects(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildSectionHeader(String title, String subtitle, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 24,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF222222),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDesktopHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Text content
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'A software engineer',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              Text(
                "Hi, I'm Carolina, a software engineer from Colombia. I create educational & productivity apps and contribute to open source projects with multilingual documentation.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              _buildSocialLinks(),
            ],
          ),
        ),
        
        // Right side - Image
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(left: 24),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                'assets/images/FOTO%20DE%20PERFIL.jpg',
                height: 440,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildMobileHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A software engineer',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Hi, I'm Carolina, a software engineer from Colombia. I create educational & productivity apps and contribute to open source projects with multilingual documentation.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        _buildSocialLinks(),
        const SizedBox(height: 24),
        Container(
          height: 200,
          width: double.infinity,//
          decoration: BoxDecoration(//
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              'assets/images/FOTO DE PERFIL.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildSocialLinks() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        // _buildSocialLink('LinkedIn', 'https://linkedin.com/in/carolina'),
        // _buildDivider(),
        // _buildSocialLink('GitHub', 'https://github.com/codemotozu'),
        // _buildDivider(),
        // _buildSocialLink('Email', 'mailto:carolina@example.com'),
      ],
    );
  }
  
  Widget _buildSocialLink(String title, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF333333),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
  
  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(
        '|',
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[400],
        ),
      ),
    );
  }
  
  Widget _buildDesktopProjects(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildPomofocusCard(context)),
        const SizedBox(width: 20),
        Expanded(child: _buildAwesomeToolsCard(context)),
        const SizedBox(width: 20),
        Expanded(child: _buildHondanaCard(context)),
      ],
    );
  }
  
  Widget _buildMobileProjects(BuildContext context) {
    return Column(
      children: [
        _buildPomofocusCard(context),
        const SizedBox(height: 20),
        _buildAwesomeToolsCard(context),
        const SizedBox(height: 20),
        _buildHondanaCard(context),
      ],
    );
  }

  // Documentation Projects Layout - 3 per row, then remaining projects
  Widget _buildDesktopDocumentationProjects(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildSnakeGameCard(context)),
            const SizedBox(width: 20),
            Expanded(child: _buildSelfDrivingCarCard(context)),
            const SizedBox(width: 20),
            Expanded(child: _buildTMRLCard(context)),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildGravitySimCard(context)),
            const SizedBox(width: 20),
            Expanded(child: _buildTetrisGameCard(context)),
            Expanded(child: Container()), // Empty space
          ],
        ),
      ],
    );
  }
  
  Widget _buildMobileDocumentationProjects(BuildContext context) {
    return Column(
      children: [
        _buildSnakeGameCard(context),
        const SizedBox(height: 20),
        _buildSelfDrivingCarCard(context),
        const SizedBox(height: 20),
        _buildTMRLCard(context),
        const SizedBox(height: 20),
        _buildGravitySimCard(context),
        const SizedBox(height: 20),
        _buildTetrisGameCard(context),
      ],
    );
  }
  
  // Original Project Cards
  Widget _buildPomofocusCard(BuildContext context) {
    final languages = [
      Language('JavaScript', 79.7, const Color(0xFFf1e05a)),
      Language('Dart', 18.5, const Color(0xFF00B4AB)),
      Language('C++', 0.6, const Color(0xFF4F5D95)),
      Language('HTML', 0.6, const Color(0xFFe34c26)),
      Language('CMake', 0.5, const Color(0xFF563d7c)),
      Language('Swift', 0.1, const Color(0xFFffac45)),
    ];
    
    final services = [
      TechItem('MongoDB', '🍃'),
      TechItem('PayPal', '💳'),
    ];
    
    final infrastructure = [
      TechItem('Heroku', '☁️'),
      TechItem('GitHub Actions', '🔄'),
    ];
    
    return ProjectCard(
      backgroundColor: const Color(0xFFFFF8E1),
      iconBackgroundColor: const Color(0xFFFF6347),
      icon: Icons.timer,
      title: 'Pomoworko',
      description: 'A productivity-focused Pomodoro timer with user analytics and payment integration',
      repoUrl: 'https://github.com/codemotozu/Documented-open_source-pomoworko.com-',
      languages: languages,
      services: services,
      infrastructure: infrastructure,
      imageAsset: 'assets/images/pomoworko.png',
      onTap: () => _launchURL('https://pomoworko.com/'),
      isDocumentation: false,
    );
  }

  Widget _buildAwesomeToolsCard(BuildContext context) {
    final languages = [
      Language('Jupyter Notebook', 99.7, const Color(0xFFDA5B0B)),
      Language('Python', 0.3, const Color(0xFF3572A5)),
    ];
      
    final services = [
      TechItem('Roboflow', '🤖'),
      TechItem('Google Colab', '📊'),
    ];
      
    final infrastructure = [
      TechItem('Roboflow', '🤖'),
      TechItem('Google Colab', '📊'),
    ];
      
    return ProjectCard(
      backgroundColor: const Color(0xFFFFF8E1),
      iconBackgroundColor: const Color(0xFF26A69A),
      icon: Icons.recycling,
      title: 'Wastecare.ai',
      description: 'AI-powered computer vision application for waste classification and environmental monitoring',
      repoUrl: 'https://github.com/codemotozu/WasteCareAI',
      languages: languages,
      services: services,
      infrastructure: infrastructure,
      imageAsset: 'assets/images/wastecareai.png',
      onTap: () => _launchURL('https://codemotozu.github.io/waste_care.ai/'),
      isDocumentation: false,
    );
  }
  
  Widget _buildHondanaCard(BuildContext context) {
    final languages = [
      Language('Dart', 52.2, const Color(0xFF00B4AB)),
      Language('Python', 45.5, const Color(0xFF3572A5)),
      Language('Dockerfile', 2.3, const Color(0xFF384d54)),
    ];
    
    final services = [
      TechItem('Azure', '☁️'),
      TechItem('Google Gemini', '🤖'),
      TechItem('Picovoice', '🎙️'),
    ];
    
    final infrastructure = [
      TechItem('Azure Container Apps', '☁️'),
      TechItem('Docker Hub', '🐳'),
      TechItem('GitHub Actions', '🔄'),
    ];
    
    return ProjectCard(
      backgroundColor: const Color(0xFFE3F2FD),
      iconBackgroundColor: const Color(0xFF2196F3),
      icon: Icons.translate,
      title: 'SpeakAndTranslate',
      description: 'AI-powered language learning application with speech recognition and real-time translation',
      repoUrl: 'https://github.com/codemotozu/Documented_Speak_and_Translate_App',
      languages: languages,
      services: services,
      infrastructure: infrastructure,
      imageAsset: 'assets/images/speakandtranslate.png',
      onTap: () => _launchURL('https://codemotozu.github.io/speak_and_translate_app/'),
      isDocumentation: false,
    );
  }

  // Documentation Project Cards
  Widget _buildSnakeGameCard(BuildContext context) {
    final languages = [
      Language('Python', 100.0, const Color(0xFF3572A5)),
    ];

    final services = [
      TechItem('PyTorch', '🔥'),
      TechItem('Pygame', '🎮'),
      TechItem('NumPy', '🔢'),
      TechItem('Matplotlib', '📊'),
      TechItem('Deep Q-Learning', '🧠'),
      TechItem('Reinforcement Learning', '🎯'),
    ];
      
    final infrastructure = [
      TechItem('Line-by-line German', '🇩🇪'),
      TechItem('Technical English', '🇺🇸'),
      TechItem('Algorithm Analysis', '🧮'),
      TechItem('AI Logic Explained', '🤖'),
    ];
      
    return ProjectCard(
      backgroundColor: const Color(0xFFE8F5E8),
      iconBackgroundColor: const Color(0xFF4CAF50),
      icon: Icons.description,
      title: 'Snake Game AI - Technical Documentation',
      description: 'Comprehensive bilingual documentation of reinforcement learning Snake AI with detailed algorithm explanations and German technical translations',
      repoUrl: 'https://github.com/codemotozu/snake-ai-pytorch-documented',
      languages: languages,
      services: services,
      infrastructure: infrastructure, 
      imageAsset: 'assets/images/ChatGPT%20snake%20game.png',
      onTap: () {}, // No main card click
      isDocumentation: true,
    );
  }

  Widget _buildSelfDrivingCarCard(BuildContext context) {
    final languages = [
      Language('Python', 98.0, const Color(0xFF3572A5)),
      Language('Shell', 2.0, const Color(0xFF89e051)),
    ];
    
    final services = [
      TechItem('PyTorch Lightning', '⚡'),
      TechItem('EfficientNetV2', '🧠'),
      TechItem('Transformer Encoder', '🔄'),
      TechItem('OpenCV', '👁️'),
      TechItem('Computer Vision', '📷'),
      TechItem('Deep Learning', '🤖'),
    ];
    
    final infrastructure = [
      TechItem('German Technical Terms', '🇩🇪'),
      TechItem('Model Architecture Docs', '📊'),
      TechItem('Algorithm Analysis', '🧮'),
      TechItem('Training Documentation', '📈'),
      TechItem('Real-time Inference Guide', '⚡'),
      TechItem('Performance Metrics', '📋'),
    ];
    
    return ProjectCard(
      backgroundColor: const Color(0xFFE8F0FE),
      iconBackgroundColor: const Color(0xFF1976D2),
      icon: Icons.description,
      title: 'Self-Driving Car AI - Comprehensive Documentation',
      description: 'Detailed bilingual documentation of deep neural network for Grand Theft Auto V self-driving with PyTorch Lightning, transformer architecture, and German technical translations',
      repoUrl: 'https://github.com/codemotozu/Self-Driving-Car-in-Video-Games-Documented',
      languages: languages,
      services: services,
      infrastructure: infrastructure,
      imageAsset: 'assets/images/self_driving_car.png',
      onTap: () {},
      isDocumentation: true,
    );
  }

  Widget _buildTMRLCard(BuildContext context) {
    final languages = [
      Language('Python', 99.8, const Color(0xFF3572A5)),
      Language('Shell', 0.2, const Color(0xFF89e051)),
    ];
    
    // Technologies Used section
    final services = [
      TechItem('PyTorch', '🔥'),
      TechItem('Reinforcement Learning', '🎯'),
      TechItem('Deep Q-Learning', '🧠'),
      TechItem('Computer Vision', '👁️'),
      TechItem('NumPy', '🔢'),
      TechItem('OpenCV', '📷'),
    ];
    
    // Documentation Features section
    final infrastructure = [
      TechItem('Bilingual Documentation', '🌍'),
      TechItem('German Technical Terms', '🇩🇪'),
      TechItem('Algorithm Analysis', '🧮'),
      TechItem('Code Explanations', '📝'),
      TechItem('Technical Architecture', '🏗️'),
      TechItem('Performance Metrics', '📊'),
    ];
    
    return ProjectCard(
      backgroundColor: const Color(0xFFFFF3E0),
      iconBackgroundColor: const Color(0xFFFF9800),
      icon: Icons.description,
      title: 'TMRL - TrackMania ML Documentation',
      description: 'Comprehensive bilingual documentation of reinforcement learning framework for TrackMania with detailed algorithm explanations and German technical translations',
      repoUrl: 'https://github.com/codemotozu/tmrl-Trackmania-Video-Game-Machine-Learning-Documented',
      languages: languages,
      services: services,
      infrastructure: infrastructure,
      imageAsset: 'assets/images/trackmania.png',
      onTap: () {},
      isDocumentation: true,
    );
  }

  Widget _buildGravitySimCard(BuildContext context) {
    final languages = [
      Language('C++', 100.0, const Color(0xFFf54d82)),
    ];
    
    // Technologies Used section
    final services = [
      TechItem('OpenGL 3.3', '🎨'),
      TechItem('GLFW3', '🪟'),
      TechItem('GLEW', '⚡'),
      TechItem('GLM Mathematics', '📐'),
      TechItem('Newton\'s Physics', '🌌'),
      TechItem('3D Rendering', '🔺'),
    ];
    
    // Documentation Features section
    final infrastructure = [
      TechItem('Bilingual Documentation', '🌍'),
      TechItem('Graphics Pipeline Guide', '🎨'),
      TechItem('VS Code Integration', '💻'),
      TechItem('Physics Explanations', '⚛️'),
      TechItem('OpenGL Concepts', '🎯'),
      TechItem('Development Setup', '🛠️'),
    ];
    
    return ProjectCard(
      backgroundColor: const Color(0xFFF3E5F5),
      iconBackgroundColor: const Color(0xFF9C27B0),
      icon: Icons.description,
      title: 'Gravity Simulation 3D - Technical Documentation',
      description: 'Comprehensive bilingual documentation of real-time 3D gravitational N-body simulation with detailed OpenGL concepts, physics calculations, and complete development environment setup',
      repoUrl: 'https://github.com/codemotozu/gravity_simulation_documented/tree/main',
      languages: languages,
      services: services,
      infrastructure: infrastructure,
      imageAsset: 'assets/images/gravity.png',
      onTap: () {},
      isDocumentation: true,
    );
  }

  Widget _buildTetrisGameCard(BuildContext context) {
    final languages = [
      Language('C++', 100.0, const Color(0xFFf54d82)),
    ];
    
    // Technologies Used section
    final services = [
      TechItem('Raylib Graphics', '🎮'),
      TechItem('Audio System', '🔊'),
      TechItem('Game Loop Design', '🔄'),
      TechItem('Collision Detection', '💥'),
      TechItem('OOP Architecture', '🏗️'),
      TechItem('Resource Management', '📦'),
    ];
    
    // Documentation Features section
    final infrastructure = [
      TechItem('Bilingual Code Comments', '🌍'),
      TechItem('Line-by-Line German', '🇩🇪'),
      TechItem('Game Logic Explained', '🎯'),
      TechItem('Architecture Breakdown', '🏛️'),
      TechItem('Video Tutorial', '🎬'),
      TechItem('Build Instructions', '⚙️'),
    ];
    
    return ProjectCard(
      backgroundColor: const Color(0xFFF1F8E9),
      iconBackgroundColor: const Color(0xFF689F38),
      icon: Icons.description,
      title: 'C++ Tetris Game - Complete Documentation',
      description: 'Comprehensive bilingual documentation of a full Tetris implementation using raylib with detailed game mechanics, rendering pipeline, and complete German technical translations',
      repoUrl: 'https://github.com/codemotozu/Cpp-Tetris-Game-with-raylib-Documented/tree/main',
      languages: languages,
      services: services,
      infrastructure: infrastructure,
      imageAsset: 'assets/images/tetris.png',
      onTap: () {},
      isDocumentation: true,
    );
  }
  
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}

class ProjectCard extends StatelessWidget {
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final IconData icon;
  final String title;
  final String description;
  final String? repoUrl;
  final List<Language>? languages;
  final List<TechItem>? services;
  final List<TechItem>? infrastructure;
  final String? imageAsset;
  final Widget? bannerContent;
  final VoidCallback onTap;
  final bool isDocumentation;

  const ProjectCard({
    super.key,
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.icon,
    required this.title,
    required this.description,
    this.repoUrl,
    this.languages,
    this.services,
    this.infrastructure,
    this.imageAsset,
    this.bannerContent,
    required this.onTap,
    this.isDocumentation = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDocumentation ? Colors.green.shade200 : Colors.grey.shade200,
          width: isDocumentation ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with icon and title
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF222222),
                        ),
                      ),
                      if (isDocumentation) ...[
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.green.shade200),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.translate,
                                size: 14,
                                color: Colors.green.shade700,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Documentation Contribution',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Project Image or Banner
          if (imageAsset != null)
            InkWell(
              onTap: onTap,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: backgroundColor,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        imageAsset!,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    // Clickable indicator overlay
                    if (!isDocumentation) // Only show for non-documentation projects
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.launch,
                                size: 12,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'View Live Site',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          else if (bannerContent != null)
            InkWell(
              onTap: onTap,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                ),
                padding: const EdgeInsets.all(16.0),
                child: bannerContent,
              ),
            ),
            
          // Description
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF555555),
                    height: 1.5,
                  ),
                ),
                
                // Repository URL
                if (repoUrl != null) ...[
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () => _launchRepoURL(repoUrl!),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isDocumentation ? Icons.article : Icons.code,
                            size: 16,
                            color: Colors.blue.shade700,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            isDocumentation ? 'View Documentation' : 'View Repository',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                
                // Languages Section
                if (languages != null && languages!.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _buildLanguagesSection(),
                ],
                
                if (services != null && services!.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    _buildTechSection('Services', services!),
                  ],
                
                // Infrastructure Section
                if (infrastructure != null && infrastructure!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  _buildTechSection('Deployment', infrastructure!),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildLanguagesSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1a1a1a),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Languages',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          // Percentage bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              height: 8,
              child: Row(
                children: languages!.map((lang) {
                  return Expanded(
                    flex: (lang.percentage * 10).round(),
                    child: Container(
                      color: lang.color,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Language list
          Wrap(
            spacing: 20,
            runSpacing: 8,
            children: languages!.map((lang) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: lang.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${lang.name} ${lang.percentage.toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTechSection(String title, List<TechItem> items) {
    // Dynamic title based on documentation project and section
    String sectionTitle = title;
    if (isDocumentation) {
      if (title == 'Services') {
        sectionTitle = 'Technologies Used';
      } else if (title == 'Deployment') {
        sectionTitle = 'Documentation Features';
      }
    }
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1a1a1a),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionTitle,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          // Tech items
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: items.map((item) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.emoji,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _launchRepoURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}

// Class to represent a programming language with its percentage and color
class Language {
  final String name;
  final double percentage;
  final Color color;
  
  Language(this.name, this.percentage, this.color);
}

// Class to represent a service or infrastructure item with emoji
class TechItem {
  final String name;
  final String emoji;
  
  TechItem(this.name, this.emoji);
}