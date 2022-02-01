import 'package:flutter/material.dart';
import 'package:the_movie_db/Constants/app_sizes.dart';

class SliderHeader extends StatelessWidget {
  const SliderHeader(
      {Key? key, required this.title, required this.ontap, this.hpadding})
      : super(key: key);

  final String title;
  final double? hpadding;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: hpadding ?? AppSizes.kdefaultpadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            child: const Text('SEE ALL'),
            onPressed: ontap,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          )
        ],
      ),
    );
  }
}
