import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class ReminderAllowScr extends StatefulWidget {
  const ReminderAllowScr({super.key});

  @override
  State<ReminderAllowScr> createState() => _ReminderAllowScrState();
}

class _ReminderAllowScrState extends State<ReminderAllowScr> {
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;

    bool yes = false;
    bool no = false;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Nhận lời nhắc nhở hàng ngày\nđể đạt được mục tiêu của bạn',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: scrHeight / 10),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 55),
                  child: Text(
                    'BrainTrain App muốn gửi\nthông báo cho bạn',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! không cho thông báo
                  InkWell(
                    onTap: () {
                      setState(() {
                        no = true;
                        yes = false;
                      });
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: no == true ? Colors.blue : Colors.white,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 47.7),
                        child: Text(
                          'Không',
                          style: TextStyle(
                            fontSize: 18,
                            color: no == true ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      InkWell(
                        //! cho phép thông báo
                        onTap: () {
                          no = false;
                          yes = true;
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            color: yes == true ? Colors.blue : Colors.white,
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 47.7),
                            child: Text(
                              'Cho phép',
                              style: TextStyle(
                                color: yes == true ? Colors.white : Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: scrHeight / 50),
                      Image.asset('assets/arrow-up.png'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: scrHeight / 25),
          const Text(
            'Nhắc nhở giúp bạn xây dựng thói quen tốt',
            style: TextStyle(
              color: Color.fromARGB(255, 132, 132, 132),
              fontSize: 16,
            ),
          ),
          SizedBox(height: scrHeight / 10),
          ElevatedButton(
            //! đồng ý
            onPressed: () {
              AwesomeNotifications().createNotification(
                content: NotificationContent(
                  id: 1,
                  channelKey: 'reminder',
                  title: 'BrainTrain nhắc nhở',
                  body:
                      'Đã 2 ngày bạn chưa rèn luyện nhận thức, hãy quay trở lại với BrainTrain ngay hôm nay!',
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 70, 172, 255)),
              elevation: MaterialStateProperty.all(1),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 125, vertical: 25)),
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (_) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            child: const Text(
              'Đồng ý',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
