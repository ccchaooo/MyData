--用于测试被修改的数据是否正常备份
SELECT czy.c_Ywmc,dat.N_CZRZBH,czy.d_Czsj,dat.C_TABLE,dat.C_COLUMN,dat.C_OLDVALUES,dat.C_NEWVALUES  FROM
 PLATE_LOG_CZY czy ,
 PLATE_LOG_DATA dat
 WHERE czy.c_Yyfwdm = dat.c_Yyfwdm
 AND czy.n_Czrzbh = dat.n_Czrzbh
 -- AND czy.N_CZRZBH >1475
 AND czy.d_Czsj = (SELECT MAX(A.d_Czsj) FROM PLATE_LOG_CZY A)
 ORDER BY N_CZRZBH DESC
