import '../utils/exports.dart';

// A page to show the feed of posts
class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<QueryDocumentSnapshot> posts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      // The app bar
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        backgroundColor: Constants.appBarColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: const Text(
          "Feed",
          style: TextStyles.title,
        ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        actions: [
          // The add a new post button
          IconButton(
              icon: const Icon(
                Icons.add_box,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Get.to(() => const NewPost());
              }),
        ],
      ),
      // A stream builder to show the posts in real time
      body: StreamBuilder(
          stream: Services().getPosts(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              posts = snapshot.data!.docs;
            }
            if (posts.isNotEmpty) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: Constants.size.width > 850 ? 20.w : 10.w),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  final post = Post.fromJson(snapshot.data!.docs[index].data());
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: FeedContainer(post: post),
                  );
                },
              );
            } else {
              return const Center(child: Text("No posts yet"));
            }
          }),
      // The drawer at the homepage
      drawer: const HomeDrawer(),
    );
  }
}
