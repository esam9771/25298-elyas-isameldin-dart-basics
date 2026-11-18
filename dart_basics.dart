// Student: ISAMELDIN MOHAMED OSMAN ELYAS
// Reg no: 25298
const String regNo = '25298';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by IE
  int count = 0;
  String lowerText = text.toLowerCase();
  for (int i = 0; i < lowerText.length; i++) {
    String ch = lowerText[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
  }
  return count;
}

String initials(String fullName) {
  // by IE
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';

  List<String> names = trimmed.split(RegExp(r'\s+'));
  String result = '';
  for (String name in names) {
    result += '${name[0].toUpperCase()}.';
  }
  return result;
}

void drawTriangle(int height) {
  // by IE
  if (height <= 0) return;

  for (int row = 1; row <= height; row++) {
    String spaces = ' ' * (height - row);
    String symbol = (row % 2 == 1) ? '*' : '#';
    print('$spaces${symbol * row}');
  }
}

int count = 1;
void bump() {
  int count = 10;
  count++;
}
void doubleIt(int value) {
  value = value * 2;
}
int addVat(int price, {int rate = 18}) => price + price * rate ~/ 100;

int momoFee(int amount) {
  // by IE
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by IE
  if (phone.length != 10) return 'INVALID';
  return '${phone.substring(0, 3)}*****${phone.substring(8)}';
}

void main() {
  // by IE
  print('Reg no: $regNo | D = $d | T = $t');

  // Part A
  // A1
  int a = 17;
  int b = 5;
  print(a / b);
  print(a ~/ b);
  print(a % b);
  print(-a % b);
  print(-a ~/ b);
  print(-17.abs());
  print(0.1 + 0.2 == 0.3);
  print(10 == 10.0); 

  // A2
  int x = d;
  int y = t;
  var z = x * 2 + y ~/ 4;
  z += x;
  print(z);
  print(z.isEven);
  print('$z' + '$x');

  // Part B: Strings (18 marks)
  // B1
  String city = 'Kigali';
  print(city.length);
  print(city[city.length - 1]);
  print(city.substring(2, 4));
  print(city.toUpperCase().indexOf('A'));
  print(city.contains('k'));
  print('$city.length');
  print('${city.length}');
  print(city * 2);
  city.toUpperCase();
  print(city);
  print(city.replaceAll('i', '!'));
  print('5' + 5.toString());
  print(int.parse('5') + 5);

  // B2
  String fullName = 'ISAMELDIN MOHAMED OSMAN ELYAS';
  int vowelCount = countVowels(fullName);
  print('$fullName has $vowelCount vowels');

  // B3
  print(initials('ISAMELDIN MOHAMED OSMAN ELYAS'));
  print(initials('  ana   uwase  '));
  print(initials('   '));

  // Part C: Control flow (18 marks)
  // C1
  for (int i = 0; i < 6; i++) {
    if (i == 2) continue;
    if (i == 4) break;
    print(i);
  }

  // C2
  int day = 2;
  switch (day) {
    case 1:
    case 2:
      print('Early week');
    case 3:
      print('Midweek');
    default:
      print('Weekend soon');
  }

  // C3
  int? bonus;
  print(bonus ?? 50);
  bonus ??= 70;
  bonus ??= 90;
  print(bonus);
  int n = 10;
  do {
    print(n);
    n += 3;
  } while (n < 10);

  // C4
  x = d;
  String result = '';
  while (x > 0) {
    if (x % 2 == 0) {
      result += 'E';
    } else {
      result += 'O';
    }
    x -= 3;
  }
  print(result);
  print(result.length);
  print(result.isEmpty ? 'nothing' : result[0]);

  // C5
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // Part D: Functions (10 marks)
  // D1
  bump();
  print(count);
  int v = 5;
  doubleIt(v);
  print(v);
  print(addVat(1000));
  print(addVat(999));
  print(addVat(1000, rate: 0));

  // D2
  int sumFees = 0;
  String phone = '0788123456';
  int i = 1;

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    sumFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }

  print('Total fees: $sumFees RWF');
 
}