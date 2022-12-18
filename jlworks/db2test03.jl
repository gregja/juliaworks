using ODBC
using DataFrames

include("configdb.jl");
conn = ODBC.Connection("DRIVER={IBM i Access ODBC Driver};" * 
        "SYSTEM=$system;NAM=1;DBQ=$dbq;CCSID=1208;UID=$userid;PWD=$userpw")

# sélection des pays dont le nom contient FR
sql = "SELECT ID, CODISO3, CODISO2, COUNTRYNAM FROM MYLIBRARY.COUNTRIES WHERE COUNTRYNAM LIKE ?"
df = DBInterface.execute(conn, sql, ["%FR%"]) |> DataFrame
 
# force la colonne ID en type INTEGER (Int64) dans le dataset de sortie
df.ID = Int.(df.ID)

# exemple pour forcer une colonne en type Float64 (pas utilisé ici)
#  df.ID = Float64.(df.ID)

println(df)

println("Total des IDs => ", sum(df.ID));
println("ID moyen => ", sum(df.ID)/length(df.ID));

println(size(df))           # (7, 4)
println(nrow(df))           # 7
println(ncol(df))           # 4
println(names(df))          # ["ID", "CODISO3", "CODISO2", "COUNTRYNAM"]
println(propertynames(df))  # [:ID, :CODISO3, :CODISO2, :COUNTRYNAM]

println(describe(df))  
# 4×7 DataFrame
#  Row │ variable     mean     min             median  max                          nmissing  eltype   
#      │ Symbol       Union…   Any             Union…  Any                          Int64     DataType 
# ─────┼───────────────────────────────────────────────────────────────────────────────────────────────
#    1 │ ID           363.571  248             342.0   472                                 0  Int64
#    2 │ CODISO3               ATF                     ZAF                                 0  String
#    3 │ CODISO2               CF                      ZA                                  0  String
#    4 │ COUNTRYNAM           AFRIQUE DU SUD          TERRES AUSTRALES FRANCAISES         0  String

# Récupération des valeurs de la colonne CODISO3 sous forme d'un tableau
println(df."CODISO3")       # ["ZAF", "CAF", "FRA", "GUF", "PYF", "MAF", "ATF"]
# autre technique équivalente 
println(df[:, "CODISO3"])   # ["ZAF", "CAF", "FRA", "GUF", "PYF", "MAF", "ATF"]

# Renommage des colonnes du dataset
rename!(df, [:a, :b, :c, :d])

println(df)
# 7×4 DataFrame
#  Row │ a      b       c       d
#      │ Int64  String  String  String
# ─────┼─────────────────────────────────────────────────────────
#    1 │   248  ZAF     ZA      AFRIQUE DU SUD
#    2 │   290  CAF     CF      CENTRAFRICAINE, REPUBLIQUE
# etc.
