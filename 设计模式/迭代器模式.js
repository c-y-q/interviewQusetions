const each = function (arr, callback) {
    for (let i = 0; i < arr.length; i++) {
        callback.call(arr[i], i, arr);
    }
}
each([1, 2, 3, 4], (val, index, arr) => {
    console.log(val)
})

var arr1 = [1];
var arr2 = arr1;
console.log(arr1 == arr2)