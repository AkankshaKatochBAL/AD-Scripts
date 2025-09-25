# Import Active Directory module
Import-Module ActiveDirectory

# Get all groups in the domain
$groups = Get-ADGroup -Filter *

# Initialize arrays
$emptyGroups = @()
$skippedGroups = @()

foreach ($group in $groups) {
    try {
        # Get group members
        $members = Get-ADGroupMember -Identity $group.DistinguishedName -ErrorAction Stop

        # Check if the group has no members
        if (!$members) {
            $emptyGroups += $group
        }
    }
    catch {
        # Log skipped group
        $skippedGroups += $group
        Write-Warning "Skipping group due to error: $($group.Name)"
    }
}

# Output empty groups
$emptyGroups | Select-Object Name, DistinguishedName | Format-Table -AutoSize

# Export empty groups to CSV
$emptyGroups | Select-Object Name, DistinguishedName | Export-Csv -Path ".\EmptyGroups.csv" -NoTypeInformation

# Export skipped groups to CSV
$skippedGroups | Select-Object Name, DistinguishedName | Export-Csv -Path ".\SkippedGroups.csv" -NoTypeInformation
