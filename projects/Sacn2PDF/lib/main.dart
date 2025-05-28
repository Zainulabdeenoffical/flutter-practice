import 'package:flutter/material.dart';

import 'screens/auth/splash_screen.dart';
import 'screens/auth/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/forgot_password_screen.dart';

import 'screens/home/home_screen.dart';
import 'screens/navigation/bottom_navigation.dart';
import 'screens/navigation/drawer_menu.dart';
import 'screens/navigation/notifications_screen.dart';
import 'screens/navigation/profile_overview_screen.dart';

import 'screens/scanning/camera_screen.dart';
import 'screens/scanning/scan_confirmation_screen.dart';
import 'screens/scanning/crop_editor_screen.dart';
import 'screens/scanning/rotate_editor_screen.dart';
import 'screens/scanning/filter_grayscale_screen.dart';
import 'screens/scanning/filter_contrast_screen.dart';
import 'screens/scanning/add_page_flow_screen.dart';
import 'screens/scanning/page_reorder_screen.dart';
import 'screens/scanning/pdf_preview_screen.dart';
import 'screens/scanning/save_confirmation_screen.dart';

import 'screens/pdf_management/pdfs_list_screen.dart';
import 'screens/pdf_management/view_single_pdf_screen.dart';
import 'screens/pdf_management/create_folder_screen.dart';
import 'screens/pdf_management/folder_list_view_screen.dart';
import 'screens/pdf_management/move_to_folder_screen.dart';
import 'screens/pdf_management/rename_pdf_screen.dart';
import 'screens/pdf_management/delete_pdf_screen.dart';
import 'screens/pdf_management/export_pdf_options_screen.dart';
import 'screens/pdf_management/share_modal_screen.dart';
import 'screens/pdf_management/print_preview_screen.dart';

import 'screens/advanced_tools/ocr_text_viewer_screen.dart';
import 'screens/advanced_tools/add_watermark_screen.dart';
import 'screens/advanced_tools/add_signature_screen.dart';
import 'screens/advanced_tools/password_lock_setup_screen.dart';
import 'screens/advanced_tools/upload_drive_screen.dart';
import 'screens/advanced_tools/email_pdf_form_screen.dart';
import 'screens/advanced_tools/export_options_screen.dart';
import 'screens/advanced_tools/cloud_sync_prompt_screen.dart';

import 'screens/settings/profile_settings_screen.dart';
import 'screens/settings/change_password_screen.dart';
import 'screens/settings/app_theme_toggle_screen.dart';
import 'screens/settings/storage_preference_screen.dart';
import 'screens/settings/language_settings_screen.dart';

import 'screens/help/help_center_screen.dart';
import 'screens/help/faq_screen.dart';
import 'screens/help/submit_feedback_screen.dart';
import 'screens/help/contact_us_screen.dart';
import 'screens/help/about_app_screen.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_core/firebase_core.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   runApp(const MyApp());
// }
const FirebaseOptions firebaseWebOptions = FirebaseOptions(
  apiKey: "AIzaSyBAe-JqSXEAw--yURVl6MigIwp6ze3OaZQ",
  authDomain: "scan2pdf-c49fc.firebaseapp.com",
  projectId: "scan2pdf-c49fc",
  storageBucket: "scan2pdf-c49fc.firebasestorage.app",
  messagingSenderId: "42585419700",
  appId: "1:42585419700:web:9bd04015da1e05107e0ce1",
  measurementId: "G-DBL5NP95BJ",
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase differently for Web and other platforms
  if (kIsWeb) {
    await Firebase.initializeApp(options: firebaseWebOptions);
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan2PDF Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: Colors.blue.shade600,
          onPrimary: Colors.white,
          secondary: Colors.blue.shade400,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: Colors.blue.shade500,
          onPrimary: Colors.white,
          secondary: Colors.blue.shade400,
          surface: Colors.grey.shade800,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.grey.shade900,
        fontFamily: 'Roboto',
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/bottom-navigation': (context) => const BottomNavigation(),
        '/drawer-menu': (context) => const DrawerMenu(),
        '/notifications': (context) => const NotificationsScreen(),
        '/profile-overview': (context) => const ProfileOverviewScreen(),
        '/camera': (context) => msCameraScreen(),
        '/scan-confirmation': (context) => const ScanConfirmationScreen(),
        '/crop-editor': (context) => const CropToPdfScreen(),
        '/rotate-editor': (context) => const RotateEditorScreen(),
        '/filter-grayscale': (context) => const FilterGrayscaleScreen(),
        '/filter-contrast': (context) => const FilterContrastScreen(),
        '/add-page-flow': (context) => const AddPageFlowScreen(),
        '/page-reorder': (context) => const PageReorderScreen(),
        '/pdf-preview': (context) => const mPDFPreviewScreen(),
        '/save-confirmation': (context) => const SaveConfirmationScreen(),
        '/pdfs-list': (context) => const PdfsListScreen(),
        '/view-single-pdf': (context) => const ViewSinglePdfScreen(),
        '/create-folder': (context) => const CreateFolderScreen(),
        '/folder-list-view': (context) => const FolderListViewScreen(),
        '/move-to-folder': (context) => const MoveToFolderScreen(),
        '/rename-pdf': (context) => const RenamePdfScreen(),
        '/delete-pdf': (context) => const DeletePdfScreen(),
        '/export-pdf-options': (context) => const ExportPdfOptionsScreen(),
        '/share-modal': (context) => const ShareModalScreen(),
        '/print-preview': (context) => const PrintPreviewScreen(),
        '/ocr-text-viewer': (context) => const OcrTextViewerScreen(),
        '/add-watermark': (context) => const AddWatermarkScreen(),
        '/add-signature': (context) => const AddSignatureScreen(),
        '/password-lock-setup': (context) => const PasswordLockSetupScreen(),
        '/upload-drive': (context) => const UploadDriveScreen(),
        '/email-pdf-form': (context) => const EmailPdfFormScreen(),
        '/export-options': (context) => const ExportOptionsScreen(),
        '/cloud-sync-prompt': (context) => const CloudSyncPromptScreen(),
        '/profile-settings': (context) => const ProfileSettingsScreen(),
        '/change-password': (context) => const ChangePasswordScreen(),
        '/app-theme-toggle': (context) => const AppThemeToggleScreen(),
        '/storage-preference': (context) => const StoragePreferenceScreen(),
        '/language-settings': (context) => const LanguageSettingsScreen(),
        '/help-center': (context) => const HelpCenterScreen(),
        '/faq': (context) => const FaqScreen(),
        '/submit-feedback': (context) => const SubmitFeedbackScreen(),
        '/contact-us': (context) => const ContactUsScreen(),
        '/about-app': (context) => const AboutAppScreen(),
      },
    );
  }
}
