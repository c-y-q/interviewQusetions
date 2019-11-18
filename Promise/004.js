console.log('start')
const p = new Promise((resolve, reject) => {
    console.log(2)
    setTimeout(_ => {
        console.log('on')
        resolve('success')
    }, 0)
    console.log(3)
})

const start = Date.now();
p.then(res => {
    console.log(res, Date.now() - start)
})
setTimeout(_ => {
    console.log('setTimeout')

}, 0)

p.then(res => {
    console.log(res, Date.now() - start)
})
console.log('end')