
# Import Active Directory module
Import-Module ActiveDirectory
# Get all groups in the domain
$groups = Get-ADGroup -Filter *

# Initialize an array to hold empty groups
$emptyGroups = @()

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
        Write-Warning "Skipping group due to error: $($group.Name)"
    }
}

# Output empty groups
$emptyGroups | Select-Object Name, DistinguishedName | Format-Table -AutoSize
