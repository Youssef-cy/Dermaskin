import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hi,Salma"), actions: [
        IconButton(icon: Icon(Icons.search), onPressed: () {},),
        IconButton(icon: Icon(Icons.notifications), onPressed: () {},)
      ],),
      body: SingleChildScrollView(
        child: Column(children: [
          _CoinsCard(),
          SizedBox(height: 12),
          _PlanCard(),
          SizedBox(height: 16,),
          Text("Favorite services",
            style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          _ServiceRow(),
          SizedBox(height: 12,),
          Text("What's new", style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          _PromoCard(),
        ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: "services"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: "money"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: "benifits"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "more"),
        ],
      ),
    );
  }
  Widget _CoinsCard(){
    return Card(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Coins"),Text("160", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
        ],
        ),
          Icon(Icons.monetization_on, color: Colors.amber)

      ],)
    );
  }
    Widget _PlanCard() {
    return Card(
    child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text('Hekaya Mixat 80',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    OutlinedButton(
    onPressed: () {},
    child: Text('Manage',
    style: TextStyle(color: Colors.red)),
    style: OutlinedButton.styleFrom(
    side: BorderSide(color: Colors.red)),
    ),
    ],
    ),
    SizedBox(height: 8),
    Text('0 Mix  left of 3750 Mix',
    style: TextStyle(color: Colors.red, fontSize: 18,
    fontWeight: FontWeight.bold)),
    SizedBox(height: 6),
    LinearProgressIndicator(value: 0, color: Colors.red,
    backgroundColor: Colors.grey[200]),
    SizedBox(height: 8),
    Container(
    color: Colors.black87,
    padding: EdgeInsets.all(12),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('0.0 EGP',
            style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold, fontSize: 18)),
        Text('Renew on: 04 May 2026',
            style: TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    ),
      Text('Recharge Now ›',
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold)),
    ],
    ),
    ),
    ],
    ),
    ),
    );
    }
  Widget _ServiceRow() {
    final services = [
      {'icon': Icons.account_balance_wallet, 'label': 'Balance Details'},
      {'icon': Icons.signal_cellular_alt,    'label': 'All Bundles'},
      {'icon': Icons.chat_bubble_outline,    'label': 'Chat With Us'},
    ];

    return SizedBox(
      height: 90, // ← fixed height so ListView.builder works inside Column
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // ← THIS makes it scroll sideways
        itemCount: services.length,
        itemBuilder: (context, i) {
          return Container(
            width: 90,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(services[i]['icon'] as IconData, size: 28),
                SizedBox(height: 4),
                Text(services[i]['label'] as String,
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center),
              ],
            ),
          );
        },
      ),
    );}
  Widget _PromoCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text('RECHARGE & WIN\nUp to 50X MBs or Mix!',
          style: TextStyle(color: Colors.white, fontSize: 18,
              fontWeight: FontWeight.bold)),
    );
  }
  }


