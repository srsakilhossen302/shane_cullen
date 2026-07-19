import 'package:get/get.dart';
import '../../View/Screen/SplashScreen/splash_screen.dart';
import '../../View/Screen/Auth/login/login_screen.dart';
import '../../View/Screen/Auth/login/sign_in_screen.dart';
import '../../View/Screen/Auth/register/register_screen.dart';
import '../../View/Screen/Auth/selection/selection_screen.dart';
import '../../View/Screen/Auth/qualification/qualification_management_screen.dart';
import '../../View/Screen/Auth/qualification/upload_document_screen.dart';
import '../../View/Screen/Auth/qualification/verification_status_screen.dart';
import '../../View/Screen/Auth/qualification/verification_complete_screen.dart';
import '../../View/Screen/Auth/register/applicant_profile_screen.dart';
import '../../View/Screen/Auth/register/parent_profile_screen.dart';
import '../../View/Screen/Auth/forgot_password/forgot_password_screen.dart';
import '../../View/Screen/Auth/forgot_password/check_email_screen.dart';
import '../../View/Screen/Dashboard/dashboard_screen.dart';
import '../../View/Screen/Home/details/event_details_screen.dart';
import '../../View/Screen/Home/registration/registration_category_screen.dart';
import '../../View/Screen/Home/registration/athlete_credentials_screen.dart';
import '../../View/Screen/Home/registration/division_selection_screen.dart';
import '../../View/Screen/Home/registration/full_contact_screen.dart';
import '../../View/Screen/Home/registration/non_contact_registration_screen.dart';
import '../../View/Screen/Home/registration/camp_registration_screen.dart';
import '../../View/Screen/Home/registration/review_registration_screen.dart';
import '../../View/Screen/Home/registration/competitor_indemnity_screen.dart';
import '../../View/Screen/Home/registration/payment_screen.dart';
import '../../View/Screen/Home/registration/payment_success_screen.dart';
import '../../View/Screen/Home/registration/match_officials_screen.dart';
import '../../View/Screen/Profile/competition_history_screen.dart';
import '../../View/Screen/Profile/tournament_performance_screen.dart';
import '../../View/Screen/Profile/teams_screen.dart';

class AppRoute {
  static const String splash = "/splash_screen";
  static const String login = "/login_screen";
  static const String register = "/register_screen";
  static const String selection = "/selection_screen";
  static const String qualificationManagement = "/qualification_management_screen";
  static const String uploadDocument = "/upload_document_screen";
  static const String verificationStatus = "/verification_status_screen";
  static const String verificationComplete = "/verification_complete_screen";
  static const String signIn = "/sign_in_screen";
  static const String forgotPassword = "/forgot_password_screen";
  static const String checkEmail = "/check_email_screen";
  static const String applicantProfile = "/applicant_profile_screen";
  static const String parentProfile = "/parent_profile_screen";
  static const String home = "/home_screen";
  static const String eventDetails = "/event_details";
  static const String registrationCategory = "/registration_category";
  static const String athleteCredentials = "/athlete_credentials";
  static const String divisionSelection = "/division_selection";
  static const String fullContact = "/full_contact";
  static const String nonContact = "/non_contact";
  static const String campRegistration = "/camp_registration";
  static const String reviewRegistration = "/review_registration";
  static const String competitorIndemnity = "/competitor_indemnity";
  static const String payment = "/payment";
  static const String paymentSuccess = "/payment_success";
  static const String matchOfficials = "/match_officials";
  static const String competitionHistory = "/competition_history";
  static const String tournamentPerformance = "/tournament_performance";
  static const String teams = "/teams_screen";

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: selection,
      page: () => const SelectionScreen(),
    ),
    GetPage(
      name: qualificationManagement,
      page: () => const QualificationManagementScreen(),
    ),
    GetPage(
      name: uploadDocument,
      page: () => const UploadDocumentScreen(),
    ),
    GetPage(
      name: verificationStatus,
      page: () => const VerificationStatusScreen(),
    ),
    GetPage(
      name: verificationComplete,
      page: () => const VerificationCompleteScreen(),
    ),
    GetPage(
      name: signIn,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: checkEmail,
      page: () => const CheckEmailScreen(),
    ),
    GetPage(
      name: applicantProfile,
      page: () => const ApplicantProfileScreen(),
    ),
    GetPage(
      name: parentProfile,
      page: () => const ParentProfileScreen(),
    ),
    GetPage(
      name: home,
      page: () => const DashboardScreen(),
    ),
    GetPage(
      name: eventDetails,
      page: () => const EventDetailsScreen(),
    ),
    GetPage(
      name: registrationCategory,
      page: () => const RegistrationCategoryScreen(),
    ),
    GetPage(
      name: athleteCredentials,
      page: () => const AthleteCredentialsScreen(),
    ),
    GetPage(
      name: divisionSelection,
      page: () => const DivisionSelectionScreen(),
    ),
    GetPage(
      name: fullContact,
      page: () => const FullContactScreen(),
    ),
    GetPage(
      name: nonContact,
      page: () => const NonContactRegistrationScreen(),
    ),
    GetPage(
      name: campRegistration,
      page: () => const CampRegistrationScreen(),
    ),
    GetPage(
      name: reviewRegistration,
      page: () => const ReviewRegistrationScreen(),
    ),
    GetPage(
      name: competitorIndemnity,
      page: () => const CompetitorIndemnityScreen(),
    ),
    GetPage(
      name: payment,
      page: () => const PaymentScreen(),
    ),
    GetPage(
      name: paymentSuccess,
      page: () => const PaymentSuccessScreen(),
    ),
    GetPage(
      name: matchOfficials,
      page: () => const MatchOfficialsScreen(),
    ),
    GetPage(
      name: competitionHistory,
      page: () => const CompetitionHistoryScreen(),
    ),
    GetPage(
      name: tournamentPerformance,
      page: () => const TournamentPerformanceScreen(),
    ),
    GetPage(
      name: teams,
      page: () => const TeamsScreen(),
    ),
  ];
}
