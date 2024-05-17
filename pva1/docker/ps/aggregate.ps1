
$csv = Import-CSV "./export.csv"
$groups = $csv | Group-Object -Property pname

$summary = @{}

foreach ($group in $groups) {
    $summary[$group.Name] = 0
    foreach ($record in $group.Group) {
        $summary[$group.Name] += [int] $record.amount
    }
}

$summary