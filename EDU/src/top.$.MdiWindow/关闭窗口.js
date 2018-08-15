layer = top.layer || layer;
var _layerIdx;
var _parentWin;
var _row;

function _init(args, mdi, layerIdx, parentWindow) {
  _parentWin = windowArguments.window;
  //传入参数
  _row = args.row;
  _layerIdx = layerIdx;

}

var f_close = function(v) {
  _parentWin.returnValue = v;
  layer.close(_layerIdx);
};
