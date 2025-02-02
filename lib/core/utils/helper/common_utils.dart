import 'package:flutter/material.dart';

class CommonUtils {
  static final CommonUtils _instance = CommonUtils._internal();

  factory CommonUtils() {
    return _instance;
  }

  CommonUtils._internal();

  loadingState({required bool isLoading}) {
    if (isLoading) {
    } else {}
  }

  flutterSnackBar(
      {required BuildContext context,
      required String mes,
      required int messageType,
      bool isVisible = true}) {
    // 1 : Congratulations!
    // 2 : Did you know ?
    // 3 : Warning
    // 4 : Something went wrong !

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).colorScheme.secondary,
                        offset: const Offset(0.0, 3.0),
                        blurRadius: 8.0)
                  ],
                  border: Border.all(
                      color: messageType == 1
                          ? Colors.green
                          : messageType == 2
                              ? Colors.blueAccent
                              : messageType == 3
                                  ? Colors.orange
                                  : messageType == 4
                                      ? Colors.red
                                      : Colors.black), // Colors.black87,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: messageType == 1
                                ? Colors.green
                                : messageType == 2
                                    ? Colors.blueAccent
                                    : messageType == 3
                                        ? Colors.orange
                                        : messageType == 4
                                            ? Colors.red
                                            : Colors.black),
                        child: Center(
                          child: Icon(
                            messageType == 1
                                ? Icons.verified_user
                                : messageType == 2
                                    ? Icons.info_outlined
                                    : messageType == 3
                                        ? Icons.warning_amber_outlined
                                        : messageType == 4
                                            ? Icons.highlight_remove_sharp
                                            : Icons.verified_user,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: isVisible,
                              child: Text(
                                messageType == 1
                                    ? "Congratulations!"
                                    : messageType == 2
                                        ? "Did you know ?"
                                        : messageType == 3
                                            ? "Warning"
                                            : messageType == 4
                                                ? "Something went wrong !"
                                                : "Did you know ?",
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      color: Colors.black,
                                      //fontFamily: AppFontSize.appFontOpenSans,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              mes,
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 13,
                                    //fontFamily: AppFontSize.appFontOpenSans,
                                    fontWeight: FontWeight.w400,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                          child: const Icon(
                            Icons.clear_rounded,
                            color: Colors.black,
                          )),
                    ]))))));
  }
}
