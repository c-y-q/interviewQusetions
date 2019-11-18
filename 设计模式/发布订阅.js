var salesOffices = {}; //定义售楼处
salesOffices.clientList = {}; //缓存列表,存放订阅者的回调函数
salesOffices.listen = function (key, fn) { //增加订阅者
    if (!this.clientList[key]) {
        this.clientList[key] = [];
    }
    this.clientList[key].push(fn);
}
salesOffices.trigger = function () { //发布消息
    let key = Array.prototype.shift.call(arguments);
    let fns = this.clientList[key];
    if (!fns || fns.length == 0) {
        return false;
    }
    for (let i = 0, fn; fn = fns[i++];) {
        fn.apply(this, arguments);
    }
}

/**
 * 小明订阅消息
 */
salesOffices.listen('squreMeter88', function (price) {
    console.log('价格：' + price)
})
/**
 * 小花订阅消息
 */
salesOffices.listen('squreMeter110', function (price) {
    console.log('价格：' + price)
})

salesOffices.trigger('squreMeter88', 20000);
salesOffices.trigger('squreMeter110', 30000);