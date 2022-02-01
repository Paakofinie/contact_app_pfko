import 'package:contact_app_pfko/contact_details_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'contact_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "David Day",
      "phone": "1-214-243-5325",
      "email": "lorem@google.com",
      "country": "Belgium",
      "region": "Bali"
    },
    {
      "name": "Ama Fowaah Wade",
      "phone": "670-7137",
      "email": "integer@protonmail.net",
      "country": "Russian Federation",
      "region": "Sachsen"
    },
    {
      "name": "Bernard Chambers",
      "phone": "166-8938",
      "email": "cras@aol.edu",
      "country": "Canada",
      "region": "Dalarnas län"
    },
    {
      "name": "Abena Mina",
      "phone": "1-562-151-3178",
      "email": "consequat@google.couk",
      "country": "United States",
      "region": "Cajamarca"
    },
    {
      "name": "Casting Mercado",
      "phone": "1-520-617-1688",
      "email": "consequat.lectus@google.edu",
      "country": "Costa Rica",
      "region": "Manitoba"
    },
    {
      "name": "Cobby Clements",
      "phone": "1-340-868-8205",
      "email": "mauris.morbi@outlook.couk",
      "country": "Turkey",
      "region": "North Island"
    },
    {
      "name": "Baba Sims",
      "phone": "1-912-217-3411",
      "email": "tincidunt@protonmail.com",
      "country": "Netherlands",
      "region": "Osun"
    },
    {
      "name": "Eric Finch",
      "phone": "1-782-756-2478",
      "email": "scelerisque.mollis.phasellus@outlook.org",
      "country": "Norway",
      "region": "Leinster"
    },
    {
      "name": "Dennis Hebert",
      "phone": "1-456-535-7381",
      "email": "tempus@outlook.org",
      "country": "Sweden",
      "region": "Friesland"
    },
    {
      "name": "Coby Justice",
      "phone": "1-716-428-6985",
      "email": "libero.proin@google.org",
      "country": "Brazil",
      "region": "Xīnán"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/paakofinie.com_png.png'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                country: 'Ghana',
                                email: 'fkoa@ghanatechlab.com',
                                name: 'Felix Otu',
                                phone: '+233 45 78 59 741',
                                region: 'Greater Accra'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/paakofi.png'),
                    ),
                    title: const Text(
                      'Felix Otu',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233555595929'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/paakofi.png'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
