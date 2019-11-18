/**
 * promise 可以链式调用。提起链式调用我们通常会想到通过 return this 实现，
 * 不过 Promise 并不是这样实现的。promise 每次调用 .then 或者 .catch 都会返回一个新的 promise，从而实现了链式调用
 */

Promise.resolve(1).then(res => {
    console.log(17, res);
    return 2;
}).catch(err => {
    return 3;
}).then(res => {
    console.log(22, res)
})