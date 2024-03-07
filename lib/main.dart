
//-----------------Working Fine able to Focus corresponding TextFiled & able to clear additional Text filed-------------------------------------------------------------
// import 'dart:async';
// import 'package:fluentui_icons/fluentui_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:ionicons/ionicons.dart';
//
// import 'app_layout.dart';
// import 'app_styles.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: TaxiSearchScreen(),
//   ));
// }
//
// class TaxiSearchScreen extends StatefulWidget {
//   const TaxiSearchScreen({Key? key}) : super(key: key);
//
//   @override
//   State<TaxiSearchScreen> createState() => _TaxiSearchScreenState();
// }
//
// class _TaxiSearchScreenState extends State<TaxiSearchScreen> {
//   final _pickupSearchFieldController = TextEditingController();
//   final _dropOffSearchFieldController = TextEditingController();
//
//   late FocusNode pickupFocusNode;
//   late FocusNode dropOffFocusNode;
//
//   List<String> sriLankaCities = [
//     'Colombo',
//     'Kandy',
//     'Galle',
//     'Nuwara Eliya',
//     'Anuradhapura',
//     'Jaffna',
//     'Matara',
//     'Badulla',
//     'Trincomalee',
//     'Polonnaruwa',
//     'Batticaloa'
//   ];
//
//   List<String> predictions = [];
//   Timer? _debounce;
//
//   List<TextEditingController> additionalControllers = [];
//   List<FocusNode> additionalFocusNodes = [];
//   bool showAdditionalFields = false;
//
//   @override
//   void initState() {
//     super.initState();
//     pickupFocusNode = FocusNode();
//     dropOffFocusNode = FocusNode();
//     additionalFocusNodes = List.generate(4, (_) => FocusNode());
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     pickupFocusNode.dispose();
//     dropOffFocusNode.dispose();
//     _pickupSearchFieldController.dispose();
//     _dropOffSearchFieldController.dispose();
//     for (var controller in additionalControllers) {
//       controller.dispose();
//     }
//     for (var focusNode in additionalFocusNodes) {
//       focusNode.dispose();
//     }
//   }
//
//   void autoCompleteSearch(String value) {
//     setState(() {
//       predictions = sriLankaCities.where((city) => city.toLowerCase().contains(value.toLowerCase())).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = AppLayout.getSize(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'Where did you go today?',
//           style: AppStyles.headLineStyle1B,
//         ),
//       ),
//       body: Container(
//         color: Colors.grey[100],
//         child: Column(
//           children: [
//             Container(
//               color: AppStyles.whiteColor,
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 10,
//                     ),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: AppStyles.greenTealColor,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                       color: AppStyles.ghostWhiteColor,
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               width: size.width * 0.65,
//                               child: Column(
//                                 children: [
//                                   TextField(
//                                     controller: _pickupSearchFieldController,
//                                     autofocus: true,
//                                     focusNode: pickupFocusNode,
//                                     decoration: InputDecoration(
//                                       contentPadding: EdgeInsets.zero,
//                                       labelText: 'Pickup',
//                                       hintText: 'Enter Pickup location',
//                                       hintStyle: const TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 15,
//                                       ),
//                                       filled: false,
//                                       border: InputBorder.none,
//                                       suffixIcon: _pickupSearchFieldController.text.isNotEmpty
//                                           ? IconButton(
//                                         onPressed: () {
//                                           setState(() {
//                                             predictions = [];
//                                             _pickupSearchFieldController.clear();
//                                           });
//                                         },
//                                         icon: const Icon(Icons.clear_outlined),
//                                       )
//                                           : null,
//                                     ),
//                                     onChanged: autoCompleteSearch,
//                                   ),
//                                   if (showAdditionalFields)
//                                     for (int i = 0; i < additionalControllers.length; i++)
//                                       TextField(
//                                         controller: additionalControllers[i],
//                                         focusNode: additionalFocusNodes[i],
//                                         decoration: InputDecoration(
//                                           contentPadding: EdgeInsets.zero,
//                                           labelText: 'Additional Location ${i + 1}',
//                                           hintText: 'Enter Additional location',
//                                           hintStyle: const TextStyle(
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 15,
//                                           ),
//                                           filled: false,
//                                           border: InputBorder.none,
//                                           suffixIcon: IconButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 additionalControllers.removeAt(i);
//                                                 additionalFocusNodes.removeAt(i);
//                                                 if (additionalControllers.isEmpty) {
//                                                   showAdditionalFields = false;
//                                                 }
//                                               });
//                                             },
//                                             icon: const Icon(Icons.clear_outlined, color: Colors.red),
//                                           ),
//                                         ),
//                                         onChanged: autoCompleteSearch,
//                                       ),
//                                   const Gap(5),
//                                   Divider(
//                                     height: 5,
//                                     thickness: 1,
//                                     color: AppStyles.regentGreyColor,
//                                     indent: 5,
//                                     endIndent: 5,
//                                   ),
//                                   const Gap(5),
//                                   TextField(
//                                     controller: _dropOffSearchFieldController,
//                                     autofocus: false,
//                                     focusNode: dropOffFocusNode,
//                                     decoration: InputDecoration(
//                                       contentPadding: EdgeInsets.zero,
//                                       labelText: 'Drop off ',
//                                       hintText: 'Enter Drop off location',
//                                       hintStyle: const TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 15,
//                                       ),
//                                       filled: false,
//                                       border: InputBorder.none,
//                                       suffixIcon: _dropOffSearchFieldController.text.isNotEmpty
//                                           ? IconButton(
//                                         onPressed: () {
//                                           setState(() {
//                                             predictions = [];
//                                             _dropOffSearchFieldController.clear();
//                                           });
//                                         },
//                                         icon: const Icon(Icons.clear_outlined),
//                                       )
//                                           : null,
//                                     ),
//                                     onChanged: autoCompleteSearch,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const Gap(5),
//                             CircleAvatar(
//                               radius: 15,
//                               child: Container(
//                                 child: IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       if (additionalControllers.length < 4) {
//                                         additionalControllers.add(TextEditingController());
//                                         additionalFocusNodes.add(FocusNode());
//                                         showAdditionalFields = true;
//                                       }
//                                     });
//                                   },
//                                   icon: const Icon(
//                                     FluentSystemIcons.ic_fluent_add_regular,
//                                     size: 15,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const Gap(5),
//                             SizedBox(
//                               height: 100,
//                               child: VerticalDivider(
//                                 width: 1,
//                                 thickness: 1,
//                                 color: AppStyles.regentGreyColor,
//                               ),
//                             ),
//                             const Gap(5),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Icon(Ionicons.arrow_down_circle, size: 25),
//                                 Gap(50),
//                                 Icon(Ionicons.location, size: 25, color: AppStyles.greenTealColor),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Gap(0),
//             Expanded(
//               child: Column(
//                 children: [
//                   if (predictions.isNotEmpty)
//                     Expanded(
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: predictions.length,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             title: Text(predictions[index]),
//                             onTap: () async {
//                               if (pickupFocusNode.hasFocus) {
//                                 setState(() {
//                                   _pickupSearchFieldController.text = predictions[index];
//                                   predictions = [];
//                                 });
//                               } else if (dropOffFocusNode.hasFocus) {
//                                 setState(() {
//                                   _dropOffSearchFieldController.text = predictions[index];
//                                   predictions = [];
//                                 });
//                               } else {
//                                 for (int i = 0; i < additionalFocusNodes.length; i++) {
//                                   if (additionalFocusNodes[i].hasFocus) {
//                                     setState(() {
//                                       additionalControllers[i].text = predictions[index];
//                                       predictions = [];
//                                     });
//                                     break;
//                                   }
//                                 }
//                               }
//                             },
//                           );
//                         },
//                       ),
//                     )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



