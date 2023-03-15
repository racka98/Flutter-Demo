import 'package:flutter/material.dart';
import 'package:flutter_demo/buy_ticket_design/exhibition_bottom_sheet.dart';
import 'package:flutter_demo/buy_ticket_design/sliding_cards.dart';
import 'package:flutter_demo/buy_ticket_design/tabs.dart';

class TicketHomePage extends StatelessWidget {
  const TicketHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 8),
                Header(),
                SizedBox(height: 40),
                Tabs(),
                SizedBox(height: 8),
                SlidingCardsView()
              ],
            ),
          ),
          const ExhibitionBottomSheet(),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        "Shenzhen",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
    );
  }
}
