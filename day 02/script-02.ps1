$content = Get-Content "./input.txt"

# A = Rock = 1
# B = Paper = 2
# C = Scisscors = 3
# X = lose
# Y = draw
# Z = win
# Win = 6
# Draw = 3
# Loss = 0

$rounds = ForEach ($round in $content) {
    $o = @{
        "opponent" = $($round.split(" ")[0]) -replace ("A", "1") -replace ("B", "2") -replace ("C", "3")
        "outcome"  = $($round.split(" ")[1]) -replace ("X", "lose") -replace ("Y", "draw") -replace ("Z", "win")
    }
    if ($o.outcome -eq "draw") {
        $o.player = $o.opponent
        [int]$o.sum = 3 + $o.player
    }
    elseif ($o.outcome -eq "win") {
        switch ($o.opponent) {
            1 { $o.player = "2" }
            2 { $o.player = "3" }
            Default { $o.player = "1" }
        }
        [int]$o.sum = 6 + $o.player
    }
    else {
        switch ($o.opponent) {
            1 { $o.player = "3" }
            2 { $o.player = "1"}
            Default { $o.player = "2" }
        }
        [int]$o.sum = $o.player
    }
    [pscustomobject]$o
}
$sum = ($rounds.sum | Measure-Object -sum).Sum
Write-Host "the total score is $sum"