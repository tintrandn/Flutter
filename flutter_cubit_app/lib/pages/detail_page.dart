import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubic/app_cubit.dart';
import 'package:flutter_cubit/cubic/app_cubit_state.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_button.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitState>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 360,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("http://mark.bslmeiyu.com/uploads/" + detail.data.img),
                            fit: BoxFit.cover,
                          )),
                    )),
                Positioned(
                    left: 20,
                    top: 70,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        ),
                      ],
                    )),
                Positioned(
                    top: 330,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                  text: detail.data.name,
                                  color: Colors.black54.withOpacity(0.8)),
                              AppLargeText(
                                  text: "\$" + detail.data.price.toString(), color: AppColors.mainColor),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                  text: detail.data.location,
                                  color: AppColors.textColor1),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(Icons.star,
                                      color: gottenStars > index
                                          ? AppColors.starColor
                                          : AppColors.textColor2);
                                }),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: detail.data.stars.toString(),
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: "Number of people in your group",
                            color: AppColors.mainTextColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            children: List.generate(5, (index) {
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButton(
                                      text: (index + 1).toString(),
                                      size: 50,
                                      color: selectedIndex == index?Colors.white: Colors.black,
                                      backgroundColor: selectedIndex == index?Colors.black:AppColors.buttonBackground,
                                      borderColor: selectedIndex == index?Colors.black:AppColors.buttonBackground),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppLargeText(text: "Description", color: Colors.black.withOpacity(0.8),size: 20),
                          const SizedBox(height: 10,),
                          AppText(text: detail.data.description,
                            color: AppColors.mainTextColor,),

                        ],
                      ),
                    )),
                Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButton(
                            size: 60,
                            color: AppColors.textColor1,
                            backgroundColor: Colors.white,
                            borderColor: AppColors.textColor1,
                            icon: Icons.favorite_border,
                            isIcon: true),
                        const SizedBox(width: 20,),
                        ResponsiveButton(
                          isResponsive: true,
                        )
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
