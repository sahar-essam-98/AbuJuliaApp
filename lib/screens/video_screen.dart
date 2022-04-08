import 'package:abu_julia/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  String? url;
   VideoScreen({ this.url, Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late bool isLoop;

  late YoutubePlayerController _controller1 ;
  @override
  void initState() {
    print("rrrr ${widget.url}");
    var s = widget.url?.split("=");
    _controller1 = YoutubePlayerController(
      initialVideoId: s![1],
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    // _controller = VideoPlayerController.network(widget.url!)
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
    super.initState();

  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'فيــديو',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.sp),
        ),
        centerTitle: true,
        backgroundColor: primary,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.h),
        decoration: BoxDecoration(
          // color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: YoutubePlayer(
                controller: _controller1,
                showVideoProgressIndicator: true,
                onReady : () {
              _controller1.addListener(() {
                print("ggggggggg");
              });
              },
              ),
              // child: _controller.value.isInitialized
              //     ? AspectRatio(
              //         aspectRatio: 16/9,
              //         // _controller.value.aspectRatio,
              //         child: VideoPlayer(_controller),
              //       )
              //     : Container(),
            ),
            SizedBox(
              height: 10.h,
            ),
            // FloatingActionButton(
            //   backgroundColor: primary,
            //   onPressed: () {
            //     setState(() {
            //       _controller.value.isPlaying
            //           ? _controller.pause()
            //           : _controller.play();
            //     });
            //   },
            //   child: Icon(
            //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
