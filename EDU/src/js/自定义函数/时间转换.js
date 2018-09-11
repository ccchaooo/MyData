// 1. 将时间戳转换成日期格式：
function timestampToTime(timestamp) {
        var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        var D = date.getDate() + ' ';
        var h = date.getHours() + ':';
        var m = date.getMinutes() + ':';
        var s = date.getSeconds();
        return Y+M+D+h+m+s;
    }
    timestampToTime(1403058804);
    console.log(timestampToTime(1403058804));//2014-06-18 10:33:24
// 　　注意：如果是Unix时间戳记得乘以1000。比如：PHP函数time()获得的时间戳就要乘以1000。

//2. 将日期格式转换成时间戳：
var date = new Date('2014-04-23 18:55:49:123');
    // 有三种方式获取
    var time1 = date.getTime();
    var time2 = date.valueOf();
    var time3 = Date.parse(date);
    console.log(time1);//1398250549123
    console.log(time2);//1398250549123
    console.log(time3);//1398250549000
// 　　以上三种获取方式的区别：

// 　　第一、第二种：会精确到毫秒

// 　　第三种：只能精确到秒，毫秒用000替代

// 　　以上三个输出结果可观察其区别

// 　　注意：获取到的时间戳除以1000就可获得Unix时间戳，就可传值给后台得到。
