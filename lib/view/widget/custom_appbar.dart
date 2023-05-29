import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppbar;

  final void Function()? opPressedIconFavorite;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController myController;

  const CustomAppBar({Key? key,
    required this.titleAppbar,
    this.onPressedSearch,
    required this.opPressedIconFavorite,
    this.onChanged, required this.myController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              controller: myController,
              decoration: InputDecoration(
                  prefixIcon: IconButton(icon: const Icon(Icons.search),onPressed: onPressedSearch,) ,
                  hintText: titleAppbar,
                  hintStyle: const TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200]),
            ),
          ),
          // const SizedBox(
          //   width: 10,
          // ),
          // Container(
          //   width: 60,
          //   padding: const EdgeInsets.symmetric(vertical: 8),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[200],
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: IconButton(
          //     onPressed: opPressedIcon,
          //     icon: Icon(
          //       Icons.notifications_active_outlined,
          //       size: 30,
          //       color: Colors.grey[600],
          //     ),
          //   ),
          // ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: opPressedIconFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
          )
        ],
      ),
    );
  }
}
