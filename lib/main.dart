import 'package:flutter/material.dart';
void main()=>runApp(const SouqAmirApp());

class SouqAmirApp extends StatelessWidget{
const SouqAmirApp({super.key});
@override
Widget build(BuildContext context){
return MaterialApp(
debugShowCheckedModeBanner:false,
theme:ThemeData(primaryColor:const Color(0xFF0E6F4D), scaffoldBackgroundColor:Colors.white, useMaterial3:true),
home:const MainNav(),
);
}
}

class MainNav extends StatefulWidget{
const MainNav({super.key});
@override State<MainNav> createState()=>_MainNavState();
}
class _MainNavState extends State<MainNav>{
int idx=0;
final pages=[const HomeAmir(), const AmirChat(), const SettingsAmir()];
@override
Widget build(BuildContext context){
return Scaffold(
body:pages[idx],
bottomNavigationBar:BottomNavigationBar(
currentIndex:idx, selectedItemColor:const Color(0xFF0E6F4D),
onTap:(i)=>setState(()=>idx=i),
items:const[
BottomNavigationBarItem(icon:Icon(Icons.home),label:'الرئيسية'),
BottomNavigationBarItem(icon:Icon(Icons.favorite_border),label:'المفضلة'),
BottomNavigationBarItem(icon:Icon(Icons.shopping_cart),label:'السلة'),
BottomNavigationBarItem(icon:Icon(Icons.person),label:'حسابي'),
]
),
);
}
}

class HomeAmir extends StatelessWidget{
const HomeAmir({super.key});
@override
Widget build(BuildContext context){
return Scaffold(
appBar:AppBar(backgroundColor:const Color(0xFF0E6F4D),
title:Row(children:const[Icon(Icons.emoji_events,color:Colors.white),SizedBox(width:8),Icon(Icons.shopping_bag,color:Colors.white),SizedBox(width:8),Text('سوق أمير',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))]),
actions:const[Icon(Icons.notifications_none,color:Colors.white),SizedBox(width:12),Icon(Icons.favorite_border,color:Colors.white),SizedBox(width:12),Icon(Icons.person_outline,color:Colors.white),SizedBox(width:12)],
),
body:ListView(padding:const EdgeInsets.all(12),children:[
Container(padding:const EdgeInsets.symmetric(horizontal:16,vertical:12),decoration:BoxDecoration(border:Border.all(color:const Color(0xFF0E6F4D)),borderRadius:BorderRadius.circular(30)),child:Row(children:const[Icon(Icons.search,color:Color(0xFF0E6F4D)),SizedBox(width:8),Text('أمير البحث الذكي - اسأل عن أي منتج...')])),
const SizedBox(height:16),
const Text('الفئات',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)), const SizedBox(height:8),
Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:const[
Column(children:[CircleAvatar(backgroundColor:Color(0xFFE8F5E9),child:Icon(Icons.phone_android,color:Color(0xFF0E6F4D))),Text('هواتف')]),
Column(children:[CircleAvatar(backgroundColor:Color(0xFFE8F5E9),child:Icon(Icons.directions_car,color:Color(0xFF0E6F4D))),Text('سيارات')]),
Column(children:[CircleAvatar(backgroundColor:Color(0xFFE8F5E9),child:Icon(Icons.pedal_bike,color:Color(0xFF0E6F4D))),Text('دراجات')]),
Column(children:[CircleAvatar(backgroundColor:Color(0xFFE8F5E9),child:Icon(Icons.checkroom,color:Color(0xFF0E6F4D))),Text('ملابس')]),
Column(children:[CircleAvatar(backgroundColor:Color(0xFFE8F5E9),child:Icon(Icons.weekend,color:Color(0xFF0E6F4D))),Text('أثاثات')]),
]),
const SizedBox(height:16),
Container(padding:const EdgeInsets.all(12),decoration:BoxDecoration(color:const Color(0xFFF1F8E9),borderRadius:BorderRadius.circular(12),border:Border.all(color:const Color(0xFF0E6F4D))),child:Row(children:const[CircleAvatar(backgroundColor:Color(0xFF0E6F4D),child:Icon(Icons.shopping_bag,color:Colors.white)),SizedBox(width:8),Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('أمير • المساعد الذكي',style:TextStyle(fontWeight:FontWeight.bold)),Text('يا زول داير شنو؟')])])),
const SizedBox(height:16),
const Text('منتجات مميزة لليوم',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
Row(children:[
Expanded(child:Card(child:Column(children:[Image.network('https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-15-pro-max-1.jpg',height:120,errorBuilder:(c,e,s)=>const Icon(Icons.phone_iphone,size:80)),const Text('iPhone 15 Pro - 256GB'),const Text('650,000 جنيه',style:TextStyle(color:Color(0xFF0E6F4D),fontWeight:FontWeight.bold))]))),
Expanded(child:Card(child:Column(children:[const Icon(Icons.weekend,size:80,color:Color(0xFF0E6F4D)),const Text('طقم كنب فاخر 5 مقاعد'),const Text('420,000 جنيه',style:TextStyle(color:Color(0xFF0E6F4D),fontWeight:FontWeight.bold))]))),
])
])
);
}
}

