import 'package:flutter/material.dart';
import 'package:planlarim/model/post_model.dart';
import 'package:planlarim/posts/add_post.dart';
import 'package:planlarim/services/auth_service.dart';
import 'package:planlarim/services/prefs_service.dart';
import 'package:planlarim/services/rtdb_service.dart';

class Post_home extends StatefulWidget {
  const Post_home({Key key}) : super(key: key);
static final String id="post_home";
  @override
  _Post_homeState createState() => _Post_homeState();
}

class _Post_homeState extends State<Post_home> {
  List<Post>items=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apigetposts();

  }

  _opendetail()async{
    Map results= await Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context){
          return Add_post();
        }
    ),);
    if(results !=null  && results.containsKey("data")){
      print(results["data"]);
      _apigetposts();
    }
  }
  // get posts
  _apigetposts()async{
    var id=await Prefs.loadUserId();
    print(id.toString());
    RTDBService.getPosts(id.toString()).then((posts) => {
      _respPosts(posts),
    });
  }
// responce posts
  _respPosts(List<Post>posts){
    setState(() {
      items = posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("All Post",style: TextStyle(color: Colors.white,fontSize: 25),),
        centerTitle: true,
        actions: [
          // sign out
          IconButton(
            onPressed: (){
              AuthService.signOutUser(context);
            },
            icon: Icon(Icons.exit_to_app_outlined,color: Colors.white,),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i){
          return itemOfList(items[i]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _opendetail,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget itemOfList(Post post){
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  post image
          Container(
            padding: EdgeInsets.all(15),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: post.img_url != null ?
            Image.network(post.img_url,fit: BoxFit.cover,):
            Image.asset("assets/images/ic_default.png",),
          ),
          SizedBox(width: 15,),
          // text post fullname
          Text(post.firstname+"   "+post.lastname,style: TextStyle(color: Colors.black,fontSize: 20),),
          SizedBox(height: 10,),
          // text post date
          Text(post.date,style: TextStyle(color: Colors.black,fontSize: 16),),
          SizedBox(height: 10,),
          // text post content
          Text(post.content,style: TextStyle(color: Colors.black,fontSize: 18),),
        ],
      ),
    );
  }

}

