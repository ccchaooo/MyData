// 在需要访问某个对象的属性时，使用这个特性可以事先检测该对象是否为空：
name = o && o.getName();

// 或运算可以用来设置默认值：
name = otherName || "default";


// 定义对象
// 从 EcmaScript 5 开始，预留关键字可以作为对象的属性名（reserved words may be used as object property names "in the buff"）。
// 这意味着当定义对象字面量时不需要用双引号了。


// 函数
// 函数实际上是访问了函数体中一个名为 arguments 的内部对象，这个对象就如同一个类似于数组的对象一样，包括了所有被传入的参数。
// 让我们重写一下上面的函数，使它可以接收任意个数的参数：
function add() {
    var sum = 0;
    for (var i = 0, j = arguments.length; i < j; i++) {
        sum += arguments[i];
    }
    return sum;
}

add(2, 3, 4, 5); // 14

// JavaScript 允许使用任意函数对象的apply() 方法来调用该函数，并传递给它一个包含了参数的数组。
add.apply(null, [2, 3, 4, 5]); // 3.5
// 传给 apply() 的第二个参数是一个数组，它将被当作 avg() 的参数使用

//递归解析当前页面的所有节点
var charsInBody = (function counter(elm) {
    if (elm.nodeType == 3) { // 文本节点
        return elm.nodeValue.length;
    }
    var count = 0;
    for (var i = 0, child; child = elm.childNodes[i]; i++) {
        count += counter(child);
    }
    return count;
})(document.body);