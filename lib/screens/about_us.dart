import '../utils/exports.dart';

// A class to display the about us page

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      // The app bar
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        backgroundColor: Constants.appBarColor,
        title: const Text("About Us", style: TextStyles.title),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Constants.size.width > 850 ? 20.w : 10.w),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(appName, style: TextStyles.titleBlack),
              const SizedBox(height: 5),
              const Text(
                "Ashesi's best social network app",
                style: TextStyles.bodyBlack,
              ),
              const SizedBox(height: 16),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: Image(
                  image: const NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/daafua-ashesi-social.appspot.com/o/Ashesi_Campus_20-min.jpg?alt=media&token=e7b80ec1-7e4b-4cb5-8eee-8bf71f899ba9"),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                // The about us text
                child: Text(
                  "$appName is a campus social network app designed exclusively for students of Ashesi University. The app offers a seamless platform for users to share information, and stay up-to-date with the latest campus news. The app features a news feed where users can stay updated with the latest campus events, news, and announcements. The app is designed to be user-friendly, with an intuitive interface that is easy to navigate. It is available for both iOS and Android platforms.",
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    wordSpacing: 1.2,
                    letterSpacing: 1.2,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
