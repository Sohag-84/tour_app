// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_agency/views/widgets/details_heading_description.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  final Map detailsData;
  const DetailsScreen({super.key, required this.detailsData});



  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 3,
                      child: Image.network(
                        widget.detailsData['list_images'][0],
                        fit: BoxFit.fill,
                      ),
                    ),

                    detailsHeadingDescription(
                        title: "Description",
                        description: widget.detailsData['list_description']),
                    detailsHeadingDescription(
                        title: "Facilities",
                        description: widget.detailsData['list_facilities']),
                    detailsHeadingDescription(
                        title: "Destination",
                        description: widget.detailsData['list_destination']),
                    // detailsHeadingDescription("Journey Date & Time",  widget.detailsData['list_destination']),
                    detailsHeadingDescription(
                        title: "Cost",
                        description: widget.detailsData['list_cost'].toString(),),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.detailsData['list_owner_name'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17.sp,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            launchUrl(
                              Uri.parse(
                                  "tel: ${widget.detailsData['list_phone']}"),
                            );
                          },
                          icon: Icon(Icons.call_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrl(
                              Uri.parse(
                                  "sms:${widget.detailsData['list_phone']}"),
                            );
                          },
                          icon: Icon(Icons.message_outlined),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}