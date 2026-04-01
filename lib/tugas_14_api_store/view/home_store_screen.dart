import 'dart:async';
import 'package:flutter/material.dart';
import '../api/get_user.dart';
import '../models/user_model.dart';
import 'detail_screen.dart';

class HomeStoreScreen extends StatefulWidget {
  HomeStoreScreen({super.key});

  @override
  State<HomeStoreScreen> createState() => _HomeStoreScreenState();
}

class _HomeStoreScreenState extends State<HomeStoreScreen> {
  late Future<List<Welcome>> futureProduct;

  // SEARCH
  List<Welcome> allProducts = [];
  List<Welcome> filteredProducts = [];
  TextEditingController searchController = TextEditingController();

  // ETALASE AUTO SCROLL
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    futureProduct = getUser();

    //AUTO SCROLL ETALASE
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final current = _scrollController.offset;

        if (current >= maxScroll) {
          _scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            current + 150,
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  // SEARCH
  void _searchProduct(String query) {
    final results = allProducts.where((product) {
      final title = product.title?.toLowerCase() ?? "";
      final input = query.toLowerCase();
      return title.contains(input);
    }).toList();

    setState(() {
      filteredProducts = results;
    });
  }

  // REFRESH
  Future<void> _refreshData() async {
    setState(() {
      futureProduct = getUser();
    });
    await futureProduct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "TOKOMASAJI",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // SEARCH
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: searchController,
              onChanged: _searchProduct,
              decoration: InputDecoration(
                hintText: "Cari produk...",
                prefixIcon: Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          searchController.clear();
                          _searchProduct("");
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshData,
              child: FutureBuilder<List<Welcome>>(
                future: futureProduct,
                builder: (context, snapshot) {
                  // LOADING
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ListView(
                      children: [
                        SizedBox(
                          height: 400,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    );
                  }

                  // ERROR
                  if (snapshot.hasError) {
                    return ListView(
                      children: [
                        SizedBox(
                          height: 400,
                          child: Center(
                            child: Text("Error: ${snapshot.error}"),
                          ),
                        ),
                      ],
                    );
                  }

                  // KOSONG
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return ListView(
                      children: [
                        SizedBox(
                          height: 400,
                          child: Center(child: Text("Data kosong")),
                        ),
                      ],
                    );
                  }

                  final products = snapshot.data!;
                  allProducts = products;

                  final displayList = searchController.text.isEmpty
                      ? allProducts
                      : filteredProducts;

                  return ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    children: [
                      // ETALASE
                      SizedBox(
                        height: 190,
                        child: ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: allProducts.length,
                          itemBuilder: (context, index) {
                            final item = allProducts[index];

                            return Container(
                              width: 150,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image.network(
                                          item.image ?? "",
                                          height: 80,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        item.title ?? "",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        item.category ?? "",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.orange,
                                          ),
                                          SizedBox(width: 3),
                                          Text("${item.rating?.rate ?? 0}"),
                                        ],
                                      ),
                                      Text(
                                        "Rp ${item.price?.toStringAsFixed(0)}",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // GRID PRODUCT
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: displayList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          final item = displayList[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailScreen(product: item),
                                ),
                              );
                            },
                            child: Card(
                              margin: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: "product_${item.id}",
                                    child: Container(
                                      height: 120,
                                      width: double.infinity,
                                      color: Colors.grey[200],
                                      child: Image.network(
                                        item.image ?? "",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.title ?? "",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 5),

                                        Text(
                                          item.category ?? "",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),

                                        SizedBox(height: 4),

                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 14,
                                              color: Colors.orange,
                                            ),
                                            SizedBox(width: 3),
                                            Text("${item.rating?.rate ?? 0}"),
                                          ],
                                        ),

                                        SizedBox(height: 5),

                                        Text(
                                          "Rp ${item.price?.toStringAsFixed(0)}",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
