/**
 * 解释：构造函数中的 resolve 或 reject 只有第一次执行有效，多次调用没有任何作用，呼应代码二结论：promise 状态一旦改变则不能再变
 */
const promise = new Promise((resolve, reject) => {
    resolve('success');
    reject('errot');
    resolve('success2');
})

promise.then((data) => {
    console.log('then', data);
}).catch(err => {
    console.log('catch', err)
})