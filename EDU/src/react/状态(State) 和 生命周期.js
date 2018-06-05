function Clock(props) {
  return (
    <div>
      <h1>Hello, world!</h1>
      <h2>It is {props.date.toLocaleTimeString()}.</h2>
    </div>
  );
}

function tick() {
  ReactDOM.render(
    <Clock date={new Date()} />,
    document.getElementById('root')
  );
}

setInterval(tick, 1000);



// 函数式组件转化为类组件

// 你可以遵从以下5步, 把一个类似 Clock 这样的函数式组件转化为类组件：

//     创建一个继承自 React.Component 类的 ES6 class 同名类。
//     添加一个名为 render() 的空方法。
//     把原函数中的所有内容移至 render() 中。
//     在 render() 方法中使用 this.props 替代 props。
//     删除保留的空函数声明。



class Clock extends React.Component {
  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is {this.props.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
// 在类中添加生命周期方法

import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';



class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {date: new Date()};
  }

  componentDidMount(){
    this.timerID = setInterval(
      () => this.tick(),
      1000
      );
  }

  componentWillUnmount(){
    clearInterval(this.timerID);
  }

  tick() {
    this.setState({
      date: new Date()
    });
  }

  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is {this.state.date.toLocaleTimeString()}</h2>
      </div>
    );
  }

}

ReactDOM.render(
  <Clock />,
  document.getElementById('root')
);

// 该过程，以及调用方法的顺序：

//     当 <Clock /> 被传入 ReactDOM.render() 时, React 会调用 Clock组件的构造函数。 因为 Clock 要显示的是当前时间，所以它将使用包含当前时间的对象来初始化 this.state 。我们稍后会更新此状态。

//     然后 React 调用了 Clock 组件的 render() 方法。 React 从该方法返回内容中得到要显示在屏幕上的内容。然后，React 然后更新 DOM 以匹配 Clock 的渲染输出。

//     当 Clock 输出被插入到 DOM 中时，React 调用 componentDidMount() 生命周期钩子。在该方法中，Clock 组件请求浏览器设置一个定时器来一次调用 tick()。

//     浏览器会每隔一秒调用一次 tick()方法。在该方法中， Clock 组件通过 setState() 方法并传递一个包含当前时间的对象来安排一个 UI 的更新。通过 setState(), React 得知了组件 state(状态)的变化, 随即再次调用 render() 方法，获取了当前应该显示的内容。 这次，render() 方法中的 this.state.date 的值已经发生了改变， 从而，其输出的内容也随之改变。React 于是据此对 DOM 进行更新。

//     如果通过其他操作将 Clock 组件从 DOM 中移除了, React 会调用 componentWillUnmount() 生命周期钩子, 所以计时器也会被停止。
////////////////////////////////////////////////////////////////////////////////////////////
// 不要直接修改 state(状态)
// 例如，这样将不会重新渲染一个组件：

// 错误
this.state.comment = 'Hello';

// 用 setState() 代替：

// 正确
this.setState({comment: 'Hello'});

// 唯一可以分配 this.state 的地方是构造函数。

// state(状态) 更新可能是异步的

// React 为了优化性能，有可能会将多个 setState() 调用合并为一次更新。

// 因为 this.props 和 this.state 可能是异步更新的，你不能依赖他们的值计算下一个state(状态)。
