import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cybear_jinni/presentation/atoms/atoms.dart';
import 'package:cybear_jinni/presentation/core/routes/app_router.gr.dart';
import 'package:cybear_jinni/presentation/pages/shared_widgets/top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

/// Page for the user to decide what kind of Scene he wants to add
@RoutePage()
class ChooseAutomationTypeToAddPage extends StatelessWidget {
  void backButtonFunction(BuildContext context) {
    context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: ColoredBox(
        color: HexColor('#FBF5F9'),
        child: Column(
          children: [
            TopNavigationBar(
              pageName: 'Add Automations',
              rightIcon: null,
              // FontAwesomeIcons.magnifyingGlass,
              rightIconFunction: backButtonFunction,
              leftIcon: FontAwesomeIcons.arrowLeft,
              leftIconFunction: backButtonFunction,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const TextAtom(
                    'Do several things at once or start actions'
                    ' automatically by adding a trigger.',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const TextAtom(
                    'Please choose your automation trigger',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent.withOpacity(0.5),
                            // Red border with the width is equal to 5
                            border: Border.all(),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: TextButton(
                            onPressed: () {
                              context.router.push(const AddSceneRoute());
                            },
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    TextAtom(
                                      'Scenes - ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                      ),
                                    ),
                                    AutoSizeText(
                                      'Triggered by user click',
                                      maxFontSize: 18,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                TextAtom(
                                  'Combining a number of actions in a big button.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                TextAtom(
                                  'Example:\n"Arriving Home" button that will turn on some lights and turn up all the blinds when you click on it.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow.withOpacity(0.5),
                            // Red border with the width is equal to 5
                            border: Border.all(),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: TextButton(
                            onPressed: () {
                              // showDialog(
                              //   context: context,
                              //   builder: (_) => const AlertDialog(
                              //     title: TextAtom(
                              //       'Not supported yet',
                              //     ),
                              //   ),
                              // );
                              context.router.push(const PickRepeatTimeRoute());
                            },
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    TextAtom(
                                      'Routines - ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                      ),
                                    ),
                                    AutoSizeText(
                                      'Triggered by time',
                                      maxFontSize: 18,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                TextAtom(
                                  'Like alarm clock but for triggering actions.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                TextAtom(
                                  'Example:\nTurn on the thermostat for an hour and open all blinds each day at 7:00am.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.5),
                            // Red border with the width is equal to 5
                            border: Border.all(),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => const AlertDialog(
                                  title: TextAtom(
                                    'Not supported yet',
                                  ),
                                ),
                              );
                              // context.router
                              //     .push(const AddRoutineDeleteRoute());
                              // context.router
                              //     .push(const AddBindingRoute());
                            },
                            child: const Column(
                              children: [
                                Row(
                                  children: [
                                    TextAtom(
                                      'Bindings - ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                      ),
                                    ),
                                    AutoSizeText(
                                      'Triggered by external action',
                                      maxFontSize: 18,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                TextAtom(
                                  'Trigger actions whenever an external action occurs.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                TextAtom(
                                  'Example:\nIf the home door got opened from 3:00am - 6:00am trigger anti-thief alarm system.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
