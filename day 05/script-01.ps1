#             [L] [M]         [M]    
#         [D] [R] [Z]         [C] [L]
#         [C] [S] [T] [G]     [V] [M]
# [R]     [L] [Q] [B] [B]     [D] [F]
# [H] [B] [G] [D] [Q] [Z]     [T] [J]
# [M] [J] [H] [M] [P] [S] [V] [L] [N]
# [P] [C] [N] [T] [S] [F] [R] [G] [Q]
# [Z] [P] [S] [F] [F] [T] [N] [P] [W]
#  1   2   3   4   5   6   7   8   9 

$content = Get-Content .\input.txt

$stacks = (1..9) | Foreach-Object {
    @{$_ = $content[8].indexof("$_") }
}

$cargo = ForEach ($stack in $stacks) {
    [ordered]@{$stack.keys = $content[7..0] | ForEach-Object { $_[$stack.Values] | Where-Object { $_ -ne " " } } }
}