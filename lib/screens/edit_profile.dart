import '../utils/exports.dart';

// This is a page for editing the user's profile

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // To store the major of the user
  String major = '';
  // To store the class year of the user
  String classYear = '';

// To store the user's date of birth
  TextEditingController dob = TextEditingController();

// To store the user's best food
  TextEditingController bestFood = TextEditingController();

// To store the user's best movie
  TextEditingController bestMovie = TextEditingController();

  final majorsList = ["BS", "CS", "MIS", "CE", "EEE", "ME", "Selecr Major"];
  int majorInt = 7;
  final classList = ["2023", "2024", "2025", "2026", "Other", "Selecr Class"];
  int classInt = 6;

// whether there is a validation error or not
  bool validationError = false;

// Whether the user is off campus or not
  bool offCampus = false;
  bool onCampus = false;

// Whether there is the loader is busy
  bool isLoading = false;

  // To store the image path
  String image = '';

  @override
  void initState() {
    // Populate the user data into the various textfields for editing.
    dob.text = user.value.dob!;
    bestFood.text = user.value.bestFood!;
    bestMovie.text = user.value.bestMovie!;
    majorInt = majorsList.indexOf(user.value.major!) + 1;
    classInt = classList.indexOf(user.value.year!) + 1;
    major = user.value.major!;
    classYear = user.value.year!;

    onCampus = user.value.onCampus!;
    offCampus = !user.value.onCampus!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The app bar
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        backgroundColor: Constants.appBarColor,
        title: const Text("Edit Profile", style: TextStyles.title),
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
      backgroundColor: Colors.white,
      // The body of the page
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Constants.size.width > 850 ? 20.w : 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Stack(
                children: [
                  // The user's profile image
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: image.isEmpty
                        ? CachedNetworkImageProvider(
                            user.value.profileImage ??
                                "hhttps://firebasestorage.googleapis.com/v0/b/daafua-ashesi-social.appspot.com/o/9-250x250.jpg?alt=media&token=5a0798b0-f565-4e63-99cc-eb52e0f3167c",
                          )
                        : NetworkImage(image) as ImageProvider<Object>,
                  ),
                  Positioned(
                    bottom: -10,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: IconButton(
                        iconSize: 30,
                        onPressed: () {
                          // This function is called when the user taps on the camera icon to change the profile image
                          onTapBtntf();
                        },
                        icon: const Icon(Icons.photo_camera_rounded),
                      ),
                    ),
                  )
                ],
              ),
              //
              AnimatedCrossFade(
                firstChild: const Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 16),
                  child: Text(
                    "Please fill all fields correctly",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: Color(0xff9e9e9e),
                    ),
                  ),
                ),
                secondChild: const SizedBox.shrink(),
                crossFadeState: validationError
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500),
              ),
              // Date of birth textfield
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime(2010, 1, 1),
                      lastDate: DateTime(2010),
                      firstDate: DateTime(1950),
                    ).then((value) {
                      setState(() {
                        if (value != null) {
                          dob.text = Utilities.dateFormat(value);
                        }
                      });
                    });
                  },
                  child: FormWidget(
                    enabled: false,
                    lableText: "Date of Birth",
                    hintText: "8/12/1999",
                    controller: dob,
                    textStyle: TextStyles.bodyBlack,
                    validator: FormBuilderValidators.compose(
                      [
                        if (validationError) ...[
                          FormBuilderValidators.required(
                              errorText: "This field is required".tr),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              // Best food textfield
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: FormWidget(
                  lableText: "Best Food",
                  hintText: "Rice and Beans",
                  controller: bestFood,
                  textStyle: TextStyles.bodyBlack,
                  validator: FormBuilderValidators.compose(
                    [
                      if (validationError) ...[
                        FormBuilderValidators.required(
                            errorText: "This field is required".tr),
                      ],
                    ],
                  ),
                ),
              ),
              // Best movie textfield
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 15),
                child: FormWidget(
                  lableText: "Best Movie",
                  hintText: "Game of Thrones",
                  controller: bestMovie,
                  textStyle: TextStyles.bodyBlack,
                  validator: FormBuilderValidators.compose(
                    [
                      if (validationError) ...[
                        FormBuilderValidators.required(
                            errorText: "Name is required".tr),
                      ],
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  const Text(
                    "Major",
                    style: TextStyles.buttonBlack,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // Dropdown button for selecting the major
                  MajorDropdown(
                    color: Colors.white,
                    textStyle: TextStyles.bodyBlack,
                    onTap: (val) {
                      setState(() {
                        majorInt = val;
                        major = majorsList[val - 1];
                      });
                    },
                    majorInt: majorInt,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              Row(
                children: [
                  const Text(
                    "Class",
                    style: TextStyles.buttonBlack,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // Dropdown button for selecting the class
                  ClassDropDown(
                    color: Colors.white,
                    textStyle: TextStyles.bodyBlack,
                    onTap: (val) {
                      setState(() {
                        classInt = val;
                        classYear = classList[val - 1];
                      });
                    },
                    classInt: classInt,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              // Checkbox for on campus and off campus
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "On-Campus",
                        style: TextStyles.buttonBlack,
                      ),
                      Checkbox(
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: onCampus,
                          onChanged: (val) {
                            setState(() {
                              onCampus = val!;
                              offCampus = !val;
                            });
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Off-Campus",
                        style: TextStyles.buttonBlack,
                      ),
                      Checkbox(
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          value: offCampus,
                          onChanged: (val) {
                            setState(() {
                              offCampus = val!;
                              onCampus = !val;
                            });
                          }),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              // Update button
              MaterialButton(
                onPressed: () {
                  if (!isLoading) {
                    validateForms();
                  }
                },
                color: Constants.appBarColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.all(16),
                height: 40,
                minWidth: Constants.size.width,
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        //padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 4,
                        ),
                      )
                    : const Text("Update", style: TextStyles.button),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

// Function to validate the forms and update the user details
  void validateForms() async {
    // Check if all the fields are filled correctly
    if (bestFood.text.isNotEmpty &&
        bestMovie.text.isNotEmpty &&
        majorInt != 7 &&
        classInt != 6 &&
        (onCampus || offCampus) &&
        dob.text.isNotEmpty) {
      setState(() {
        validationError = false;
        isLoading = true;
      });
      try {
        // upload the image to the firebase storage
        if (image.isNotEmpty) {
          final url = await Services().uploadFile(File(image));
          user.value.profileImage = url;
        }
        // update the user details in the locally and in firestore
        user.value.bestFood = bestFood.text;
        user.value.bestMovie = bestMovie.text;
        user.value.major = major;
        user.value.year = classYear;
        user.value.onCampus = onCampus;
        //user.value.offCampus = offCampus;
        user.value.dob = dob.text;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.value.id)
            .update(user.toJson());
        setState(() {
          isLoading = false;
        });
        // show show update success message
        Fluttertoast.showToast(
          msg: "Profile Updated",
          backgroundColor: Colors.white,
          textColor: Colors.black,
          toastLength: Toast.LENGTH_LONG,
          fontSize: 14,
        );
        Get.back();
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        // show update error message
        Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.white,
          textColor: Colors.black,
          toastLength: Toast.LENGTH_LONG,
          fontSize: 14,
        );
      }
    } else {
      setState(() {
        validationError = true;
      });
    }
  }

// Function to handle permissions and show the image picker
  onTapBtntf() async {
    if (kIsWeb) {
      await FileManager().showModelSheetForImage(getImages: (value) async {
        setState(() {
          image = value!;
        });
      });
    } else {
      await PermissionManager.askForPermission(Permission.camera);
      await PermissionManager.askForPermission(Permission.storage);

      await FileManager().showModelSheetForImage(getImages: (value) async {
        setState(() {
          image = value!;
        });
      });
    }
  }
}
