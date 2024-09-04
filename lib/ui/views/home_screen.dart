import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List glassCountList = [];
  final TextEditingController glassTEController =
      TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appBGColor.withOpacity(0.3),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: 'Welcome, ',
                          style: TextStyle(fontSize: 24),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Shipon 👋',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Take care of hydration. 💧',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: AppColors.appPrimaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/drink_water.png',
                            width: 150,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 80,
                                height: 50,
                                child: TextField(
                                  controller: glassTEController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Glass',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    print(glassTEController.value.text);
                                    Map getGlassCount = {
                                      'glass_count':
                                          glassTEController.text.toString(),
                                      'time':
                                          '${DateTime.now().hour}:${DateTime.now().minute}',
                                      'date':
                                          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                                    };
                                    glassCountList.add(getGlassCount);
                                  });
                                },
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      AppColors.appSecondaryColor),
                                ),
                                child: const Text('Add'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                  color: AppColors.appPrimaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 480,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child: glassCountList.isEmpty
                    ? const Center(
                        child: Text(
                          'No Data Found',
                          style: TextStyle(
                            color: AppColors.appPrimaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          final glassName = glassCountList[index];
                          return ListTile(
                            title: Text(
                              '${glassName['glass_count']} Glass Of Water',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: AppColors.appPrimaryColor,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(glassName['time']),
                                  Text(glassName['date']),
                                ],
                              ),
                            ),
                            leading: Image.asset(
                              'assets/images/glass_of_water.png',
                              width: 40,
                            ),
                            trailing: InkWell(
                              onTap: () {
                                setState(() {
                                  glassCountList.removeAt(index);
                                });
                              },
                              child: Image.asset(
                                'assets/images/delete.png',
                                width: 40,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 2,
                          );
                        },
                        itemCount: glassCountList.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