//-------------------------------
import 'dart:async';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

import 'app_layout.dart';
import 'app_styles.dart';

void main() {
  runApp(MaterialApp(
    home: TaxiSearchScreen(),
  ));
}

class TaxiSearchScreen extends StatefulWidget {
  const TaxiSearchScreen({Key? key}) : super(key: key);

  @override
  State<TaxiSearchScreen> createState() => _TaxiSearchScreenState();
}

class _TaxiSearchScreenState extends State<TaxiSearchScreen> {
  final _pickupSearchFieldController = TextEditingController();
  final _dropOffSearchFieldController = TextEditingController();

  late FocusNode pickupFocusNode;
  late FocusNode dropOffFocusNode;

  List<String> sriLankaCities = [
    'Colombo',
    'Kandy',
    'Galle',
    'Nuwara Eliya',
    'Anuradhapura',
    'Jaffna',
    'Matara',
    'Badulla',
    'Trincomalee',
    'Polonnaruwa',
    'Batticaloa',
    'Kilinochchi',
    'Mullaitivu',
    'Mannar',
    'Vavuniya'
  ];

  List<String> predictions = [];
  Timer? _debounce;

  List<TextEditingController> additionalControllers = [];
  List<FocusNode> additionalFocusNodes = [];
  bool showAdditionalFields = false;

  @override
  void initState() {
    super.initState();
    pickupFocusNode = FocusNode();
    dropOffFocusNode = FocusNode();
    additionalFocusNodes = List.generate(4, (_) => FocusNode());
  }

