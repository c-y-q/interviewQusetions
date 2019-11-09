function outer() {
    inner();
}

function inner() {
    // console.log(inner.caller)
    console.log(arguments.callee.caller)
}
outer();
var a = new Boolean(false);
console.log(a, typeof a)
var res = a; //&& true;
console.log(res === false);
var c = false;
var d = false;
console.log(c == d, c === d, c + d, c instanceof Boolean)

console.log(new Boolean('') - new Boolean('a'))
var str = 'helllo world';
console.log(str.slice(1, 4))
var obj = [{
    create_time: '2019-01-01',
    mac_addr: "河北邯郸",
    name: 'aa'
}, {
    create_time: '2019-01-01',
    mac_addr: "河北邯郸"
}, {
    create_time: '2019-01-01',
    mac_addr: "河北邯郸"
}]
//转驼峰
function toTuoFeng(obj) {
    const obj2 = JSON.stringify(obj);
    const obj3 = obj2.replace(/(\_[a-z])/g, val => val.toLocaleUpperCase().replace('_', ''));
    return JSON.parse(obj3);
}
//转下划线
const varsg = {
    macAddr: 'mac电脑',
    remarks: '我去'
}
const str5 = JSON.stringify(varsg);
const str6 = str5.replace(/[A-Z]/g, val => `_${val.toLowerCase()}`);
console.log(str6)