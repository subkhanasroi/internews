import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internews/common/constant/image.dart';
import 'package:internews/controller/load_data_controller.dart';
import 'package:internews/model/list_news_model.dart';
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
  late bool _search;
  late TextEditingController _controller;
  List<Article>? _news;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _selectIndex = 0;
    _search = false;
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadDataController>(
        init: LoadDataController(),
        builder: (data) => Scaffold(
              body: _search ? _searchView(data) : _buildBody(data),
            ));
  }

  void _openWeb(String url) {
    Get.to(WebViewNewsPage(
      url: url,
    ));
  }

  Widget _buildBody(LoadDataController data) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 32, top: 42, right: 16, bottom: 16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
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
              Row(
                children: [
                  const Icon(
                    Icons.menu,
                    size: 32,
                    color: Colors.white,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _search = !_search;
                      });
                    },
                    child: const Icon(
                      Icons.search,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
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
            Tab(
              text: "Business News",
            ),
          ],
        ),
        const SizedBox(height: 15),
        Expanded(
          child: [
            _internationalNews(data),
            _localNews(data),
            _businessNews(data),
          ].toList()[_selectIndex],
        ),
      ],
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

  Widget _businessNews(LoadDataController data) {
    return ListView.builder(
        itemCount: data.listBusiness.articles?.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => _openWeb("${data.listBusiness.articles![index].url}"),
            leading: SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                data.listBusiness.articles![index].urlToImage ??
                    "http://via.placeholder.com/350x150",
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              data.listBusiness.articles![index].title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              data.listBusiness.articles![index].description ??
                  "No Description at this Article!",
              maxLines: 2,
              style: const TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          );
        });
  }

  Widget _searchView(LoadDataController data) {
    void _filterSearchResults(String query) {
      if (query.isEmpty) {
        setState(() {
          _news = data.listLocal.articles;
        });
      } else {
        setState(() {
          _news = data.listLocal.articles
              ?.where((d) => d.title!.contains(query))
              .toList();
        });
      }
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  setState(() {
                    _search = !_search;
                    _controller.clear();
                  });
                },
              ),
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    _filterSearchResults(value);
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusColor: Colors.black,
                    hintText: "Search what ?",
                    suffixIcon: _controller.text.isEmpty
                        ? null
                        : InkWell(
                            child: const Icon(Icons.auto_delete),
                            onTap: () {
                              _controller.clear();
                              setState(() {
                                _news = data.listLocal.articles;
                              });
                            },
                          ),
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          _controller.text.isEmpty
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          Expanded(
                              child: Text(
                            "Search Local Indonesia News..",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ))
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Recent search",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => ListTile(
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
                                "${data.listLocal.articles?[index].title}"),
                          ),
                          itemCount: data.listLocal.articles!.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(color: Colors.black12),
                        ),
                      )
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: _news!.length,
                    itemBuilder: (context, index) {
                      String name = _news![index].title!;
                      String cName = name.replaceAll(
                          _controller.text, "#${_controller.text}#");
                      List<String> sss = cName.split("#");
                      List<TextSpan> children = [];
                      for (var d in sss) {
                        children.add(
                          TextSpan(
                            text: d,
                            style: TextStyle(
                              fontWeight: d == _controller.text
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: d.isEmpty ? Colors.black : Colors.grey,
                            ),
                          ),
                        );
                      }
                      return ListTile(
                        title: RichText(
                          text: TextSpan(
                            children: children,
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                  ),
                )
        ],
      ),
    );
  }
}
