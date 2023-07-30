import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const Homepage());
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.all(10.0),
            child: Image.asset('images/logo.png'),
          ),
          backgroundColor: Colors.teal,
          title: Center(
            child: Text('BinSense+'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // padding: const EdgeInsets.all(20),
            children: const [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Welcome!',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 40.0,
                        letterSpacing: 5.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '" Revolutionizing Waste Management: Where Technology Meets a Cleaner Future..."',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: VideoPlayerT(
                  url: 'assets/out.mp4',
                  dataSourceType: DataSourceType.asset,
                ),
              ),
              SizedBox(height: 24),
              Column(
                children: [
                  Center(
                    child: Text(
                      'Mission',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      textAlign: TextAlign.justify,
                      'Our mission is to create a cleaner and more sustainable environment by efficiently managing waste through smart garbage monitoring technology.',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Text(
                      'Vision',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      textAlign: TextAlign.justify,
                      'To be a leading solution provider in waste management, leveraging IoT and smart technologies for a greener future.',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Text(
                      'About Our App',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      textAlign: TextAlign.justify,
                      'Are you ready to revolutionize waste management? Our smart garbage monitoring system app brings a cutting-edge solution to the table. Say goodbye to overflowing garbage pits and inefficient collection processes. With real-time monitoring, intelligent alerts, and optimized truck dispatches, our app ensures a cleaner and greener future. Seamlessly track garbage levels, dispatch trucks on time, and take control of waste management operations. Experience the power of smart technology and join us in creating a sustainable environment, one garbage pit at a time.',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerT extends StatefulWidget {
  const VideoPlayerT(
      {Key? key, required this.url, required this.dataSourceType})
      : super(key: key);

  final String url;
  final DataSourceType dataSourceType;
  @override
  State<VideoPlayerT> createState() => _VideoPlayerTState();
}

class _VideoPlayerTState extends State<VideoPlayerT> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  // ChewieController? _chewieController;
  // final asset = 'assets/out.mp4';

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(widget.url);

    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController, aspectRatio: 16 / 9);

    _videoPlayerController.initialize().then(
          (_) => setState(
            () => _chewieController = ChewieController(
              videoPlayerController: _videoPlayerController,
              aspectRatio: 16 / 9,
            ),
          ),
        );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(controller: _chewieController),
        ),
      ],
    );
  }
}
