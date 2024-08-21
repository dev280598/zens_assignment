void miniMaxSum(List<int> arr) {
  int sum = arr.reduce((a, b) => a + b);
  int max = sum - arr.first;
  int min = sum - arr.first;

  for( var i = 0; i < arr.length; i ++) {
    final sub = sum - arr[i];
    max = max > sub ? max : sub;
    min = min < sub ? min : sub;
  }
  print('$min $max');
}


void main() {
  List<int> arr = [5, 3, 2, 1, 4];
  miniMaxSum(arr);
}
