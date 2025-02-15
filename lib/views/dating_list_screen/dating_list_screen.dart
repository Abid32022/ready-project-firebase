import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_qurbani/views/dating_list_screen/dating_provider/dating_provider.dart';
import 'package:provider/provider.dart';
import '../../config/app_constant.dart';
import 'component/widget.dart';

class DatingListScreen extends StatefulWidget {
  const DatingListScreen({super.key});

  @override
  State<DatingListScreen> createState() => _DatingListScreenState();
}

class _DatingListScreenState extends State<DatingListScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DatingProvider>(context, listen: false).getDatingList();
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      Provider.of<DatingProvider>(context, listen: false)
          .getDatingList(isNextPage: true);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              Expanded(
                child: Consumer<DatingProvider>(
                  builder: (context, provider, _) {
                    if (provider.isLoading && provider.datingModel == null) {
                      return const Center(child: SpinKitWaveSpinner(color: Color(0xff544EF5),));
                    }

                    if (provider.datingModel?.results == null ||
                        provider.datingModel!.results!.isEmpty) {
                      return const Center(
                        child: Text("No data available."),
                      );
                    }

                    return  AnimationLimiter(  // Ensures staggered animations
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: provider.datingModel!.results!.length +
                            (provider.isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == provider.datingModel!.results!.length) {
                            return const Center(
                              child: SpinKitWaveSpinner(color: Color(0xff544EF5), size: 50),
                            );
                          }
                          final path = provider.datingModel!.results![index];
                          String formattedDate = AppConstants.formatDate(path.registered?.date ?? '');
                          String formattedTime = AppConstants.formatTime(path.location?.timezone?.offset ?? '');
                          String fullName = '${path.name?.title ?? ''} ${path.name?.first ?? ''} ${path.name?.last ?? ''}';

                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: datingCard(
                                    name: fullName,
                                    date: formattedDate,
                                    location: '${path.location?.street?.name ?? ''}, ${path.location?.city ?? ''}',
                                    time: formattedTime,
                                    image: path.picture?.medium ?? '',
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 150,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xff544EF5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Icon(Icons.arrow_back, color: Colors.white),

              Text(
                "Dating List",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.h,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5.w,),
            ],
          ),
           SizedBox(height: 20.h),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 14),
              prefixIcon: const Icon(Icons.search, color: Colors.black),
              hintText: "Search",
              hintStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.white)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

