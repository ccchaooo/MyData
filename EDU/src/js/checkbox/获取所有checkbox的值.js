var inputs = document.getElementsByTagName("input"); //获取所有的input标签对象
var checkboxArray = []; //初始化空数组，用来存放checkbox对象
for (var i = 0; i < inputs.length; i++) {
  var obj = inputs[i];
  if (obj.type == 'checkbox') {
    checkboxArray.push(obj);
    obj.checked = true;
  }
}
