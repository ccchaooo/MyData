  -- 验证规划许可证号是否符合要修
  FOR GHXKROW IN
      (SELECT DISTINCT GH.C_JSGCGHXKZ,GH.C_JSGCMC,MN.N_XMID,GH.N_GCID
       FROM T_BLSP_SP_MAIN MN
         JOIN T_JSXM_BDZXM_INFO BDZXM
           ON MN.N_BDID = BDZXM.N_BDID
         JOIN T_JSXM_ZXMXX_INFO ZXM
           ON BDZXM.N_ZXMID = ZXM.N_ZXMID
         JOIN T_JSXM_XMXX_GHXK GH
           ON ZXM.N_GCID = GH.N_GCID
       WHERE MN.N_SPJLID = vn_spjlid)
  LOOP
    -- 验证工程编号是否符合规则
    IF APPUSER2017.JW2017_UTIL.F_TEST_SGXK_JZD(GHXKROW.N_GCID) <> TRUE THEN
      PN_RET := 1;
      PC_MSG := '建设工程规划许可证【' || GHXKROW.C_JSGCMC || '】的证书号【'|| GHXKROW.C_JSGCGHXKZ ||'】不符合要求，请前往项目信息页面进行修改：'||
                --我的网上办事 → 项目列表 → 修改项目 →
                '建设工程规划许可证信息  →  选中【' ||
                GHXKROW.C_JSGCMC || '】 →  编辑 → 修改证书号' || '</br><a href="../xmbj/xmbj_xmxx.jsp?xmid='||GHXKROW.N_XMID||'"> 点击此处跳转 </a> ';
      ROLLBACK ;
      RETURN ;
    END IF;
  END LOOP;
