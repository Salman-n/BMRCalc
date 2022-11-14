import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:bmrcalc/widgets/custom_button.dart';
import 'package:bmrcalc/main.dart';
import 'package:percent_indicator/percent_indicator.dart';

// void main() {
//   runApp(const Result());
// }

// class Result extends StatelessWidget {
//   final String beratBadan, usia, tinggi;

//   const Result(
//       {super.key,
//       required this.beratBadan,
//       required this.usia,
//       required this.tinggi});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Second(
//         beratDua: 'Text',
//         usiaDua: 'Text',
//         tinggiDua:  'aa',
//       ),
//     );
//   }
// }

// class Second extends StatefulWidget {
//   final String beratDua, usiaDua, tinggiDua;
//   const Second(
//       {Key? key,
//       required this.beratDua,
//       required this.usiaDua,
//       required this.tinggiDua})
//       : super(key: key);

//    String getBeratDUa(){
//     return beratDua;
//   }
//   @override
//   State<Second> createState() => _SecondState();
// }

class Result extends StatelessWidget {

  final String berat;
  final String usia;
  final String jk;
  final String tb;
  final String aktivitas;
    const Result(
      {super.key, required this.berat, required this.usia,  required this.tb, required this.jk, required this.aktivitas});

  @override
  Widget build(BuildContext context) {
    
    double koma;
    double bmr = 0;
    if (jk == 'Pria'){
      bmr = 66.5+(13.7*int.parse(berat)) + (5 * int.parse(tb)) - (6.8 * int.parse(usia));
    }
    else if (jk == 'Wanita'){
      bmr = 65.5+(9.6*int.parse(berat)) + (1.8 * int.parse(tb)) - (4.7 * int.parse(usia));
    }

    if (aktivitas == 'Kurang Bergerak/malas') {
      bmr = bmr * 1.2;
    } else if(aktivitas =='Sedikit Aktif Bergerak'){
      bmr = bmr * 1.375;
    }else if(aktivitas == 'Cukup Bergerak'){
      bmr = bmr * 1.55;
    }else if(aktivitas == 'Sangat Aktif Bergerak'){
      bmr = bmr * 1.725;
    }else if(aktivitas == 'Ekstra Aktif'){
      bmr = bmr * 1.9;
    }

    koma = bmr /3000;
   
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 90, left: 25, right: 25),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                'Result',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 15,
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    width: 30,
                    child: Text('JK', style: TextStyle(fontSize: 15)),
                  ),
                  
                  SizedBox(
                    width: 35,
                    child:Text('Usia', style: TextStyle(fontSize: 15)),
                  ),
                  
                  SizedBox(
                    width: 25,
                    child: Text('BB', style: TextStyle(fontSize: 15)),
                  ),
                  Text('TB', style: TextStyle(fontSize: 15)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  SizedBox(
                    width: 55,
                    child: Text(jk, style: const TextStyle(fontSize: 15)),
                  ),
                  
                  SizedBox(
                    width: 45,
                    child: Text(usia, style: const TextStyle(fontSize: 15)),
                  ),
                  
                  SizedBox(
                    width: 30,
                    child: Text(berat, style: const TextStyle(fontSize: 15)),
                  ),
                  Text(tb, style: const TextStyle(fontSize: 15)),
                  // const SizedBox(width: 20,),
                  // const Text('Sangat Aktif Bergerak', style: TextStyle(fontSize: 21)),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Aktivitas', style: TextStyle(fontSize: 15)),
              const SizedBox(
                height: 15,
              ),
               Text(aktivitas,
                  style: const TextStyle(fontSize: 15)),
              const SizedBox(
                height: 50,
              ),
             CircularPercentIndicator(
                radius: 90.0,
                lineWidth: 12.0,
                percent: koma,
                center:  Text("BMR = ${bmr.toStringAsFixed(2)} kal/day"),
                progressColor: Colors.green,
              ),
              const SizedBox(
                height: 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: ElevatedButton(
                    child: const Text('Kembali Ke Beranda'),
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const Myapp()),
                      // );
                    },
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
