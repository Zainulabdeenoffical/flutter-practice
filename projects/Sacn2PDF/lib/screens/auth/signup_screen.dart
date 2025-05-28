// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);
//
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;
//   bool _agreeToTerms = false;
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Create Account'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Header
//                 Text(
//                   'Join Scan2PDF Pro',
//                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Create an account to start scanning',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                         color: Theme.of(context).textTheme.bodySmall?.color,
//                       ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 32),
//
//                 // Signup Form
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       // Name Field
//                       TextFormField(
//                         controller: _nameController,
//                         decoration: InputDecoration(
//                           labelText: 'Full Name',
//                           prefixIcon: const Icon(Icons.person),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your name';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 16),
//
//                       // Email Field
//                       TextFormField(
//                         controller: _emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           prefixIcon: const Icon(Icons.email),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           }
//                           if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                             return 'Please enter a valid email';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 16),
//
//                       // Password Field
//                       TextFormField(
//                         controller: _passwordController,
//                         obscureText: _obscurePassword,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           prefixIcon: const Icon(Icons.lock),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscurePassword ? Icons.visibility : Icons.visibility_off,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _obscurePassword = !_obscurePassword;
//                               });
//                             },
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a password';
//                           }
//                           if (value.length < 6) {
//                             return 'Password must be at least 6 characters';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 16),
//
//                       // Confirm Password Field
//                       TextFormField(
//                         controller: _confirmPasswordController,
//                         obscureText: _obscureConfirmPassword,
//                         decoration: InputDecoration(
//                           labelText: 'Confirm Password',
//                           prefixIcon: const Icon(Icons.lock_outline),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _obscureConfirmPassword = !_obscureConfirmPassword;
//                               });
//                             },
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please confirm your password';
//                           }
//                           if (value != _passwordController.text) {
//                             return 'Passwords do not match';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 16),
//
//                       // Terms and Conditions
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: _agreeToTerms,
//                             onChanged: (value) {
//                               setState(() {
//                                 _agreeToTerms = value ?? false;
//                               });
//                             },
//                           ),
//                           Expanded(
//                             child: Text(
//                               'I agree to the Terms of Service and Privacy Policy',
//                               style: Theme.of(context).textTheme.bodySmall,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//
//                       // Sign Up Button
//                   ElevatedButton(
//                     onPressed: _agreeToTerms
//                         ? () async {
//                       if (_formKey.currentState!.validate()) {
//                         try {
//                           final userCredential = await FirebaseAuth.instance
//                               .createUserWithEmailAndPassword(
//                             email: _emailController.text.trim(),
//                             password: _passwordController.text.trim(),
//                           );
//
//                           // Optionally update display name
//                           await userCredential.user?.updateDisplayName(_nameController.text.trim());
//
//                           // Navigate to home
//                           Navigator.pushReplacementNamed(context, '/home');
//                         } on FirebaseAuthException catch (e) {
//                           String message = 'Signup failed';
//                           if (e.code == 'email-already-in-use') {
//                             message = 'Email is already in use';
//                           } else if (e.code == 'invalid-email') {
//                             message = 'Invalid email';
//                           } else if (e.code == 'weak-password') {
//                             message = 'Password is too weak';
//                           }
//
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text(message)),
//                           );
//                         }
//                       }
//                     }
//                         : null,
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text('Create Account'),
//                   )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//
//                 // Divider
//                 Row(
//                   children: [
//                     const Expanded(child: Divider()),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Text(
//                         'Or sign up with',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                     ),
//                     const Expanded(child: Divider()),
//                   ],
//                 ),
//                 const SizedBox(height: 24),
//
//                 // Social Signup Buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _buildSocialButton(
//                       icon: Icons.g_mobiledata,
//                       onPressed: () async {
//                         try {
//                           final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//                           if (googleUser == null) {
//                             // The user canceled the sign-in
//                             return;
//                           }
//
//                           final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//
//                           final credential = GoogleAuthProvider.credential(
//                             accessToken: googleAuth.accessToken,
//                             idToken: googleAuth.idToken,
//                           );
//
//                           // Sign in to Firebase with the Google user credential
//                           UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//
//                           // Successfully signed in
//                           Navigator.pushReplacementNamed(context, '/home');
//
//                         } catch (e) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('Google sign-in failed: $e')),
//                           );
//                         }
//                       },
//                     ),
//                     _buildSocialButton(
//                       icon: Icons.facebook,
//                       onPressed: () async {
//                         try {
//                           final LoginResult result = await FacebookAuth.instance.login();
//
//                           if (result.status == LoginStatus.success) {
//                             final AccessToken accessToken = result.accessToken!;
//                             final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.tokenString);
//
//                             UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//                             User? user = userCredential.user;
//
//                             if (user != null) {
//                               Navigator.pushReplacementNamed(context, '/home');
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text("Failed to retrieve user info")),
//                               );
//                             }
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text("Facebook sign-in failed: ${result.message}")),
//                             );
//                           }
//                         } catch (e) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("Error signing in with Facebook: $e")),
//                           );
//                         }
//                       }
//                     ),
//                     _buildSocialButton(
//                       icon: Icons.apple,
//                       onPressed: () {
//                         // Handle Apple sign up
//                       },
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 24),
//
//                 // Sign In Link
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Already have an account? ",
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text('Sign in'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSocialButton({required IconData icon, required VoidCallback onPressed}) {
//     return InkWell(
//       onTap: onPressed,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         width: 60,
//         height: 60,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Theme.of(context).dividerColor,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Icon(
//           icon,
//           size: 30,
//         ),
//       ),
//     );
//   }
//
//
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUpWithEmail() async {
    if (_formKey.currentState!.validate()) {
      try {
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        await userCredential.user
            ?.updateDisplayName(_nameController.text.trim());

        Navigator.pushReplacementNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        String message = 'Signup failed';
        if (e.code == 'email-already-in-use') {
          message = 'Email is already in use';
        } else if (e.code == 'invalid-email') {
          message = 'Invalid email';
        } else if (e.code == 'weak-password') {
          message = 'Password is too weak';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Join Scan2PDF Pro',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Create an account to start scanning',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color:
                    Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
                const SizedBox(height: 32),

                // Full Name
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) =>
                  (value == null || value.trim().isEmpty)
                      ? 'Please enter your name'
                      : null,
                ),
                const SizedBox(height: 16),

                // Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value.trim())) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Confirm Password
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword =
                          !_obscureConfirmPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Terms Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          _agreeToTerms = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'I agree to the Terms of Service and Privacy Policy',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Signup Button
                ElevatedButton(
                  onPressed: _agreeToTerms ? _signUpWithEmail : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Create Account'),
                ),
                const SizedBox(height: 24),

                // Sign In Redirect
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Sign in'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