class AmirChat extends StatelessWidget{
const AmirChat({super.key});
@override
Widget build(BuildContext context){
return Scaffold(
appBar:AppBar(backgroundColor:const Color(0xFF0E6F4D),title:const Text('أمير المساعد الذكي',style:TextStyle(color:Colors.white)),leading:const Icon(Icons.arrow_back,color:Colors.white)),
body:Column(children:[
const ListTile(title:Text('يا أمير المنتج ده أصلي ولا مقلد؟ اشتريت من عندكم وخايف يكون ما أصلي'),subtitle:Text('10:32 ص')),
Container(margin:const EdgeInsets.all(8),padding:const EdgeInsets.all(12),decoration:BoxDecoration(color:const Color(0xFFE8F5E9),borderRadius:BorderRadius.circular(12)),child:const Text('أمير: يا زول اطمن! دا أصلي iPhone 15 Pro 100% ومضمون من سوق أمير. رقم السيريال مطابق مع أبل، والضمان سنة كاملة. لو عايز تتأكد بنفسك خش الإعدادات > عام > حول وشوف السيريال. وكمان عندنا فاتورة رسمية وضمان استرجاع 14 يوم لو ما ارتاحت.')),
const Spacer(),
Padding(padding:const EdgeInsets.all(8),child:Row(children:[const Icon(Icons.attach_file),Expanded(child:TextField(decoration:InputDecoration(hintText:'اكتب رسالتك...',border:OutlineInputBorder(borderRadius:BorderRadius.circular(30))))),IconButton(onPressed:(){},icon:const Icon(Icons.send,color:Color(0xFF0E6F4D)))]))
])
);
}
}

class SettingsAmir extends StatelessWidget{
const SettingsAmir({super.key});
@override
Widget build(BuildContext context){
return Scaffold(
appBar:AppBar(backgroundColor:const Color(0xFF0E6F4D),title:const Text('الإعدادات',style:TextStyle(color:Colors.white)),leading:const Icon(Icons.arrow_back,color:Colors.white)),
body:ListView(padding:const EdgeInsets.all(16),children:[
ListTile(leading:const CircleAvatar(child:Icon(Icons.person)),title:const Text('محمد أحمد'),subtitle:const Text('مستخدم موثق • الخرطوم'),trailing:Chip(label:const Text('ذهبي موثق'),backgroundColor:Colors.amber[100])),
const Divider(),
const Text('الإعدادات العامة',style:TextStyle(fontWeight:FontWeight.bold)),
SwitchListTile(title:const Text('اللغة English / العربية'),value:true,onChanged:(v){}),
SwitchListTile(title:const Text('الوضع الداكن'),value:false,onChanged:(v){}),
SwitchListTile(title:const Text('الوضع بدون إنترنت'),value:false,onChanged:(v){}),
const Text('التحقق والتوثيق',style:TextStyle(fontWeight:FontWeight.bold)),
const ListTile(leading:Icon(Icons.verified_user),title:Text('الفضي موثق'),subtitle:Text('مكتمل • هوية موثقة')),
const ListTile(leading:Icon(Icons.emoji_events,color:Colors.amber),title:Text('الذهبي موثق'),subtitle:Text('مكتمل • سجل تجاري • رقم هاتف موثق')),
const Divider(),
ListTile(leading:const Icon(Icons.logout,color:Colors.red),title:const Text('تسجيل الخروج',style:TextStyle(color:Colors.red)),onTap:(){}),
Center(child:Text('الإصدار 1.4.2 • سوق أمير',style:TextStyle(color:Colors.grey[600]))),
])
);
}
}
