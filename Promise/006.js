process.nextTick(() => {
    console.log('nextTick')
})
new Promise((resolve, reject) => {
        console.log('promise_1')
    }).then(_ => {
        console.log('then 1')
    })
    .then(_ => {
        console.log('then 2')
    })
setTimeout(() => {
    console.log('setTimeout')
}, 0)
setImmediate(() => {
    console.log(16, 'setImmediate')
})
console.log('end')