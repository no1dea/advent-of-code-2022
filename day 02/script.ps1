$content = Get-Content "./input.txt"

# A, X = Rock = 1
# B, Y = Paper = 2
# C, Z = Scisscors = 3
# Win = 6
# Draw = 3
# Loss = 0

$rounds = ForEach ($round in $content) {
    $o = @{
        "opponent" = $($round.split(" ")[0]) -replace ("A", "1") -replace ("B", "2") -replace ("C", "3")
        "player"   = $($round.split(" ")[1]) -replace ("X", "1") -replace ("Y", "2") -replace ("Z", "3")
    }
    if ($o.opponent -eq $o.player) {
        $o.outcome = "draw"
        $o.sum = "3" + $o.player
    } else if ()

}
$rounds