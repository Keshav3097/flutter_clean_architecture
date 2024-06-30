import '../../config/flavors/src/config.dart';

class ApiConstants {
  static final _sharedInstance = ApiConstants._internal();

  ApiConstants._internal();

  static ApiConstants getInstance() {
    return _sharedInstance;
  }

  static String devHttpBaseUrl =
      Flavor.I.getString('devHttpBaseUrl') ?? 'http://kubedev.swayam.jio.com';
  static String devHttpBaseIPUrl =
      Flavor.I.getString('devHttpBaseIPUrl') ?? 'https://10.169.141.4';
  static String devHttpsBaseUrl =
      Flavor.I.getString('devHttpsBaseUrl') ?? 'https://kubedev.swayam.jio.com';

  /// For Login and authentication
  static String devHttpsLoginUrl = Flavor.I
          .getString('login_host_address_port') ??
      'https://dev.swayam.jio.com:3002/tess/api/login?redirect=https://dev.swayam.jio.com/dev/dashboard';

  /// APIs ports
  static const int port_3000 = 3000;
  static const int port_3001 = 3001;
  static const int port_3002 = 3002;
  static const int port_3003 = 3003;
  static const int port_3004 = 3004;
  static const int port_3005 = 3005;

  //==============Versions===================

  String masterVersion = "/qmshub/api/v1/";

  //================API Endpoints================

  static final baseUrl = devHttpsBaseUrl;
  static String module = 'qmshub';
  static const String version = 'api/v1';


  static const String dashboard = 'processor/dashboard';
  static const String ticketDetails = 'processor/ticket';
  static const String downloadAttachment = 'file/download';
  static const String queryResolve = 'processor/resolve';
  static const String authCheck = 'admin/authenticate';
  static const String logout = 'token/delete';



  ///For logout
  static const String authModule = 'auth';
  static const String authVersion = "tess/api";
  static const String authLogout = "application-logout";


  //================API URL================

  static final dashboardUrl = '$devHttpsBaseUrl/$module/$version/$dashboard';
  static final taskDetailsUrl = '$devHttpsBaseUrl/$module/$version/$ticketDetails';
  static final downloadAttachmentUrl = '$devHttpsBaseUrl/$module/$version/$downloadAttachment';
  static final queryResolveUrl = '$devHttpsBaseUrl/$module/$version/$queryResolve';
  static final authCheckUrl = '$devHttpsBaseUrl/$module/$version/$authCheck';
  static final logoutUrl = '$devHttpsBaseUrl/$module/$version/$logout';


  static final authLogoutUrl =
      "$devHttpsLoginUrl/$authModule/$authVersion/$authLogout";




}