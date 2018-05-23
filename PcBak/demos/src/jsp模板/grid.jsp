<grid style="width: 100%;height: 150px"
	  ng-model="xmbjInfo.lxpzwhGrid"
	  id="lxpzwhGrid"
	  name="lxpzwhGrid"
	  ng-required="true"
	  imagepath="'<%=basePath%>script/dhtmlx/skins/web/imgs/'"
	  header2='"立项批准文号<label>*</label>,文号第二段<label>*</label>,文号第三段,立项批准单位名称<label>*</label>"'
	  colwidths='"150,*,150,200"'
	  colalignments='"left,left,left,left"'
	  coltypes='"combo,ed,ed,ed"'
	  colsorting='"str,str,str,str"'
	  combo-data="lxpzList" 
	  col-validators='["NotEmpty","NotEmpty","","NotEmpty"]' 
	  delete-function="delete_lxwh"
	  autoHeight="true"
>
</grid>