import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serviscim_app/widgets/input_decoration.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class AracIsEklePage extends StatefulWidget {
  const AracIsEklePage({Key? key}) : super(key: key);

  @override
  _AracIsEklePageState createState() => _AracIsEklePageState();
}

class _AracIsEklePageState extends State<AracIsEklePage> {
  GlobalKey<FormState> formkey = GlobalKey(debugLabel: "Form");
  TextEditingController controllerAracYili = TextEditingController();
  TextEditingController controllerTecrube = TextEditingController();
  TextEditingController controllerPlaka = TextEditingController();
  TextEditingController controllerBaslamaSaati = TextEditingController();
  TextEditingController controllerReferans = TextEditingController();
  TextEditingController controllerAciklama = TextEditingController();
  String _aracYili = '';
  String _tecrube = '';
  String _plaka = '';
  String _referans = '';
  String _aciklama = '';
  DateTime _baslama_saati = DateTime.now();

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Aracıma iş Arıyorum',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: const Text('Marka'),
                          isExpanded: true,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (val) {}),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: const Text('Model'),
                          isExpanded: true,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (val) {}),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: const Text('Kapasite'),
                          isExpanded: true,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (val) {}),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildFormFieldRequired('Araç yılı bilginizi giriniz',
                      'Araç Yılı', _aracYili, controllerAracYili),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildFormField('Tecrübe', _tecrube, controllerTecrube, 1),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: const Text('Araç Durumu'),
                          isExpanded: true,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (val) {}),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildFormField('Plaka', _plaka, controllerPlaka, 1),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: const Text('Servis Başlama Semti'),
                          isExpanded: true,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (val) {}),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildFormFieldTime(
                      'Servis Başlama Saati',
                      'Başlama Saati Bilginizi Giriniz',
                      _baslama_saati,
                      controllerBaslamaSaati),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildFormField(
                      'Referanslar', _referans, controllerReferans, 3),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildFormField(
                      'Açıklama', _aciklama, controllerAciklama, 10),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildFormFieldRequired(
      validationText, hintText, formFieldValue, formFieldController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return validationText;
          }
          return null;
        },
        onSaved: (value) {
          setState(() {
            formFieldValue = value!;
          });
        },
        decoration: ProjectInputsUnderline(hintText),
        controller: formFieldController,
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget _buildFormField(
      hintText, formFieldValue, formFieldController, maxline) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        onSaved: (value) {
          setState(() {
            formFieldValue = value!;
          });
        },
        decoration: ProjectInputsUnderline(hintText),
        controller: formFieldController,
        keyboardType: TextInputType.text,
        maxLines: maxline,
      ),
    );
  }

  Widget _buildFormFieldTime(
      hintText, validationText, formFieldValue, formFieldController) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        onSaved: (value) {
          setState(() {
            formFieldValue = value!;
          });
        },
        validator: (value) {
          if (value!.isEmpty) {
            return validationText;
          }
          return null;
        },
        decoration: ProjectInputsUnderline(hintText),
        controller: formFieldController,
        keyboardType: TextInputType.text,
        onTap: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime.now(), onChanged: (date) {
            setState(() {
              _baslama_saati = date;
              final String formatted = formatter.format(date);
              formFieldController.text = formatted;
            });
          }, onConfirm: (date) {
            print('confirm $date');
          }, currentTime: DateTime.now(), locale: LocaleType.tr);
        },
      ),
    );
  }
}
