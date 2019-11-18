/***
 * .then 或者 .catch 中 return 一个 error 对象并不会抛出错误，所以不会被后续的 .catch 捕获，需要改成其中一种：
 * returnPromise.reject(newError('error!!!'))
    thrownewError('error!!!')
 */
Promise.resolve().then(_ => {
    return new Error('errr1');
}).then(res => [
    console.log('then..1: ', res)
]).catch(err => [
    console.log('catch :', err)
])