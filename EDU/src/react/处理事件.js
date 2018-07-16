//前言:react 合成事件
//http: //www.css88.com/react/docs/events.html#focus-events
//SyntheticEvent 对象都具有以下属性：
const SyntheticEvent = {
  boolean: bubbles
  boolean: cancelable
  DOMEventTarget: currentTarget
  boolean: defaultPrevented
  number: eventPhase
  boolean: isTrusted
  DOMEvent: nativeEvent
  void: preventDefault()
  boolean: isDefaultPrevented()
  void: stopPropagation()
  boolean: isPropagationStopped()
  DOMEventTarget: target
  number: timeStamp
  string: type
}
// nativeEvent: '获取它要底层浏览器事件'

//从v0.14起，从事件处理程序返回 false 将不再停止事件冒泡。 
//应该根据需要手动 
// e.stopPropagation() 或 e.preventDefault()。

// 注意：
// 如果要以异步方式访问事件属性，应该对事件调用 event.persist() ，
//这将从池中删除合成事件，并允许用户代码保留对事件的引用。


//////////////////////////////////////////////////////////////////////////////////////////////
//传递一个函数作为事件处理程序，而不是一个字符串。

// <
// button onClick = {
//   activateLasers
// } >
// Activate Lasers <
// /button>

//React 中你不能通过返回 false 来阻止默认行为。必须明确调用 preventDefault
function ActionLink() {
  function handleClick(e) {
    e.preventDefault();
    console.log('The link was clicked.');
  }

  return (
    <a href="#" onClick={handleClick}>
      Click me
    </a>
  );
}

//参数传递给事件处理程序
// 在JSX回调中你必须注意 this 的指向。 在 JavaScript 中，类方法默认没有 绑定 的。
// 如果你忘记绑定 this.handleClick 并将其传递给onClick，那么在直接调用该函数时，this 会是 undefined 。
// 这不是 React 特有的行为；这是 JavaScript 中的函数如何工作的一部分。 
// 一般情况下，如果你引用一个后面没跟 () 的方法，例如 onClick={this.handleClick} ，那你就应该 绑定(bind) 该方法。
<button onClick={(e) => this.deleteRow(id, e)}>Delete Row</button> <
button onClick = {
  this.deleteRow.bind(this, id)
} > Delete Row < /button>