  @override
  void dispose() {
    super.dispose();
    pickupFocusNode.dispose();
    dropOffFocusNode.dispose();
    _pickupSearchFieldController.dispose();
    _dropOffSearchFieldController.dispose();
    for (var controller in additionalControllers) {
      controller.dispose();
    }
    for (var focusNode in additionalFocusNodes) {
      focusNode.dispose();
    }
  }

  void autoCompleteSearch(String value) {
    setState(() {
      predictions = sriLankaCities.where((city) => city.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Where did you go today?',
          style: AppStyles.headLineStyle1B,
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Container(
              color: AppStyles.whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppStyles.greenTealColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: AppStyles.ghostWhiteColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: size.width * 0.65,
                              child: Column(
                                children: [
                                  TextField(
                                    controller: _pickupSearchFieldController,
                                    autofocus: true,
                                    focusNode: pickupFocusNode,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Pickup',
                                      hintText: 'Enter Pickup location',
                                      hintStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                      filled: false,
                                      border: InputBorder.none,
                                      suffixIcon: _pickupSearchFieldController.text.isNotEmpty
                                          ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            predictions = [];
                                            _pickupSearchFieldController.clear();
                                          });
                                        },
                                        icon: const Icon(Icons.clear_outlined),
                                      )
                                          : null,
                                    ),
                                    onChanged: autoCompleteSearch,
                                  ),
                                  if (showAdditionalFields)
                                    for (int i = 0; i < additionalControllers.length; i++)
                                      TextField(
                                        controller: additionalControllers[i],
                                        focusNode: additionalFocusNodes[i],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          labelText: 'Additional Location ${i + 1}',
                                          hintText: 'Enter Additional location',
                                          hintStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                          filled: false,
                                          border: InputBorder.none,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                additionalControllers.removeAt(i);
                                                additionalFocusNodes.removeAt(i);
                                                if (additionalControllers.isEmpty) {
                                                  showAdditionalFields = false;
                                                }
                                              });
                                            },
                                            icon: const Icon(Icons.clear_outlined, color: Colors.red),
                                          ),
                                        ),
                                        onChanged: autoCompleteSearch,
                                      ),
                                  const Gap(5),
                                  Divider(
                                    height: 5,
                                    thickness: 1,
                                    color: AppStyles.regentGreyColor,
                                    indent: 5,
                                    endIndent: 5,
                                  ),
                                  const Gap(5),
                                  TextField(
                                    controller: _dropOffSearchFieldController,
                                    autofocus: false,
                                    focusNode: dropOffFocusNode,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Drop off ',
                                      hintText: 'Enter Drop off location',
                                      hintStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                      filled: false,
                                      border: InputBorder.none,
                                      suffixIcon: _dropOffSearchFieldController.text.isNotEmpty
                                          ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            predictions = [];
                                            _dropOffSearchFieldController.clear();
                                          });
                                        },
                                        icon: const Icon(Icons.clear_outlined),
                                      )
                                          : null,
                                    ),
                                    onChanged: autoCompleteSearch,
                                  ),
                                ],
                              ),
                            ),
                            const Gap(5),
                            CircleAvatar(
                              radius: 15,
                              child: Container(
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (additionalControllers.length < 4) {
                                        additionalControllers.add(TextEditingController());
                                        additionalFocusNodes.add(FocusNode());
                                        showAdditionalFields = true;
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                    FluentSystemIcons.ic_fluent_add_regular,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(5),
                            SizedBox(
                              height: 100,
                              child: VerticalDivider(
                                width: 1,
                                thickness: 1,
                                color: AppStyles.regentGreyColor,
                              ),
                            ),
                            const Gap(5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Ionicons.arrow_down_circle, size: 25),
                                Gap(50),
                                Icon(Ionicons.location, size: 25, color: AppStyles.greenTealColor),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (predictions.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: predictions.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(predictions[index]),
                            onTap: () async {
                              if (pickupFocusNode.hasFocus) {
                                setState(() {
                                  _pickupSearchFieldController.text = predictions[index];
                                  predictions = [];
                                });
                              } else if (dropOffFocusNode.hasFocus) {
                                setState(() {
                                  _dropOffSearchFieldController.text = predictions[index];
                                  predictions = [];
                                });
                              } else {
                                for (int i = 0; i < additionalFocusNodes.length; i++) {
                                  if (additionalFocusNodes[i].hasFocus) {
                                    setState(() {
                                      additionalControllers[i].text = predictions[index];
                                      predictions = [];
                                    });
                                    break;
                                  }
                                }
                              }
                            },
                          );
                        },
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

