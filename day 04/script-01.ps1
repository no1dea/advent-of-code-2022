$content = Get-Content "./input.txt"
#$content = "19-67,67-67"

$count = 0
$count2 = 0
foreach ($item in $content ) {
    [int]$r1low = $item.split(",")[0].split("-")[0]
    [int]$r1high = $item.split(",")[0].split("-")[1]
    [int]$r2low = $item.split(",")[1].split("-")[0]
    [int]$r2high = $item.split(",")[1].split("-")[1]
    
    if (($r1low -le $r2low) -and ($r2high -le $r1high)) {
        $count++
    }
    elseif (($r2low -le $r1low) -and ($r1high -le $r2high)) {
        $count++
    }
    if (!(($r1high -lt $r2low) -or ($r2high -lt $r1low))) { 
        $count2++ 
    }
}

$count
$Count2