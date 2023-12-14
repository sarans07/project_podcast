class Model
{
  String? text;
  String? text1;


  Model(this.text,this.text1);
}

List lis = modelData.map((a) => Model(a["text"], a["text1"])).toList();

var modelData = [
  {"text":"","text1":"English"},
  {"text":"தமிழ்","text1":"Tamil"},
  {"text":"हिंदी","text1":"Hindi"},
  {"text":"తెలుగు","text1":"Telugu"},
  {"text":"ನಿನ್ನ ಬಳಿ","text1":"Kanada"},
  {"text":"മലയാളം","text1":"Malayalam"},
  {"text":"मराठी","text1":"Marathi"},
];