import 'package:flutter/material.dart';

class Band extends StatelessWidget {
  final Image _image;
  final String _songKey;
  final Function playSongs;
  final Icon icon;

  Band(this._image, this._songKey, this.playSongs, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Expanded(child: Container(height: 190, child: _image)),
              ),
              IconButton(
                icon: icon,
                onPressed: () {
                  playSongs(_songKey);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
