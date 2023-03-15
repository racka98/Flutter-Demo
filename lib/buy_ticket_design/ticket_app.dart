import 'package:flutter/material.dart';
import 'package:flutter_demo/buy_ticket_design/home_page.dart';

class TicketApp extends StatelessWidget {
  const TicketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "SF Pro Display"),
      title: "Buy Tickets",
      home: const TicketHomePage(),
    );
  }
}
