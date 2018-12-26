try{
  sql = sql + " AND T.N_LCJLBH = ?";
  params.add(Integer.parseInt(map.get("N_LCJLBH")));
}catch(NumberFormatException e)
{
  sql = sql + " AND 1 = 0";
}
