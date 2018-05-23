数字模式 限定长度
ng-pattern="/^[0-9]\d*$|^(?:[1-9][0-9]*\.[0-9]+|0\.(?!0+$)[0-9]+)$/"
ng-minlength="3"
ng-maxlength="20"
ng-required="true"
{{ajxxForm.$error.required}}
ng-model="( zxminfo.N_JZCS_DX?zxminfo.N_JZCS_DX*1:0 )+( zxmInfo.N_JZCS_DS?zxmInfo.N_JZCS_DS*1:0 )"
