$content = Get-Content "./input.txt"

[int]$i = "1"
$table = [hashtable]::new()
('a'..'z').ForEach( { $table.add("$_", $i++) } )
('A'..'Z').ForEach( { $table.add("$_", $i++) } )

$list = (0..($content.length / 3 - 1)) | ForEach-Object {
    $start = $_ * 3
    $end = $start + 2
    $out = @{}
    $out.group = $content[$start..$end]
    $out.char = ($out.group[0].ToCharArray() | Where-Object { ($_ -cin $out.group[1].ToCharArray()) -and ($_ -cin $out.group[2].ToCharArray()) })[0]
    $out.sum = $table["$($out.char)"]
    [pscustomobject]$out
}

$sum = ($list.sum | Measure-Object -sum).Sum
Write-Host "The total sum is $sum"