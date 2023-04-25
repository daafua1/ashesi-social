



import '../utils/exports.dart';


class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
                padding: const EdgeInsets.only(top: 80, bottom: 20),
                decoration:
                    const BoxDecoration(color: Constants.appBarColor),
                child: Column(
                  children: [
                    Obx(
                      () => ImageContainer(
                        imageURL: user.value.profileImage != null &&
                                user.value.profileImage!.isNotEmpty
                            ? user.value.profileImage!
                            : "https://firebasestorage.googleapis.com/v0/b/daafua-ashesi-social.appspot.com/o/9-250x250.jpg?alt=media&token=5a0798b0-f565-4e63-99cc-eb52e0f3167c",
                        height: 80,
                        width: 80,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Obx(
                      () => Text(
                        user.value.name!,
                        style: TextStyles.button,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user.value.id!,
                      style: TextStyles.smallSubTitle,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 30,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      child: Center(
                        child: Obx(
                          () => Text(
                            user.value.onCampus == true
                                ? "On-Campus"
                                : "Off-Campus",
                            style: TextStyles.bodyBlack,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            ListTile(
              onTap: () {
                Get.back();
                Get.to(() => const EditProfile());
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              title: const Text(
                "Edit Profile",
                style: TextStyles.buttonBlack,
                textAlign: TextAlign.start,
              ),
              selectedTileColor: const Color(0x42000000),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Color(0xff000000), size: 24),
            ),
            const Divider(
              color: Color(0x4d9e9e9e),
              height: 16,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            ListTile(
              onTap: () {
                Get.back();
                Get.to(() => const VeiwProfile(
                      withID: false,
                    ));
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              title: const Text(
                "View Profile",
                style: TextStyles.buttonBlack,
                textAlign: TextAlign.start,
              ),
              selectedTileColor: const Color(0x42000000),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Color(0xff000000), size: 24),
            ),
            // const Divider(
            //   color: Color(0x4d9e9e9e),
            //   height: 16,
            //   thickness: 1,
            //   indent: 0,
            //   endIndent: 0,
            // ),
            // ListTile(
            //   onTap: () {
            //     Get.back();
            //     Get.to(() =>  AboutUs());
            //   },
            //   contentPadding:
            //       const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            //   title: const Text(
            //     "About Us",
            //     style: TextStyles.buttonBlack,
            //     textAlign: TextAlign.start,
            //   ),
            //   selectedTileColor: const Color(0x42000000),
            //   trailing: const Icon(Icons.arrow_forward_ios,
            //       color: Color(0xff000000), size: 24),
            // ),
            // const Divider(
            //   color: Color(0x4d9e9e9e),
            //   height: 16,
            //   thickness: 1,
            //   indent: 0,
            //   endIndent: 0,
            // ),
            // ListTile(
            //   onTap: () {
            //     Get.back();
            //     Get.to(() => const TermsAndConditions());
            //   },
            //   contentPadding:
            //       const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            //   title: const Text(
            //     "Terms and Conditions",
            //     style: TextStyles.buttonBlack,
            //     textAlign: TextAlign.start,
            //   ),
            //   selectedTileColor: const Color(0x42000000),
            //   trailing: const Icon(Icons.arrow_forward_ios,
            //       color: Color(0xff000000), size: 24),
            // ),
            const Divider(
              color: Color(0x4d9e9e9e),
              height: 16,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
              child: MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Get.offAll(() => const LoginScreen());
                },
                color: Constants.appBarColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                textColor: Colors.white,
                height: 40,
                minWidth: MediaQuery.of(context).size.width,
                child: const Text(
                  "Log out",
                  style: TextStyles.button,
                ),
              ),
            ),
          ],
        ),
      );
  }
}