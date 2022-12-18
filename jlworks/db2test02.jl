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
