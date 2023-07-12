import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_care/Frontend/Screens/Pills%20Id/color.dart';
import 'package:health_care/Frontend/Screens/Pills%20Id/shapes.dart';
import 'package:health_care/Frontend/constants/constants.dart';

class PillIdentifierPage extends StatefulWidget {
  const PillIdentifierPage({Key? key}) : super(key: key);

  @override
  _PillIdentifierPageState createState() => _PillIdentifierPageState();
}

class _PillIdentifierPageState extends State<PillIdentifierPage> {
  int _selectedScreenIndex = 0;
  late PageController _pageController;
  String _selectedShape = '';
  Color? _selectedColor;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedScreenIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  void _handleShapeSelected(String selectedShape) {
    setState(() {
      _selectedShape = selectedShape;
    });
  }

  void _handlColorSelected(Color selectedColor) {
    setState(() {
      _selectedColor = selectedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Pill Identifier',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Clear action
            },
            child: const Text(
              "Clear",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: FocusManager.instance.primaryFocus?.hasFocus ??
                                false
                            ? kPrimaryColor
                            : Colors.grey.shade400,
                      ),
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FocusManager.instance.primaryFocus?.hasFocus ??
                                  false
                              ? kPrimaryColor
                              : Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0,
                      ),
                    ),
                    onTap: () {
                      // Open search page
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              boxShadow: const [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    blurStyle: BlurStyle.outer),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _selectScreen(0);
                      _pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    child: ListTile(
                      title: const Center(
                        child: Text(
                          'Shape',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      tileColor: _selectedScreenIndex == 0
                          ? Colors.white
                          : Colors.transparent,
                      subtitle: Container(
                        height: 2,
                        color: _selectedScreenIndex == 0
                            ? kPrimaryColor
                            : Colors.transparent,
                      ),
                      trailing: _selectedShape.isNotEmpty
                          ? SizedBox(
                              width: 30,
                              height: 30,
                              child: SvgPicture.asset(
                                _selectedShape,
                                color: kPrimaryColor,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _selectScreen(1);
                      _pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    child: ListTile(
                      title: const Center(
                        child: Text(
                          'Color',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      tileColor: _selectedScreenIndex == 1
                          ? Colors.white
                          : Colors.transparent,
                      subtitle: Container(
                        height: 2,
                        color: _selectedScreenIndex == 1
                            ? kPrimaryColor
                            : Colors.transparent,
                      ),
                      trailing: _selectedColor != null
                          ? Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _selectedColor!,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _selectScreen,
              children: [
                ShapeScreen(
                  onShapeSelected: _handleShapeSelected,
                ),
                ColorScreen(
                  onColorSelected: _handlColorSelected,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
