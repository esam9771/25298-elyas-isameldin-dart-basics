// Student: ISAMELDIN MOHAMED OSMAN ELYAS
// Reg no:  25298
const String regNo = '25298';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  // by IE
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by IE
  bool isNegative = amount < 0;
  String digits = amount.abs().toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;

  while (i >= 0) {
    result = digits[i] + result;
    count++;
    if (count % 3 == 0 && i > 0) {
      result = ',$result';
    }
    i--;
  }

  if (isNegative) {
    result = '-$result';
  }
  return '$result RWF';
}

bool isValidPin(String pin) {
  // by IE
  if (pin.length != 5) return false;
  if (pin == '12345') return false;

  int i = 0;
  bool allSame = true;
  while (i < pin.length) {
    int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) return false;
    if (pin[i] != pin[0]) {
      allSame = false;
    }
    i++;
  }

  if (allSame) return false;
  return true;
}

int sendMoney(int balance, int amount) {
  // by IE
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - (amount + fee);
  print(
      'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by IE
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print(
      'Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by IE
  print('Reg no: $regNo | D = $d | T = $t');

  // 1. Test isValidPin
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  // 2. Starting balance (20000 + 98 * 500 = 69,000 RWF)
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // 3. Transactions in order
  int step = 0;
  while (step < 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    step++;
  }
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. Final balance
  print('Final balance: ${formatRwf(balance)}');

  // 5. Custom test calls
  print(formatRwf(0));        // Expected: 0 RWF
  print(formatRwf(999));      // Expected: 999 RWF
  print(formatRwf(-5000));    // Expected: -5,000 RWF
  print(formatRwf(1250000));  // Expected: 1,250,000 RWF
  print(isValidPin('00000')); // Expected: false
  print(isValidPin(' 1234')); // Expected: false (space is not a digit)
}