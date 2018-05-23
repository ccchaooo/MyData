--先判断是否为null
vj_json := JSON(NVL(PC_JSON,'{}'));
--处理空数组
vs_zjzxjglist                               := vj_cu_zbba.get('zjzxjgOpt').str;
IF vs_zjzxjglist IS NOT NULL
THEN
    vl_zjzxjgOpt                                := json_list(vs_zjzxjglist);                  --造价咨询机构
ELSE
    vl_zjzxjgOpt                                := json_list('[]');                           --造价咨询机构
END IF;

--循环结果集
AS
va T_BLSP_JGYS_GCSPXX%ROWTYPE;
BEGIN
    for va in ( select * from T_BLSP_JGYS_GCSPXX)
    loop
    INSERT into T_BLSP_JGYS_BAXX (
        N_BAJLID,
        C_GCBH ,
        C_GCMC ,
        C_GCDZ  )
    VALUES(
        BLSP_SP_STKCDW_SEQ.nextval,
        va.C_GCBH,
        va.C_GCMC,
        va.C_GCDZ);
end loop;

--NVL语法
NVL (expr1, expr2)：expr1为NULL，返回expr2；不为NULL，返回expr1。注意两者的类型要一致
NVL2 (expr1, expr2, expr3) ：xpr1不为NULL，返回expr2；为NULL，返回expr3。expr2和expr3类型不同的话，expr3会转换为expr2的类型
NULLIF (expr1, expr2)：相等返回NULL，不等返回expr1


--直接构造select
    -- 必须查询的可用的子项目【 T_JSXM_BDZXM_INFO 】 标段为0 不包含已选中的子项目
     --由标段子项目对应表【 T_JSXM_BDZXM_INFO 】与【 T_JSXM_BDZXM_INFO 】得出未被使用的子项目,
     --【 T_JSXM_BDZXM_INFO 】和 子项目信息【 T_JSXM_ZXMXX_INFO 】关联,查询出子项目ID和子项目名称
    OPEN P_RESULT_LIST_ALLZXM FOR
    SELECT A.N_ZXMID AS "value",A.C_ZXMMC AS "text",
           CASE WHEN (SELECT COUNT(*) FROM T_JSXM_BDZXM_INFO C WHERE C.N_ZXMID=A.N_ZXMID AND C.N_BDID=PN_BDID)=1
                THEN 'true' ELSE '' END AS "selected"
      FROM T_JSXM_ZXMXX_INFO A
     WHERE A.N_XMID = PN_XMID
       AND NOT EXISTS (SELECT 1 FROM T_JSXM_BDZXM_INFO B , t_jsxm_bdxx_info C
                       WHERE A.N_ZXMID = B.N_ZXMID
                       AND C.n_Bdid = b.n_bdid
                       AND C.C_ZBLX IN ('01','05','14') --其他标段的非施工招标不影响结果集
                       AND B.N_BDID != PN_BDID)
       ORDER BY A.N_ZXMID ASC;


--循环遍历 List
    FOR i IN 1..zxm_list.COUNT LOOP
      IF zxm_list.get_elem(i).IS_object() THEN
        vj_zxm := JSON(zxm_list.get_elem(i));

        SELECT COUNT(*) INTO vn_cnt
          FROM T_JSXM_BDZXM_INFO A
         WHERE A.N_BDID = vn_bdid
           AND A.N_ZXMID = TO_NUMBER(TRIM(vj_zxm.get('N_ZXMID').get_string()));
        IF vn_cnt != 1 THEN
          PN_RET := -1;
          PC_MSG := '未找到子项目信息。';
          ROLLBACK;
          RETURN;
        END IF;

        rt_bdzxm.N_ZXM_ZBGM := TO_NUMBER(TRIM(vj_zxm.get('N_ZXM_ZBGM').str));
        rt_bdzxm.C_ZXM_ZBGMJLDW := TRIM(vj_zxm.get('C_ZXM_ZBGMJLDW').str);
        rt_bdzxm.N_ZXM_ZBJ := TO_NUMBER(TRIM(vj_zxm.get('N_ZXM_ZBJ').str));
        rt_bdzxm.N_ZXM_DFZJ := TO_NUMBER(TRIM(vj_zxm.get('N_ZXM_DFZJ').str));
        rt_bdzxm.N_JZGCDFZJ := TO_NUMBER(TRIM(vj_zxm.get('N_JZGCDFZJ').str));
        rt_bdzxm.N_AZGCDFJG := TO_NUMBER(TRIM(vj_zxm.get('N_AZGCDFJG').str));

        UPDATE T_JSXM_BDZXM_INFO
           SET 
               N_ZXM_ZBGM     = rt_bdzxm.N_ZXM_ZBGM,
               C_ZXM_ZBGMJLDW = rt_bdzxm.C_ZXM_ZBGMJLDW,
               N_ZXM_ZBJ      = rt_bdzxm.N_ZXM_ZBJ,
               N_ZXM_DFZJ     = rt_bdzxm.N_ZXM_DFZJ
               N_JZGCDFZJ     = rt_bdzxm.N_JZGCDFZJ,
               N_AZGCDFJG     = rt_bdzxm.N_AZGCDFJG
         WHERE N_ZXMID = rt_bdzxm.N_ZXMID
           AND N_BDID = vn_bdid;
      ELSE
        PN_RET := -1;
        PC_MSG := '子项目信息获取失败。';
        ROLLBACK;
        RETURN;
      END IF;
    END LOOP;


--直接将查询结果拼接成对象 
'[{"VALUE":"'||A.C_XMGLDW_GUID||'","TEXT":"'||TRIM(A.C_XMGLDW_MC)||'","selected":"selected"}]'AS C_XMGLDW_JSON,
javascript 里面,使用 jQuery的 var obj = $.parseJSON(str) 即可
