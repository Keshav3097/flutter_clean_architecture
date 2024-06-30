
import 'package:qms_admin/app/core/responsive/responsive.dart';

widgetSize({required var desktop, required var tablet, required var mobile})
{
  if(Responsive.isDesktop())
  {
    return desktop;
  }else if(Responsive.isTablet())
  {
    return tablet;
  } else {
    return mobile;
  }
}
