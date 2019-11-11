Function.prototype.bind = function (ctx) {
    var self = this;
    return function () {
        return self.apply(ctx, arguments);
    }
}
var obj = {
    name: 'sven'
};
var func = function () {
    console.log(9, this.name)
}.bind(obj)
func()