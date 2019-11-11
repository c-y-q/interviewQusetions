Function.prototype.before = function (beforefn) {
    var __self = this;
    return function () {
        beforefn.apply(this, arguments);
        return __self.apply(this.arguments);
    }
}

Function.prototype.after = function (afterfn) {
    var __self = this;
    return function () {
        var ref = __self.apply(this, arguments);
        afterfn.apply(this, arguments);
        return ref;
    }
}
var func = function () {
    console.log(2)
}
func = func.before(function () {
    console.log(1)
}).after(function () {
    console.log(3)
})
func();
var cost = (function () {
    var args = [];
    return function () {
        if (arguments.length == 0) {
            var money = 0;
            for (let i = 0; i < args.length; i++) {
                money += args[i];
            }
            return money;
        } else {
            [].push.apply(args, arguments);
        }
    }
})()

cost(10);
cost(20);
cost(30);
var str = '    ';
if (!str) {
    console.log('ccccc')
}