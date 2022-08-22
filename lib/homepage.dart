import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List? quotes =[
    "People often say that motivation doesn't last. Well, neither does bathing -- that's why we recommend it daily. \n - Zig Ziglar",
    "Someday is not a day of the week. \n - Denise Brennan-Nelson",
    "Hire character. Train skill. \n - Peter Schutz",
    "Your time is limited, so don't waste it living someone else's life. \n - Steve Jobs",
    "Everyone lives by selling something. \n - Robert Louis Stevenson",
    "If you are not taking care of your customer, your competitor will. \n - Bob Hooey",
    "With the new day comes new strength and new thoughts. \n -  Eleanor Roosevelt",
    "The real voyage of discovery consists not in seeking new landscapes, but in having new eyes. \n - Marcel Proust",
    "You are never too old to set another goal or to dream a new dream. \n – Les Brown",
    "Old friends pass away, new friends appear. It is just like the days. An old day passes, a new day arrives. The important thing is to make it meaningful: a meaningful friend - or a meaningful day. \n - Dalai Lama",
    "Make new friends, but keep the old; Those are silver, these are gold. \n - Joseph Parry",
    "Every new beginning comes from some other beginning's end. \n - Seneca",
    "Each friend represents a world in us, a world not born until they arrive, and it is only by this meeting that a new world is born. \n - Anais Nin",
    "I have always been delighted at the prospect of a new day, a fresh try, one more start, with perhaps a bit of magic waiting somewhere behind the morning. \n - J. B. Priestley",
    "Trust is hard to come by. That's why my circle is small and tight. I'm kind of funny about making new friends. \n - Eminem",
    "Today you are You, that is truer than true. There is no one alive who is Youer than You. \n - Dr. Seuss",
    "One of the best ways to make other people happy is to be happy yourself. \n - Gretchen Rubin",
    "Before you marry a person, you should first make them use a computer with slow Internet to see who they really are. \n - Will Ferrell",
    "I want my children to have all the things I couldn't afford. Then I want to move in with them. \n - Phyllis Diller",
    "Never follow anyone else’s path. Unless you’re in the woods and you’re lost and you see a path. Then by all means follow that path. \n - Ellen DeGeneres",
    "You'll miss the best things if you keep your eyes shut. - Dr. Seuss",
    "I walk around like everything’s fine, but deep down, inside my shoe, my sock is sliding off. \n  - Anonymous",
    "Someone asked me, if I were stranded on a desert island what book would I bring: ‘How to Build a Boat. \n - Steven Wright",
    "I’m at a place in my life when errands are starting to count as going out. \n - Anonymous",
    "As you get older, three things happen. The first is your memory goes, and I can’t remember the other two. \n - Sir Norman Wisdom",
    "Why do they call it rush hour when nothing moves? \n - Robin Williams",
  ];

  List? imagez = [
    "assets/images/image 1.jpg",
    "assets/images/image 2.jpg",
    "assets/images/image 3.jpg",
    "assets/images/image 4.jpg",
    "assets/images/image 5.jpg",
    "assets/images/image 6.jpg",
    "assets/images/new image.jpg",
    "assets/images/new image 2.jpg",
    "assets/images/new image 3.jpg",
    "assets/images/water.jpg",
  ];

  int? indexNo =0;

  int? index = 0;

  generateRandom(){
    Random random = Random();
    int j = random.nextInt(quotes!.length);

    //display random images from my images folder...
    Random random2 = Random();
    int f = random2.nextInt(imagez!.length);

    setState(() {
      indexNo = j;
      index = f;
    });
    if (kDebugMode) {
      print(indexNo);
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.quote_bubble_fill,
              size: 40, color: Colors.white,),
            onPressed: () {
              generateRandom();
              // click button to show next quote and image....
            },
          ),
        ],
        centerTitle: true,
        title: Text("Quotes", style:
        GoogleFonts.ubuntu(
            fontSize: 40,
            color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 2, right: 2),
                  height: 500,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      //display random images from my images folder...
                        image: AssetImage(imagez![index!]),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                const SizedBox(height: 10,),

                Text(quotes![indexNo!],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontStyle: FontStyle.normal
                  ),
                ),

                // const SizedBox(height: 5,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(child: const Icon(CupertinoIcons.heart,
                        color: CupertinoColors.destructiveRed),
                        onPressed: (){}),
                    CupertinoButton(child: const Icon(CupertinoIcons.share_up,
                      color: CupertinoColors.destructiveRed,),
                        onPressed: (){
                      showCupertinoDialog(context: context, builder: (BuildContext contxt){
                        return SimpleDialog(
                          title: const Text("Option"),
                          children:<Widget> [
                            SimpleDialogOption(
                              onPressed: () { Navigator.of(contxt).pop(); },
                              child: const Text('Copy text'),
                            ),
                            SimpleDialogOption(
                              onPressed: () { Navigator.of(contxt).pop(); },
                              child: const Text('Share Quote'),
                            ),
                          ],
                        );
                      });
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}