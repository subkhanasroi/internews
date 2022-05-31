
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internews/common/constant/image.dart';
import 'package:internews/controller/load_data_controller.dart';
import 'package:internews/page/web_view_news_page.dart';

class HomePage extends StatefulWidget {
  final LoadDataController loadDataController = Get.put(LoadDataController());

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late int _selectIndex;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _selectIndex = 0;
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  void _openWeb(String url) {
    Get.to(WebViewNewsPage(
      url: url,
    ));
  }

 

  Widget _buildBody() {
    return GetBuilder<LoadDataController>(
      init: LoadDataController(),
      builder: (data) => Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 32, top: 42, right: 16, bottom: 16),
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(32)),
                image: DecorationImage(
                    image: AssetImage(kImgTech),
                    fit: BoxFit.fitHeight,
                    opacity: 50,
                    colorFilter:
                        ColorFilter.mode(Colors.black, BlendMode.colorDodge))),
            height: MediaQuery.of(context).size.height * .4,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.menu,
                  size: 32,
                  color: Colors.white,
                ),
                const SizedBox(height: 32),
                Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: const Center(
                      child: Text(
                        "News Today",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    )),
                const SizedBox(height: 32),
                const Text(
                  " Wachstum in Krisenzeiten: Dell und Lenovo - voll im Saf ",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                  maxLines: 4,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            isScrollable: true,
            labelColor: Colors.black,
            onTap: (index) {
              setState(() {
                _selectIndex = index;
              });
            },
            controller: _tabController,
            indicatorColor: Colors.blueAccent,
            tabs: const [
              Tab(
                text: "International News",
              ),
              Tab(
                text: "Local News",
              ),
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: [
              _internationalNews(data),
              _localNews(data),
            ].toList()[_selectIndex],
          ),
        ],
      ),
    );
  }

  Widget _internationalNews(LoadDataController data) {
    return ListView.builder(
        itemCount: data.listInternational.articles?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () =>
                _openWeb("${data.listInternational.articles![index].url}"),
            leading: SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                data.listInternational.articles![index].urlToImage ??
                    "http://via.placeholder.com/350x150",
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              data.listInternational.articles![index].title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              data.listInternational.articles![index].description ??
                  "No Description at this Article!",
              maxLines: 2,
              style: const TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          );
        });
  }

  Widget _localNews(LoadDataController data) {
    return ListView.builder(
        itemCount: data.listLocal.articles?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => _openWeb("${data.listLocal.articles![index].url}"),
            leading: SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                data.listLocal.articles![index].urlToImage ??
                    "http://via.placeholder.com/350x150",
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              data.listLocal.articles![index].title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              data.listLocal.articles![index].description ??
                  "No Description at this Article!",
              maxLines: 2,
              style: const TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          );
        });
  }
}
