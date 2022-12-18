using ODBC
using DataFrames

include("configdb.jl");
conn = ODBC.Connection("DRIVER={IBM i Access ODBC Driver};" * 
        "SYSTEM=$system;NAM=1;DBQ=$dbq;CCSID=1208;UID=$userid;PWD=$userpw")

sql = "SELECT current_timestamp as tstamp FROM SYSIBM.SYSDUMMY1"
df = DBInterface.execute(conn, sql) |> DataFrame

println(df)

## 1×1 DataFrame
##   Row │ TSTAMP
##       │ DateTime
##  ─────┼─────────────────────────
##     1 │ 2022-12-14T15:58:52.362
