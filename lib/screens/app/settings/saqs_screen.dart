// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screens/model_ui/Faq.dart';

class faqsscreen extends StatefulWidget {
  const faqsscreen({Key? key}) : super(key: key);

  @override
  State<faqsscreen> createState() => _faqsscreenState();
}

class _faqsscreenState extends State<faqsscreen> {
  final List<Faq> _faqs = <Faq>[
    Faq(question: '1. How it will take to delivery?', answer: 'In enum justo, rhonchus ut, imperiled a, venerates vitae, justo. Nulls dictum fells eu peed mollies premium. Integer incident. Crass paribus. Vivas elementum sempre nisei.'),
    Faq(question: '2. What is refund system?', answer: 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi.'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQS Screen'),
      ),
      body: ListView(
        children: [
          ExpansionPanelList(
            elevation: 4,
            dividerColor: const Color(0xFF607EAA),
            animationDuration: const Duration(seconds: 1),
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) {
              setState(() => _faqs[panelIndex].isExpanded = !isExpanded);
            },
            children: _faqs.map((e) {
              return ExpansionPanel(
                isExpanded: e.isExpanded,
                canTapOnHeader: true,
                backgroundColor: const Color(0xFFF5E8E4),
                headerBuilder: (context, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(Icons.question_answer, size: 18),
                        const SizedBox(width: 15),
                        Text(e.question),
                      ],
                    ),
                  );
                },
                body: Container(
                  color: const Color(0xFFEAE3D2),
                  height: 100,
                  alignment: AlignmentDirectional.centerStart,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            e.answer,
                            style: GoogleFonts.montserrat(),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
