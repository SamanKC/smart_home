import 'package:flutter/material.dart';

class LivingRoom extends StatelessWidget {
  const LivingRoom({Key? key}) : super(key: key);

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
        title: const Text('Living Room Devices'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height / 1.5,
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Text(
                          'Devices',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildDeviceCard(
                        icon: Icons.ac_unit,
                        title: 'LG Air Cooler',
                        statusText: 'Air flow: Low',
                        category: DeviceCategory.airCooler,
                        increaseDecreaseButtons: true,
                        switchValue: true,
                      ),
                      _buildRowWithCards([
                        _buildDeviceCard(
                          icon: Icons.lightbulb_outline,
                          title: 'LED Lights',
                          statusText: 'Warm light',
                          switchValue: true,
                          category: DeviceCategory.ledLights,
                        ),
                        _buildDeviceCard(
                          icon: Icons.lightbulb_outline,
                          title: 'LED Lights',
                          statusText: 'Warm light',
                          switchValue: true,
                          category: DeviceCategory.ledLights,
                        ),
                      ]),
                      _buildRowWithCards([
                        _buildDeviceCard(
                          icon: Icons.tv,
                          title: 'Smart TV',
                          statusText: 'Samsung QLED 55"',
                          switchValue: true,
                          category: DeviceCategory.smartTV,
                        ),
                        _buildDeviceCard(
                          icon: Icons.tv,
                          title: 'Smart TV',
                          statusText: 'Samsung QLED 55"',
                          switchValue: true,
                          category: DeviceCategory.smartTV,
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildBottomButton(
              buttonText: 'Add Device',
              onButtonPressed: () {
                // Define the action when the button is pressed
                print('Button Pressed');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceCard({
    required IconData icon,
    required String title,
    required String statusText,
    bool switchValue = false,
    required DeviceCategory category,
    bool increaseDecreaseButtons = false,
  }) {
    final Color color = _getDeviceColor(category);

    return SizedBox(
      height: 180,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                        size: 16,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                  if (increaseDecreaseButtons) const _IncreaseDecreaseButtons(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      statusText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      softWrap: true,
                    ),
                  ),
                  if (switchValue)
                    Switch(
                      value: switchValue,
                      onChanged: (value) {},
                      activeColor: Colors.white,
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowWithCards(List<Widget> cards) {
    return Row(
      children: cards.map((card) => Expanded(child: card)).toList(),
    );
  }

  Color _getDeviceColor(DeviceCategory category) {
    switch (category) {
      case DeviceCategory.airCooler:
        return Colors.blue;
      case DeviceCategory.ledLights:
        return Colors.yellow;
      case DeviceCategory.smartTV:
        return Colors.green;
      case DeviceCategory.audioSystem:
        return Colors.orange;
      case DeviceCategory.desktopComputer:
        return Colors.purple;
    }
  }

  Widget _buildBottomButton({
    required String buttonText,
    required VoidCallback onButtonPressed,
  }) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onButtonPressed,
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.blue, fontSize: 24),
        ),
      ),
    );
  }
}

class _IncreaseDecreaseButtons extends StatelessWidget {
  const _IncreaseDecreaseButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildButton(Icons.add, () {
          // Handle increase action
        }),
        const SizedBox(width: 8),
        _buildButton(Icons.remove, () {
          // Handle decrease action
        }),
      ],
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onPressed) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blue.shade700,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon),
        onPressed: onPressed,
        color: Colors.white,
      ),
    );
  }
}

enum DeviceCategory {
  airCooler,
  ledLights,
  smartTV,
  audioSystem,
  desktopComputer,
}
