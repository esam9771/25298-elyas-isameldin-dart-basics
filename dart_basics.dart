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

  // Part B: Strings 
 
  // B2
  String fullName = 'ISAMELDIN MOHAMED OSMAN ELYAS';
  int vowelCount = countVowels(fullName);
  print('$fullName has $vowelCount vowels');

  // B3
  print(initials('ISAMELDIN MOHAMED OSMAN ELYAS'));
  print(initials('  ana   uwase  '));
  print(initials('   '));

  // Part C: Control flow 

  // C5
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // Part D: Functions 
 
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