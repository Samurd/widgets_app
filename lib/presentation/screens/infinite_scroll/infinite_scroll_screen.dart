import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  bool isLoading = false;

  onChangeLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: InfiniteScrollView(isLoading: isLoading,  onChangeLoading: onChangeLoading),
      floatingActionButton: FloatingActionButton(
          child: isLoading
              ? SpinPerfect(
                  duration: const Duration(seconds: 3),
                  infinite: true,
                  child: Icon(Icons.replay))
              : const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (isLoading) return;
            context.pop();
          }),
    );
  }
}






class InfiniteScrollView extends StatefulWidget {
  final bool isLoading;
  final ValueChanged<bool> onChangeLoading;
  const InfiniteScrollView({super.key, required this.onChangeLoading, required this.isLoading});

  @override
  State<InfiniteScrollView> createState() => _InfiniteScrollViewState();
}

class _InfiniteScrollViewState extends State<InfiniteScrollView> {
  List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 300 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> loadNextPage() async {
    if(widget.isLoading) return;

    widget.onChangeLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    widget.onChangeLoading(false);
    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh () async {
    widget.onChangeLoading(true);
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));

    widget.onChangeLoading(false);
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {
      
    });

  }

  void moveScrollToBottom() {
    if(scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
        scrollController.position.pixels + 150,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn
        );
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: RefreshIndicator(
        edgeOffset: 10,
        strokeWidth: 2,
        onRefresh: onRefresh,
        child: ListView.builder(
          controller: scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              fit: BoxFit.contain,
              width: double.infinity,
              height: 300,
              placeholder: const AssetImage("assets/images/jar-loading.gif"),
              image: NetworkImage(
                  "https://picsum.photos/500/300/?image=${imagesIds[index]}"),
            );
          },
        ),
      ),
    );
  }
}
