import '../utils/exports.dart';

// A page to display terms and conditions of the app.
class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      // The appbar
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        backgroundColor: Constants.appBarColor,
        title: const Text("Terms and Conditions", style: TextStyles.title),
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
          padding:  EdgeInsets.symmetric(horizontal: Constants.size.width > 850 ? 20.w : 10.w),
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
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: Image(
                  image: const NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/daafua-ashesi-social.appspot.com/o/Ashesi_Campus_20-min.jpg?alt=media&token=e7b80ec1-7e4b-4cb5-8eee-8bf71f899ba9"),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              // The terms and conditions
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Text(
                  "The materials that are shared on $appName should adhere to the guidelines and policies of Ashesi Univeristy. The materials should not violate any laws, regulations, or ethical standards. Users should avoid sharing any content that is defamatory, harassing, or discriminatory.\n\n Additionally, the materials shared on $appName should be appropriate for the academic environment and should not contain any explicit or offensive content. Users should also respect the intellectual property rights of others and avoid sharing copyrighted material without permission.",
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
