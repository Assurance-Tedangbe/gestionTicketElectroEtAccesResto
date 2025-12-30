import 'package:mymobileproject/provider/account_provider.dart';
import 'package:mymobileproject/provider/consulter_menu_provider.dart';
import 'package:mymobileproject/provider/credit_provider.dart';
import 'package:mymobileproject/provider/debit_provider.dart';
import 'package:mymobileproject/provider/menu_provider.dart';
import 'package:mymobileproject/provider/role_privider.dart';
import 'package:mymobileproject/provider/ticket_provider.dart';
import 'package:mymobileproject/provider/user_provider.dart';
import 'package:mymobileproject/services/account_service.dart';
import 'package:mymobileproject/services/consulter_menu_service.dart';
import 'package:mymobileproject/services/credit_service.dart';
import 'package:mymobileproject/services/debit_service.dart';
import 'package:mymobileproject/services/menu_service.dart';
import 'package:mymobileproject/services/role_service.dart';
import 'package:mymobileproject/services/ticket_service.dart';
import 'package:mymobileproject/services/user_service.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> getProviders() {
  return [
    /* ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(AuthService()),
    ), */
    ChangeNotifierProvider<RoleProvider>(
      create: (context) => RoleProvider(RoleApiService()),
    ),
    ChangeNotifierProvider<UserProvider>(
      create: (context) => UserProvider(UserApiService()),
    ),
    ChangeNotifierProvider<TicketProvider>(
      create: (context) => TicketProvider(TicketApiService()),
    ),
    /* ChangeNotifierProvider<AccountProvider>(
      create: (context) => AccountProvider(AccountApiService()),
    ), */
    ChangeNotifierProvider<MenuProvider>(
      create: (context) => MenuProvider(MenuApiService()),
    ),
    ChangeNotifierProvider<ConsulterMenuProvider>(
      create: (context) => ConsulterMenuProvider(ConsulterMenuApiService()),
    ),
    ChangeNotifierProvider<DebitProvider>(
      create: (context) => DebitProvider(DebitApiService()),
    ),
    ChangeNotifierProvider<CreditProvider>(
      create: (context) => CreditProvider(CreditApiService()),
    ),
  ];
}
