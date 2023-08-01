import 'package:get/get.dart';

class Addcontroller extends GetxController {
  RxString? service = "Haircut".obs;
  RxString gender = "Man".obs;

  RxBool haircut = false.obs;
  RxBool haircolor = false.obs;
  RxBool shave = false.obs;
  RxBool massage = false.obs;
  RxBool facecare = false.obs;
  RxBool haircare = false.obs;

  List<String> packagelist = [];
  String packagedetail = "";

  void add_package() {
    packagedetail = "";
    for (int i = 0; i < packagelist.length; i++) {
      packagedetail = "$packagedetail+${packagelist[i]}";
    }
    print("$packagedetail");
  }

  void all_Clear()
  {
    haircut.value=false;
    haircolor.value=false;
    shave.value=false;
    massage.value=false;
    facecare.value=false;
    haircare.value=false;
    packagedetail='';
    packagelist.clear();
  }

  void package_Update(String name)
  {String single='';
    for(int i=0;i<name.length;i++)
      {
        // print("name:===${name[i]}");
        if(name[i]!='+')
          {
            single=single+name[i];
            if(single=='Haircut')
              {
                haircut.value=true;
                packagelist.add("$single");
                single="";
              }
            else if(single=="Massage")
              {
                massage.value=true;
                packagelist.add("$single");
                single="";
              }
            else if(single=="Haircare")
            {
              haircare.value=true;
              packagelist.add("$single");
              single="";
            }
            else if(single=="Shave grooming")
            {
              shave.value=true;
              packagelist.add("$single");
              single="";
            }
            else if(single=="Face care")
            {
              facecare.value=true;
              packagelist.add("$single");
              single="";
            }
            else if(single=="Hair color")
            {
              haircolor.value=true;
              packagelist.add("$single");
              single="";
            }
          }
        // print("single:=$single");
      }
  }
}
