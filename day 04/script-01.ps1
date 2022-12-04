$content = Get-Content "./input.txt"

$content.ForEach({
        $o = $_ -match '(?<r1low>\d{2})-(?<r1high>\d{2}),(?<r2low>\d{2})-(?<r2high>\d{2})'
        $pairs = @{
            r1 = @{low = $Matches.r1low; high = $Matches.r1high }
            r2 = @{low = $Matches.r2low; high = $Matches.r2high }
        }
        if ((($pairs.r1.high)..($pairs.r1.low)) -in (($pairs.r2.high)..($pairs.r2.low)) {

        }
    })