(SELECT
'['||F_LINK('{"value":"'||G.N_GCID||'","text":"'||G.C_JSGCMC||'},')||']'
FROM T_JSXM_XMXX_GHXK   G
WHERE G.N_XMID=A.N_XMID)                                                                    LIST_GC,
