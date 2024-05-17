$header = "pname,amount,comment"
$comment = "a" * 1000       # 1kb of data

$header | Out-File -FilePath "./export.csv"

# These rows contain a bit more than 2mb of data
$rows = @"
Alice,-1,$comment
Bob,2,$comment
Alice,1,$comment
Carl,0,$comment
Dan,3,$comment`n
"@ * 400

# Putting more than 400mb of data
for ($i = 0; $i -lt 200; $i++) {
    $rows | Out-File -FilePath "./export.csv" -Append
}