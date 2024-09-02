import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReceiversListScreen extends StatefulWidget {
  @override
  _ReceiversListScreenState createState() => _ReceiversListScreenState();
}

class _ReceiversListScreenState extends State<ReceiversListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Receivers List',
          style: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 4.0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: 'Your Blood Group'),
            Tab(text: 'Other Blood Groups'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildReceiversList(),
          _buildReceiversList(), // Use the same list for both tabs for now
        ],
      ),
    );
  }

  Widget _buildReceiversList() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        _buildReceiverCard(
          name: 'Aneesha',
          bloodGroup: 'A+',
          units: '1 Unit',
          location: 'Govt Medical College Hospital Kottayam, Gandhi Nagar, Kottayam, Kerala, India',
          date: 'Monday, Sept 2',
        ),
        SizedBox(height: 16),
        _buildReceiverCard(
          name: 'Aneesha',
          bloodGroup: 'A+',
          units: '1 Unit',
          location: 'Kottayam Medical College Bypass Road, Panampalam, Arpookara East, Gandhi Nagar, Arpookara, Kerala, India',
          date: 'Monday, Sept 2',
        ),
        SizedBox(height: 16),
        _buildReceiverCard(
          name: 'Philip',
          bloodGroup: 'A+',
          units: '4 Units',
          location: 'Mar Sleeva Medicity Palai, Cherpunkal – Kozhuvanal Road, Cherpunkal, Kerala, India',
          date: 'Monday, Sept 2',
        ),
      ],
    );
  }

  Widget _buildReceiverCard({required String name, required String bloodGroup, required String units, required String location, required String date}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.red,
                  child: Text(
                    bloodGroup,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$units (Blood)',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.share, color: Colors.red),
                  onPressed: () {
                    // Implement share functionality
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              location,
              style: GoogleFonts.lato(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8),
            Text(
              date,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
