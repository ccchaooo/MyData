//建设单位TOOLBAR
var myToolbar = new dhtmlXToolbarObject({
    parent: "xmyzGridToolBar",
    icon_path: "../script/dhtmlx/common/imgs/",
    items: [{
        id: "add",
        type: "button",
        text: "<span class='text-success'><span class=\"glyphicon glyphicon-plus\" aria-hidden=\"true\"></span>&nbsp;新增</span>"
    }, {
        id: "sep1",
        type: "separator"
    }, {
        id: "alter",
        type: "button",
        text: "<span class='text-primary'><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span>&nbsp;编辑</span>"
    }, {
        id: "sep2",
        type: "separator"
    }, {
        id: "delete",
        type: "button",
        text: "<span class='text-warning'><span class=\"glyphicon glyphicon-minus\" aria-hidden=\"true\"></span>&nbsp;删除</span>"
    }]
});
myToolbar.setSkin("material");
myToolbar.setAlign("right");
myToolbar.attachEvent("onClick", function(id) {
    if (id == "add") {
        $("#jsdwModal").removeData("_alter");
        $("#jsdwModal").modal("show");
    } else if (id == "alter") {
        var selectedId = jsdwGrid.getSelectedRowId();
        if (null == selectedId) {
            layer.alert("必须选择一条记录才能修改！", {
                icon: 7
            });
            return;
        }

        var jsdwListTemp = $("#jsdwModal").data("jsdwListTemp");
        scope.$apply(function() {
            scope.jsdwInfo = jsdwListTemp[selectedId * 1 - 1];
            scope.selectInit.C_JSDW = [{
                "value": scope.jsdwInfo.C_GUID,
                "text": scope.jsdwInfo.C_JGMC,
                "selected": true
            }];
            $("#jsdwModal").data("_alter", selectedId);
            $("#jsdwModal").modal("show");
        });

    } else if (id == "delete") {

        var selectedId = jsdwGrid.getSelectedRowId();
        if (null == selectedId) {
            layer.alert("必须选择一条记录才能删除！", {
                icon: 7
            });
            return;
        }

        var jsdwListTemp = $("#jsdwModal").data("jsdwListTemp");
        layer.confirm("确认要删除“" + jsdwListTemp[selectedId * 1 - 1]["C_JGMC"] + "” 吗？", {
            icon: 3
        }, function(idx) {
            layer.close(idx);
            //删除元素
            jsdwListTemp.splice(selectedId * 1 - 1, 1);
            $("#jsdwModal").data("jsdwListTemp", jsdwListTemp);
            $("#jsdwModal").modal("hide"); //触发事件
        });
    }
});
