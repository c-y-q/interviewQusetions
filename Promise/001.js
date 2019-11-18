/**
 * 1. 解释：Promise 构造函数是同步执行的，promise.then 中的函数是异步执行的。
 */
const promise = new Promise((resovle, reject) => {
    console.log(1);
    resovle('promise1');
    console.log(2)
})
promise.then(() => {
    console.log(3)
})
console.log(4)
//result 1 2 3 4
console.log('-----------------2-------------------');