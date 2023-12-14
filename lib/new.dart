import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'home.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Timer _timer;

  double finalduration = const Duration(minutes: 5).inSeconds.toDouble();
  Duration duration = const Duration(minutes: 5);

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 7));
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    _controller.repeat();
    startTimer();
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setCountDown();
    });
  }

  void setCountDown() {
    const reduceCounter = 1;
    setState(() {
      final seconds = duration.inSeconds - reduceCounter;
      if (seconds < 0) {
        _timer.cancel();
        _controller.stop();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  bool isActive = true;



  @override
  Widget build(BuildContext context) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, "0");
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, "0");
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://cdn.pixabay.com/photo/2023/10/11/11/52/podcast-8308462_640.jpg"),
                  fit: BoxFit.cover)),
          child: GlassMorph(
            blur: 0,
            opacity: 0,
            image: "assets/raindrops.gif",
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // top bar
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.navigate_before, size: 35),
                        ),
                        Text(
                          "Listen Now",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.more_vert, size: 35),
                        ),
                      ],
                    ),

                    // album rotator
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Transform.rotate(
                                alignment: Alignment.center,
                                angle: _animation.value,
                                child: Container(
                                  height: 230,
                                  width: 230,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              "https://cdn.pixabay.com/photo/2023/10/11/11/52/podcast-8308462_640.jpg"),
                                          fit: BoxFit.cover)),
                                  child: Center(
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black),
                                    ),
                                  ),
                                ));
                          }),
                    ),

                    // song name
                    const SizedBox(height: 50),
                    const Text("Comedy",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    const SizedBox(height: 10),

                    // music artist name
                    const Text("03m0n X Diablo",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    const SizedBox(height: 30),

                    // music slider
                    SliderTheme(
                        data: SliderThemeData(
                            overlayShape: SliderComponentShape.noOverlay),
                        child: Slider(
                          value: finalduration - duration.inSeconds.toDouble(),
                          min: 0.0,
                          max: finalduration,
                          onChanged: (v) => {
                            setState(() {
                              duration = Duration(
                                  seconds: finalduration.toInt() - v.toInt());
                            })
                          },
                          activeColor: Colors.redAccent,
                          inactiveColor: Colors.grey,
                        )),

                    // music remaining time
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "-$minutes:$seconds",
                        style:
                        const TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // music controlling buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // skip previous button
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey)),
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.skip_previous),
                              ),
                            ),
                          ),

                          // play/pause button
                          InkWell(
                            onTap: () {
                              setState(() {
                                isActive
                                    ? {
                                  _timer.cancel(),
                                  _controller.stop(),
                                  isActive = false
                                }
                                    : {
                                  startTimer(),
                                  _controller.repeat(),
                                  isActive = true
                                };
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey)),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.redAccent,
                                child: Icon(
                                  isActive ? Icons.pause : Icons.play_arrow,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          // skip next button
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey)),
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.skip_next),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox())
                  ],
                ),
              ),
            ),
          )),
    );
  }
}