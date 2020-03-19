let urlStr = 'http://www.inode.club?name=koala&study=js&study=node';
String.prototype.queryString = function () {
    let reg = /([^&=?]+)=([^&=?]+)/g,
        obj = {};
    this.replace(reg, function () {
        obj[arguments[1]] = arguments[2];
    })
    return obj;
}
console.log(urlStr.queryString());
// 参数转成对象
function queryString(request) {
    let params = request.split('?')[1];
    let param = params.split('&');
    let obj = {};
    for (let i = 0; i < param.length; i++) {
        let paramsA = param[i].split('=');
        let key = paramsA[0];
        let value = paramsA[1];
        if (obj[key]) {
            obj[key] = Array.isArray(obj[key]) ? obj[key] : [obj[key]];
            obj[key].push(value);
        } else {
            obj[key] = value;
        }
    }
    return obj;
}
console.log(queryString(urlStr));