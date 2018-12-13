(SELECT '['|| NVL(LISTAGG('{"value":"'||G.N_GCID||'","text":"'||G.C_JSGCMC||'}',',')
      WITHIN GROUP(ORDER BY G.N_GCID ),'') || ']'
FROM T_JSXM_XMXX_GHXK   G
WHERE G.N_XMID=A.N_XMID)                                                                        LIST_GC,
