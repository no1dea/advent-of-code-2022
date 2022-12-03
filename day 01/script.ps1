$calories = Get-Content '.\input.txt' -Raw
$nl = [System.Environment]::NewLine
$elves = $calories -split ("$nl$nl") | % { $_ -split "$nl" | Measure-Object -sum }

$first = $elves.sum | Sort-Object -Descending | Select-Object -first 1
$topthree = ($elves.sum | Sort-Object -Descending | Select-Object -first 3 | Measure-Object -sum).sum

Write-Host "The top elve has $first calories"
Write-Host "the top three elves have $topthree calories"