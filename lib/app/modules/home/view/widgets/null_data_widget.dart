import 'package:flutter/material.dart';

class HomeNull extends StatelessWidget {
  const HomeNull({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/sammy-line-thoughtful-man-with-empty-list.png',
          ),
          fit: BoxFit.contain,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Empty team",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
