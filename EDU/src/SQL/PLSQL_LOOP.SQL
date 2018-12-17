-- 查询勘察单位
FOR nLOOP IN (SELECT
                A.C_QYMC,
                A.C_XMFZR
              FROM T_BLSP_SP_STKCDW a,
                (SELECT
                    N_ZXMID,
                    N_SPJLID
                  FROM T_BLSP_SP_SPZXM
                  WHERE C_STWCBZ = '1'
                        AND N_ZXMID IN
                            (SELECT N_ZXMID
                            FROM T_BLSP_SP_SPZXM
                            WHERE N_SPJLID = VN_SPJLID)) b
              WHERE a.N_SPJLID = b.N_SPJLID
                    AND a.N_ZXMID = b.N_ZXMID
              GROUP BY A.C_QYMC, A.C_XMFZR) LOOP

  vc_kcdwmc := nLOOP.C_QYMC || '、';
  vc_kcdw_xmfzr := nLOOP.C_XMFZR || '、';
END LOOP;
