$content = Get-Content "./input.txt"

[int]$i = "1"
$table = [hashtable]::new()
('a'..'z').ForEach( { $table.add("$_", $i++) } )
('A'..'Z').ForEach( { $table.add("$_", $i++) } )

$list = ForEach ($rs in $content) {
    $backpack = @{
        "left"  = ($rs.substring(0, ($rs.Length / 2))).ToCharArray()
        "right" = ($rs.Substring(($rs.Length / 2))).ToCharArray()
    }

    $backpack.char = ($backpack.left | Where-Object { $_ -cin $backpack.right })[0]
    $backpack.sum = $table["$($backpack.char)"]

    [pscustomobject]$backpack

}
$sum = ($list.sum | Measure-Object -sum).Sum
Write-Host "The total sum is $sum"