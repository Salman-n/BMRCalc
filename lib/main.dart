import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:bmrcalc/widgets/custom_button.dart';
import 'package:bmrcalc/result.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final beratBadanController = TextEditingController();
  final usiaController = TextEditingController();
  final tinggiController = TextEditingController();
  String jk = 'Pria';
  String aktiv = 'Ekstra Aktiv';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 95, left: 24, right: 24),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                'BMR Calculator',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              
              DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,
                ),
                items: const ["Pria", "Wanita"],
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      labelText: "Jenis Kelamin",
                      hintText: "Pilih Jenis Kelamin...",
                      prefixIcon: const Icon(Icons.wc_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                onChanged: (String? newValue){
                  setState(() {
                    jk = newValue!;
                  });
                },
                
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 3,
                controller: beratBadanController,
                decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(),
                    ),
                    labelText: 'Berat Badan ',
                    prefixIcon: const Icon(Icons.scale_sharp)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 2,
                controller: usiaController,
                decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(),
                    ),
                    labelText: 'Usia ',
                    prefixIcon: const Icon(Icons.insert_invitation_rounded)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 3,
                controller: tinggiController,
                decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(),
                    ),
                    labelText: 'Tinggi Badan ',
                    prefixIcon: const Icon(Icons.man_sharp)),
              ),
              const SizedBox(
                height: 15,
              ),
              DropdownSearch<String>(
                popupProps: const PopupProps.menu(
                  showSelectedItems: true,
                  
                ),
                // selectedItem: aktiv,
                items: const [
                  "Kurang Bergerak/malas",
                  "Sedikit Aktif Bergerak",
                  "Cukup Bergerak",
                  "Sangat Aktif Bergerak",
                  "Ekstra Aktif"
                ],
                
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      labelText: "Aktvitas",
                      hintText: "Pilih Aktivitas...",
                      prefixIcon: const Icon(Icons.wc_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                onChanged: (String? newValue){
                  setState(() {
                    aktiv = newValue!;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomButton(
                    text: 'Reset',
                    onPressed: () {
                      usiaController.clear();
                      beratBadanController.clear();
                      tinggiController.clear();
                    },
                  )),
                  Expanded(
                      child: CustomButton(
                    text: 'Submit',
                    backgroundColor: Colors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  Result( aktivitas: aktiv,jk: jk, berat:  beratBadanController.text, usia: usiaController.text,tb: tinggiController.text,)),
                      );
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
