void miniMaxSum(List<int> arr) {
  arr.sort();
  int minSum = arr.take(4).reduce((a, b) => a + b);
  int maxSum = arr.skip(1).reduce((a, b) => a + b);
  print('$minSum $maxSum');
}

//
// void main() {
//   List<int> arr = [1, 2, 3, 4, 6];
//   miniMaxSum(arr);
// }
