import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget loadingGrids(BuildContext context) {
  return Expanded(
    child: GridView.builder(
      itemCount: 6,
      itemBuilder: (context, index) => loadingGrid(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .7,
          crossAxisCount: MediaQuery.sizeOf(context).width >
                  MediaQuery.sizeOf(context).height
              ? 5
              : 2),
    ),
  );
}

Widget loadingGrid() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 0.2, color: const Color.fromARGB(0, 189, 34, 34))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book cover placeholder
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Title placeholder
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 16,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 4),

          // Author placeholder
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 14,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 4),

          // Rating placeholder
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Container(
                  height: 14,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),

          // Price placeholder
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 16,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    ),
  );
}
