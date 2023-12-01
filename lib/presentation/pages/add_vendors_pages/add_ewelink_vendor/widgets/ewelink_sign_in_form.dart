import 'package:cbj_integrations_controller/domain/vendors/ewelink_login/generic_ewelink_login_entity.dart';
import 'package:cbj_integrations_controller/domain/vendors/ewelink_login/generic_ewelink_login_value_objects.dart';
import 'package:cbj_integrations_controller/domain/vendors/i_vendor_repository.dart';
import 'package:cbj_integrations_controller/domain/vendors/login_abstract/value_login_objects_core.dart';
import 'package:cbj_integrations_controller/domain/vendors/vendor_data.dart';
import 'package:cybear_jinni/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EwelinkSignInForm extends StatefulWidget {
  const EwelinkSignInForm(this.vendor);

  final VendorData vendor;

  @override
  State<EwelinkSignInForm> createState() => _EwelinkSignInFormState();
}

class _EwelinkSignInFormState extends State<EwelinkSignInForm> {
  String? email;
  String? password;

  Future<void> _signInWithEwelink() async {
    if (email == null || password == null) {
      Fluttertoast.showToast(
        msg: 'Please enter Email and Password',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.deepPurple,
        textColor: Theme.of(context).textTheme.bodyLarge!.color,
        fontSize: 16.0,
      );
      return;
    }

    Fluttertoast.showToast(
      msg: 'Sign in to eWeLink, devices will appear in the '
          'app after getting discovered',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.deepPurple,
      textColor: Theme.of(context).textTheme.bodyLarge!.color,
      fontSize: 16.0,
    );
    Navigator.pop(context);

    final GenericEwelinkLoginDE genericEwelinkDE = GenericEwelinkLoginDE(
      senderUniqueId: CoreLoginSenderId.fromUniqueString('Me'),
      ewelinkAccountEmail: GenericEwelinkAccountEmail(email),
      ewelinkAccountPass: GenericEwelinkAccountPass(password),
    );
    IVendorsRepository.instance.loginWithEwelink(genericEwelinkDE);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Hero(
            tag: 'Logo',
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: screenSize.height * 0.1,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.vendor.image ?? ''),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              // ImageAtom('assets/cbj_logo.png'),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: FaIcon(
                FontAwesomeIcons.at,
              ),
              labelText: 'eWeLink device email',
            ),
            autocorrect: false,
            onChanged: (value) {
              email = value;
            },
            validator: (_) {
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: FaIcon(
                FontAwesomeIcons.key,
              ),
              labelText: 'eWeLink device password',
            ),
            autocorrect: false,
            onChanged: (value) {
              password = value;
            },
            validator: (_) {
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    _signInWithEwelink();
                  },
                  child: const TextAtom('SIGN IN'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
