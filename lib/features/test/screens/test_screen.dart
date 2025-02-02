import 'package:educare_erp/core/network/apiHelper/locator.dart';
import 'package:educare_erp/core/network/apiHelper/resource.dart';
import 'package:educare_erp/core/network/apiHelper/status.dart';
import 'package:educare_erp/core/utils/helper/common_utils.dart';
import 'package:educare_erp/features/test/models/post_model.dart';
import 'package:educare_erp/features/test/testAddressBlock/address_block.dart';
import 'package:educare_erp/features/test/testAddressBlock/address_event.dart';
import 'package:educare_erp/features/test/testAddressBlock/address_state.dart';
import 'package:educare_erp/features/test/testBlock/testBloc_event.dart';
import 'package:educare_erp/features/test/testBlock/testBloc_state.dart';
import 'package:educare_erp/features/test/testRepository/test_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../testBlock/testBloc_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  final TestUseCases _testUseCases = getIt<TestUseCases>();
  //List<PostModel> postListData = [];

  @override
  void initState() {
    // TODO: implement initState
    context.read<TestBloc>().add(FetchPosts());
    context.read<AddressBloc>().add(FetchAddress());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Test Screen"),
          Expanded(
            child: BlocBuilder<TestBloc, TestState>(
              builder: (context, state){
                if(state is TestLoading){
                  return Center(child: const CircularProgressIndicator());
                }
                else if(state is TestLoaded)
                  {
                    return  ListView.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (BuildContext context, int index){
                          return Text(state.posts[index].title.toString());
                        });
                  }
                else if(state is TestError){
                  return Center(child: Text(state.message));
                }
                return Center(child: Text("No Data"));
              },
            )


          ),


          Expanded(
            child: BlocBuilder<AddressBloc, AddressState>(
              builder: (context, state){
                if(state is AddressLoading)
                  {
                    return Center(child: const CircularProgressIndicator());

                  }
                else if(state is AddressLoaded)
                  {
                    return ListView.builder(
                        itemCount:state.address.length ,
                        itemBuilder: (BuildContext context, int index){
                          return Text(state.address[index].address.toString());
                        });
                  }

                else if(state is AddressError){
                  return Center(child: Text(state.message));

                }
                return Center(child: Text("No Data"));

              },


            ),
          )



        ],
      ),
    );
  }

  // getPostList() async{
  //
  //   Map<String, dynamic> requestData = {};
  //
  //   Resource resource = await _testUseCases.getPostList(requestData: requestData);
  //   //if(resource.status == "true"){
  //     postListData = (resource.data as List).map((x)=>PostModel.fromJson(x)).toList();
  //     setState(() {
  //
  //     });
  //   //}else{
  //     CommonUtils().flutterSnackBar(context: context, mes: resource.message??"", messageType: 4);
  //  // }
  //
  // }

}
