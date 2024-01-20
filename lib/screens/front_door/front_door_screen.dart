import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
final GlobalKey<SlideActionState> key = GlobalKey();

class FrontDoorScreen extends StatelessWidget {
  const FrontDoorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Front Door Lock'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLockStatus(context),
          _buildImage(),
          _buildSlideAction(key),
          _buildSendKeyButtons(context),
        ],
      ),
    );
  }

  Widget _buildLockStatus(context) {

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 80,
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            _buildStatusRow(const Icon(Icons.check), 'Wi-Fi Connected'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://scontent.fjkr2-1.fna.fbcdn.net/v/t39.30808-6/395630144_1502470767208345_678966994714854302_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=82JJ5_s_bJAAX_8OftD&_nc_oc=AQnFs0biWO8EWs3SYA_SekdHxTpgOYexxBGaYeU4UIuoXkN4wiUhS1Dhquhv2ibpQGM&_nc_ht=scontent.fjkr2-1.fna&oh=00_AfDAuQYrxB1GMUpKl8oxMpbu2mA5OKwfz6PcuLmkrQWBjg&oe=65B06EA9',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: SlideAction(
                      sliderButtonIcon: const Icon(Icons.lock_open),
                      text: '>    >    > ',
                      textColor: Colors.blueAccent,
                      innerColor: Colors.blueAccent,
                      outerColor: Colors.white70,
                      height: 50,
                      sliderRotate: false,
                      sliderButtonIconSize: 12,
                      sliderButtonIconPadding: 8,
                      elevation: 0,
                      key: key,
                      onSubmit: () {
                        Future.delayed(
                          const Duration(seconds: 1),
                          () => key.currentState!.reset(),
                        );
                        return null;
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(Widget icon, String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatusContainer(icon, Colors.green),
          _buildStatusContainer(const Icon(Icons.battery_full), Colors.black),
        ],
      ),
    );
  }

  Widget _buildStatusContainer(Widget leading, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          leading,
          const Text('65%'),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            'https://scontent.fjkr2-1.fna.fbcdn.net/v/t39.30808-6/395630144_1502470767208345_678966994714854302_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=82JJ5_s_bJAAX_8OftD&_nc_oc=AQnFs0biWO8EWs3SYA_SekdHxTpgOYexxBGaYeU4UIuoXkN4wiUhS1Dhquhv2ibpQGM&_nc_ht=scontent.fjkr2-1.fna&oh=00_AfDAuQYrxB1GMUpKl8oxMpbu2mA5OKwfz6PcuLmkrQWBjg&oe=65B06EA9',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildSlideAction(GlobalKey<SlideActionState> key) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: SlideAction(
              sliderButtonIcon: const Icon(Icons.lock_open),
              text: '>    >    > ',
              textColor: Colors.blueAccent,
              innerColor: Colors.blueAccent,
              outerColor: Colors.white70,
              height: 50,
              sliderRotate: false,
              sliderButtonIconSize: 12,
              sliderButtonIconPadding: 8,
              elevation: 0,
              key: key,
              onSubmit: () {
                Future.delayed(
                  const Duration(seconds: 1),
                  () => key.currentState!.reset(),
                );
                return null;
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildSendKeyButtons(BuildContext context) {
    return Row(
      children: [
        _buildSendKeyButton('Send Key', Colors.lightBlue, context),
        _buildSendKeyButton('Send Key', Colors.lightBlue, context),
      ],
    );
  }

  Widget _buildSendKeyButton(String buttonText, Color buttonColor, context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      margin: const EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.vpn_key, color: Colors.black, size: 50),
          const SizedBox(height: 10),
          Text(
            buttonText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
