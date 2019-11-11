
//截流函数
function throttle(fn, delay) {
    let wait = false;
    return function () {
        let that = this,
            args = arguments;
        if (!wait) {
            wait = true;
            setTimeout(function () {
                fn.apply(that, args);
                wait = false;
            }, delay)
        }
    }
}
//防抖函数
function debounce(fn,delay){
	let timer;
	 return function(){
	 	let that = this,args = arguments;
	 	if(timer){
	 		clearTimeout(timer)
	 	}else{
	 		timer = setTimeout(function(){
	 			fn.apply(that,args);
	 		},delay)
	 	}
	 }
}
