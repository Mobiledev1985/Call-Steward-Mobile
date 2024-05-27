import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'route_paths.dart';
import 'package:call_steward/screens/change_local/change_local.dart';
import 'package:call_steward/screens/availibility/availability_screen.dart';
import 'package:call_steward/screens/vacation/vacation_screen.dart';
import 'package:call_steward/screens/calendar/job_details_screen.dart';
import 'package:call_steward/screens/home/location_screen.dart';
import 'package:call_steward/screens/employee/employee_loading_screen.dart';
import 'package:call_steward/screens/home/job_calls_screen.dart';
import 'package:call_steward/screens/schedule_log/schedule_notifi_and_action_log_screen.dart';
import 'package:call_steward/screens/my_profile/my_profile_screen.dart';
import 'package:call_steward/screens/calendar/calendar_screen.dart';
import 'package:call_steward/screens/wishlist/wishlist_screen.dart';
import 'package:call_steward/screens/employee/continue_screen.dart';
import 'package:call_steward/screens/home/home_screen.dart';
import 'package:call_steward/screens/auth/language_screen.dart';
import 'package:call_steward/screens/auth/login/login_screen.dart';
import 'package:call_steward/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:call_steward/screens/auth/forgot_password/check_your_mail_screen.dart';
import 'package:call_steward/screens/auth/forgot_password/forgot_password_with_sms_screen.dart';
import 'package:call_steward/screens/auth/forgot_password/otp_screen.dart';
import 'package:call_steward/screens/auth/forgot_password/update_password_screen.dart';
import 'package:call_steward/screens/auth/session_manager_screen.dart';

/// All app navigation and routing  with arguments
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case RoutePaths.language:
        return GetPageRoute(
          page: () => const LanguageScreen(),
        );

      case RoutePaths.login:
        return GetPageRoute(
          settings: const RouteSettings(name: RoutePaths.login),
          page: () => const LoginScreen(),
        );

      case RoutePaths.forgotPassword:
        return GetPageRoute(
          page: () => const ForgotPasswordScreen(),
        );

      case RoutePaths.checkYourEmail:
        return GetPageRoute(
          page: () => const CheckYourMainScreen(),
        );

      case RoutePaths.forgotPasswordWithSMS:
        return GetPageRoute(
          page: () => const ForgotPasswordWithSMSScreen(),
        );

      case RoutePaths.otp:
        return GetPageRoute(
          page: () => const OtpScreen(),
        );

      case RoutePaths.updatePassword:
        return GetPageRoute(
          page: () => const UpdatePasswordScreen(),
        );

      case RoutePaths.sessionManager:
        return GetPageRoute(
          page: () => const SessionManagerScreen(),
        );

      case RoutePaths.employeeLoadingScreen:
        return GetPageRoute(
          page: () => EmployeeLoadingScreen(isFromDrawer: args as bool),
        );

      case RoutePaths.continueScreen:
        return GetPageRoute(
          page: () => const ContinueScreen(),
        );

      case RoutePaths.home:
        return GetPageRoute(
          page: () => const HomeScreen(),
        );
      case RoutePaths.calendar:
        return GetPageRoute(
          page: () => const CalendarScreen(),
        );
      case RoutePaths.wishlist:
        return GetPageRoute(
          page: () => const WishlistScreen(),
        );
      case RoutePaths.myProfile:
        return GetPageRoute(
          page: () => const MyProfileScreen(),
        );
      case RoutePaths.changeLocal:
        return GetPageRoute(
          page: () => const ChangeLocalScreen(),
        );

      case RoutePaths.availability:
        return GetPageRoute(
          page: () => const AvailabilityScreen(),
        );

      case RoutePaths.scheduleNotifiAndActionLog:
        return GetPageRoute(
          page: () => const ScheduleNotifyAndActionLogScreen(),
        );

      case RoutePaths.jobCalls:
        args as Map;
        return GetPageRoute(
          page: () => JobCallsScreen(
            callId: args['callId'] as String,
            createdAt: args['createdAt'],
          ),
        );

      case RoutePaths.location:
        return GetPageRoute(
          page: () => LocationScreen(address: args as String),
        );

      case RoutePaths.jobDetails:
        args as Map;
        return GetPageRoute(
          page: () => JobDetailsScreen(
            jobId: args['jobId'],
            jobName: args['jobName'],
          ),
        );

      case RoutePaths.vacation:
        return GetPageRoute(
          page: () => const VacationScreen(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return GetPageRoute(
      page: () => const Scaffold(
        body: Center(
          child: Text("Unknown Error"),
        ),
      ),
    );
  }
}
