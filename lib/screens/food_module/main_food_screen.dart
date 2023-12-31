import '../../utilities/imports.dart';

class MainFoodScreen extends StatefulWidget {
  const MainFoodScreen({super.key});

  @override
  State<MainFoodScreen> createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'More',
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        actions: <IconButton>[
          IconButton(
            highlightColor: Colors.transparent,
            mouseCursor: MaterialStateMouseCursor.clickable,
            tooltip: 'My Cart',
            icon: const Icon(
              Icons.shopping_cart,
              size: 26,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(cartItems: cartItems),
                  ));
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 0,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.28,
              child: DrawerHeader(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/profile_pic.jpg',
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    AppValues.userName,
                    style: const TextStyle(
                        fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    AppValues.userEmail,
                    style: TextStyle(fontSize: 18),
                  )
                ],
              )),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text(
                    "Profile",
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {},
                  leading: const Icon(Icons.person),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    "Settings",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.settings),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    "Order History",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.history),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text(
                    "Need Help?",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.contact_support),
                ),
                ListTile(
                  onTap: () {
                    AppValues.userAgreedPolicy = true;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TermsConditionsScreen(),
                        ));
                  },
                  title: const Text(
                    "Terms & Conditions",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.policy),
                ),
                ListTile(
                  onTap: () {
                    AppValues.userAgreedPolicy = true;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ));
                  },
                  title: const Text(
                    "Privacy Policy",
                    style: TextStyle(fontSize: 18),
                  ),
                  leading: const Icon(Icons.privacy_tip_outlined),
                ),
                const CustomSizedBox(heightRatio: 0.05),
                CustomElevatedButton(
                  buttonText: 'Log out',
                  buttonWidthRatio: 0.4,
                  elevation: 0,
                  buttonPress: () {
                    setState(() {
                      AppConsts.emailControllerS.text = '';
                      AppConsts.passwordControllerS.text = '';
                      AppConsts.emailControllerR.text = '';
                      AppConsts.passwordControllerR.text = '';
                      AppConsts.streetControllerR.text = '';
                      AppConsts.phoneControllerR.text = '';
                      AppConsts.passwordControllerR.text = '';
                      AppConsts.passwordControllerRR.text = '';
                      DeliveryProcessHelpers.setEverythingDefault();
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: height < 400
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CustomResponsiveText(
                  'Hi Ahmed',
                  scaleFactor: width > 780 ? 0.013 : 0.02,
                  color: Colors.grey.shade700,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <CustomResponsiveText>[
                  CustomResponsiveText(
                    'What would you like to ',
                    scaleFactor: width > 780 ? 0.013 : 0.02,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomResponsiveText(
                    'eat?',
                    scaleFactor: width > 780 ? 0.013 : 0.02,
                    color: Colors.red.shade900,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
              const CustomSizedBox(heightRatio: 0.025),
              const Expanded(flex: 0, child: DiscountOfferTile()),
              const CustomSizedBox(),
              const HeaderText("Categories"),
              const CategoriesTile(),
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const HeaderText(
                        "Popular",
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FullMenuScreen(),
                              ));
                        },
                        child: Text(
                          "View Full Menu",
                          textScaleFactor: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.redAccent.shade700, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                  flex: width > 1000 ? 2 : 1, child: const PopularFoodTile()),
            ],
          ),
        ),
      ),
    );
  }
}
