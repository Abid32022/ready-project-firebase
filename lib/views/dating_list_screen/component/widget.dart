import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget datingCard({
  Color containerColor = Colors.grey,
  String name = "",
  String date = "",
  String location = "",
  String time = "",
  String image = '',
}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffEDEFF4)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            FaIcon(FontAwesomeIcons.calendarCheck, color: Color(0xff544EF5), size: 16,),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Dinner',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.h,
                  fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Icon(Icons.more_horiz),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
        Divider(thickness: 0.5,),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: Color(0xff544EF5), width: 2),
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(image),
                      radius: 48.h,
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 3.5,
                    child: Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        border: Border.all(
                            color: Colors.white,
                            width: 1.w),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    width: 140.w,
                    child: Text(
                      name,overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.h, fontWeight: FontWeight.bold),
                    ),
                  ),

                  Text(
                    "3 km from you",
                    style: TextStyle(color: Colors.black.withOpacity(0.50), fontSize: 10.h,fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              Spacer(),
              FaIcon(FontAwesomeIcons.whatsapp, color: Color(0xff544EF5), size: 20,),
              SizedBox(width: 20.w,),
              Icon(Icons.call,color: Color(0xff544EF5),size: 20,),

            ]
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.date_range,color: Colors.black,size: 14.h,),
                      SizedBox(width: 5.w,),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text("Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10.h),),
                      )
                    ],
                  ),
                  SizedBox(height: 3.h,),
                  Row(
                    children: [
                      Container(
                        height: 20.h,
                          // width: 60,
                          child: Text(date,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.h),overflow: TextOverflow.clip,)),
                    ],
                  ),

                  Row(
                    children: [
                      Text(time,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.h),),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 30.w,),

              Container(
                width: 0.5.w,
                height: 60.h,
                color: Colors.grey.withOpacity(0.50),
              ),


              SizedBox(width: 20.w,),
              Container(
                // color: re,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,size: 15.h,),
                        SizedBox(width: 5,),
                        Text("Location",style: TextStyle(fontSize: 10.h,color: Colors.black,fontWeight: FontWeight.w600),)
                      ],
                    ),
                    SizedBox(height: 6.h,),
                    Row(
                      children: [
                        Container(
                            width: 130.w,
                            child: Text(location,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12.h,fontWeight: FontWeight.w600),))
                      ],
                    ),
                    SizedBox(height: 14.h,)
                  ],
                ),
              )
            ],
          ),
        ),

      ],
    ),
  );
}
