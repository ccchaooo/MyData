CREATE OR REPLACE PACKAGE BODY CDJWSYS_SJZD_SGXK
AS
--==============================================================================================
--  登录用户：appuser2017/appuser2017
--==============================================================================================

--==============================================================================================
--                       成都建委办公平台数据转递_包体(CDJWSYS_SJZD_SGXK)
--==============================================================================================
-- 目录
--==============================================================================================
--==============================================================================================
-- 过程
-- 1、转递数据分析                                PF_CDJWSYS_SJZD_SGXK
--==============================================================================================
-- 函数
--==============================================================================================
-- 创建人： 邓超
-- 创建时间：2018-05-16
-- 备注
--==============================================================================================

--==============================================================================================
-- 过程部分

-- 1、转递数据分析                                PF_CDJWSYS_SJZD_SGXK

PROCEDURE PW_CDJW_XXZXSJJK_GETSGXKXX
(
    PN_XMID                                       INTEGER,
    PN_UUID                                       INTEGER,
    PC_MSG                 OUT                    VARCHAR2,
    PC_FLAG                OUT                    VARCHAR2
)
AS

    vc_sgxkxx_clob                                CLOB;  -- 拼串所用clob

    vc_head                                       VARCHAR2(200);  -- 标签头
    vc_end                                        VARCHAR2(200);  -- 标签尾

    vc_bdbh                                       VARCHAR2(200);  -- 标段编号

    rt_dcsjl                                      APPUSER2017.T_PYJK_DCSJL%ROWTYPE;

    vs_Msg                                        VARCHAR2(255);

    vn_num                                        INTEGER;
    
    vc_sgxknr                                     VARCHAR2(4000);

    CURSOR c_cur IS SELECT D.*
                      FROM (SELECT RANK() OVER(PARTITION BY B.N_SPJLID ORDER BY B.N_SGXK_DYLS DESC) RN,
                                   A.N_SPJLID,
                                   F.N_ZBGM,
                                   A.N_XMID,
                                   A.N_BDID,
                                   B.C_SGXKZ_BH,
                                   B.C_JSDW,
                                   B.C_GCMC,
                                   B.C_SJDW_MC,
                                   B.C_SGDW_MC,
                                   B.C_JLDW_MC,
                                   B.C_HTJ, -- 合同价
                                   B.C_JSGM, -- 建设规模
                                   TO_CHAR(B.D_DY_SJ,'YYYY-MM-DD') D_DY_SJ,
                                   TO_CHAR(B.D_KGRQ,'YYYY-MM-DD') D_KGRQ,
                                   TO_CHAR(B.D_JGRQ,'YYYY-MM-DD') D_JGRQ,
                                   DECODE(E.C_DBXS,'1','担保公司保函','2','银行保函','3','保证金','') C_DBXS,
                                   E.C_BHBH,
                                   E.C_DBGS_MC,
                                   TO_CHAR(D_DBKSSJ,'YYYY-MM-DD') D_DBKSSJ,
                                   E.N_DBJE_JF,
                                   E.N_DBJE_YF,
                                   E.N_ZHSBJE,
                                   E.N_ZHSBRS,
                                   E.N_AQWMSGF,
                                   B.C_JSDZ,
                                   B.C_BZ,
                                   E.C_AQWMCS,
                                   E.N_YGJCZJ,  -- 预估建材总价
                                   E.C_LJLY,    -- 垃圾来源
                                   E.N_LJYGZL,   -- 垃圾预估总量
                                   (SELECT DECODE(A.C_SPXZQH,'510101','市建委',C_MC || '建设局') FROM t_js_code WHERE n_typeseq = 49 AND C_DM = A.C_SPXZQH) C_SPXZQH
                              FROM T_BLSP_SP_MAIN A
                              JOIN T_BLSP_SP_SGXKDY B
                                ON A.N_SPJLID = B.N_SPJLID
                              JOIN T_BLSP_SP_SGXK E
                                ON A.N_SPJLID = E.N_SPJLID
                              JOIN T_BLSP_JCSJ_BDXX F
                                ON A.N_BDID = F.N_BDID
                             WHERE A.C_SBLX = '2'
                               AND A.C_DQZT = '5'
                               --AND A.C_SQSPXZ = '01'
                               AND A.N_XMID = PN_XMID  --现在是按照项目ID来查询
                               ) D
                     WHERE D.RN = 1;

    vr_sgxkxx_row c_cur%ROWTYPE;

  BEGIN

    PC_MSG  := '';
    PC_FLAG := '0';

    vs_Msg := '';

    vc_head := '<BuilderLicenceManage>';

    vc_end  := '</BuilderLicenceManage>';

    FOR vr_sgxkxx_row IN c_cur LOOP
      
        vc_sgxknr := NULL;

        vs_Msg := '新增标段ID为：' || vr_sgxkxx_row.N_BDID || '施工许可数据失败！';

        vc_sgxkxx_clob := '';

        -- 1、施工许可证编号
        vc_sgxkxx_clob := '<BuilderLicenceNum>' || vr_sgxkxx_row.C_SGXKZ_BH ||'</BuilderLicenceNum>';

        -- 6、标段ID
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<TenderKey>' || vr_sgxkxx_row.N_BDID || '</TenderKey>';

        -- 6、标段编号
        SELECT C_BDBH INTO vc_bdbh FROM T_BLSP_JCSJ_BDXX WHERE N_BDID = vr_sgxkxx_row.N_BDID;
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<TenderCode>' || vc_bdbh || '</TenderCode>';

        -- 12、合同价格
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<ContractMoney>' || vr_sgxkxx_row.C_HTJ || '</ContractMoney>';

        -- 12、合同开工日期
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<ContractBeginDate>' || vr_sgxkxx_row.D_KGRQ || '</ContractBeginDate>';

        -- 12、合同竣工日期
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<ContractEndDate>' || vr_sgxkxx_row.D_JGRQ || '</ContractEndDate>';
        
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<StartIndate>' || vr_sgxkxx_row.D_KGRQ || '</StartIndate>';
        
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<EndIndate>' || vr_sgxkxx_row.D_JGRQ || '</EndIndate>';
        
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<Issuer>' || vr_sgxkxx_row.C_SPXZQH || '</Issuer>';
        
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<PermiteItemCode>JS01</PermiteItemCode>';
        
        vc_sgxknr := '工程名称' || vr_sgxkxx_row.C_GCMC || '；';
        vc_sgxknr := vc_sgxknr || '建设地址：' || vr_sgxkxx_row.C_JSDZ || '；';
        vc_sgxknr := vc_sgxknr || '建设单位：' || vr_sgxkxx_row.C_JSDW || '；';
        vc_sgxknr := vc_sgxknr || '施工单位：' || vr_sgxkxx_row.C_SGDW_MC || '；';
        vc_sgxknr := vc_sgxknr || '监理单位：' || vr_sgxkxx_row.C_JLDW_MC || '；';
        vc_sgxknr := vc_sgxknr || '设计单位：' || vr_sgxkxx_row.C_SJDW_MC || '；';
        vc_sgxknr := vc_sgxknr || '建设规模：' || vr_sgxkxx_row.C_JSGM || '；';
        vc_sgxknr := vc_sgxknr || '合同价格：' || vr_sgxkxx_row.C_HTJ || '；';
        vc_sgxknr := vc_sgxknr || '备注：' || vr_sgxkxx_row.C_BZ;

        vc_sgxkxx_clob := vc_sgxkxx_clob || '<LicenseConcent>' || vc_sgxknr || '</LicenseConcent>';

        -- 12、建设规模
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<PrjSize>' || vr_sgxkxx_row.C_JSGM || '</PrjSize>';

        -- 13、面积
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<Area>' || TO_CHAR(vr_sgxkxx_row.N_ZBGM) || '</Area>';

        -- 22、建设单位名称
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<BuildCompany>' || vr_sgxkxx_row.C_JSDW || '</BuildCompany>';

        -- 23、发放日期
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<IssueCertDate>' || vr_sgxkxx_row.D_DY_SJ || '</IssueCertDate>';

        -- 29、设计单位名称
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<DesignCompanyName>' || vr_sgxkxx_row.C_SJDW_MC || '</DesignCompanyName>';

        -- 31、施工单位名称
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<ConsCompanyName>' || vr_sgxkxx_row.C_SGDW_MC || '</ConsCompanyName>';

        -- 34、监理单位名称
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<SuperCompanyName>' || vr_sgxkxx_row.C_JLDW_MC || '</SuperCompanyName>';

        -- 42、担保开始时间
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<GuaranteeBeginDate>' || vr_sgxkxx_row.D_DBKSSJ || '</GuaranteeBeginDate>';

        -- 43、担保形式
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<GuaranteeType>' || vr_sgxkxx_row.C_DBXS || '</GuaranteeType>';

        -- 44、担保公司(银行)名称
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<GuaranteeCompanyBankName>' || vr_sgxkxx_row.C_DBGS_MC || '</GuaranteeCompanyBankName>';

        -- 45、担保金额甲方
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<GuaranteeFirstPartMoney>' || vr_sgxkxx_row.N_DBJE_JF || '</GuaranteeFirstPartMoney>';

        -- 46、担保金额甲方
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<GuaranteeSecondPartMoney>' || vr_sgxkxx_row.N_DBJE_YF || '</GuaranteeSecondPartMoney>';

        -- 47、综合社保金额
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<ComprehensiveSocialSecurityMoney>' || vr_sgxkxx_row.N_ZHSBJE || '</ComprehensiveSocialSecurityMoney>';

        -- 47、综合社保人数
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<ComprehensiveSocialSecurityCount>' || vr_sgxkxx_row.N_ZHSBRS || '</ComprehensiveSocialSecurityCount>';

        -- 49、安全文明施工费
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<SafeCivilyConstructMoney>' || vr_sgxkxx_row.N_AQWMSGF || '</SafeCivilyConstructMoney>';

        -- 50、安全措施
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<SafeCivilyMeasure>' || vr_sgxkxx_row.C_AQWMCS || '</SafeCivilyMeasure>';

        -- 56、预估建材总价
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<MaterialPriceTotal>' || TO_CHAR(vr_sgxkxx_row.N_YGJCZJ) || '</MaterialPriceTotal>';

        -- 57、垃圾来源
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<WasteSource>' || vr_sgxkxx_row.C_LJLY || '</WasteSource>';

        -- 58、垃圾预估量
        vc_sgxkxx_clob := vc_sgxkxx_clob || '<EstimateWasteCount>' || TO_CHAR(vr_sgxkxx_row.N_LJYGZL) || '</EstimateWasteCount>';

        -- 59、建筑垃圾信息
        vc_sgxkxx_clob := vc_sgxkxx_clob || PF_CDJW_XXZXSJJK_GETXMCLXX(vr_sgxkxx_row.N_SPJLID);

        -- 60、取再生产品信息
        vc_sgxkxx_clob := vc_sgxkxx_clob || PF_CDJW_XXZXSJJK_GETZSCPXX(vr_sgxkxx_row.N_SPJLID);

        vc_sgxkxx_clob := vc_head || vc_sgxkxx_clob || vc_end;

        INSERT INTO T_CDJW_XXZX_SGXK_TEMP VALUES(vr_sgxkxx_row.N_SPJLID,vc_sgxkxx_clob,SYSDATE);


        rt_dcsjl.N_PKID := SEQ_PYJK_DCSJL_PKID.NEXTVAL;
        rt_dcsjl.N_PCID := PN_UUID;
        rt_dcsjl.N_UUID := PN_UUID;
        rt_dcsjl.N_XMID := PN_XMID;
        rt_dcsjl.C_DATA_TYPE := 'ProjectInfo';
        rt_dcsjl.C_DATA := vc_xmxx_clob;
        rt_dcsjl.C_SFYX := '1';
        rt_dcsjl.N_CSCS := 0;
        rt_dcsjl.D_CJSJ := SYSDATE;

        INSERT INTO APPUSER2017.T_PYJK_DCSJL VALUES rt_dcsjl;        

    END LOOP;


    COMMIT;

    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        PF_CDJWSYS_SJZD_EXCEPTION(PN_XMID, PN_UUID, 'CDJWSYS_SJZD.PF_CDJWSYS_SJZD_XMXX', SQLERRM);
        RETURN;

  END;


--==============================================================================================
-- 函数部分

END;
/
SHOW ERROR;



BEGIN

    OPEN resultset FOR

    SELECT *
      FROM T_PYJK_DSMXMXX A
     ORDER BY D_CJSJ;

    LOOP

        FETCH resultset INTO rt_dsmxmxx;
        EXIT WHEN resultset%NOTFOUND;

        -- 写入扫描备份表

        rt_dsmxmxx_bak.N_XMID := rt_dsmxmxx.N_XMID;
        rt_dsmxmxx_bak.N_UUID := rt_dsmxmxx.N_UUID;
        rt_dsmxmxx_bak.D_CJSJ := SYSDATE;

        INSERT INTO APPUSER2017.T_PYJK_DSMXMXX_BAK VALUES rt_dsmxmxx_bak;

        DELETE FROM APPUSER2017.T_PYJK_DSMXMXX WHERE N_UUID = rt_dsmxmxx.N_UUID;

        COMMIT;

        -- 分析基本信息
        PF_CDJWSYS_SJZD_XMXX(rt_dsmxmxx.N_XMID, rt_dsmxmxx.N_UUID);

        -- 分析许可信息

        -- 分析中标信息



    END LOOP;

    CLOSE resultset;

    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        RETURN;

END;
