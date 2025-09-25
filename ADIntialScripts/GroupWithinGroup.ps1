# Import Active Directory module
Import-Module ActiveDirectory

# Define the OU to search in
$ouPath = "OU=BAL Group,DC=usabal,DC=com"

# Get all groups in the specified OU
$groups = Get-ADGroup -Filter * -SearchBase $ouPath

# Initialize array to hold results
$nestedGroups = @()

foreach ($group in $groups) {
    try {
        # Get members of the group
        $members = Get-ADGroupMember -Identity $group.DistinguishedName -ErrorAction Stop

        # Filter members that are groups
        $groupMembers = $members | Where-Object { $_.objectClass -eq 'group' }

        # If there are nested groups, add to results
        if ($groupMembers.Count -gt 0) {
            $nestedGroups += [PSCustomObject]@{
                ParentGroup = $group.Name
                NestedGroups = ($groupMembers | Select-Object -ExpandProperty Name) -join ', '
            }
        }
    }
    catch {
        Write-Warning "Skipping group due to error: $($group.Name)"
    }
}

# Output nested groups
$nestedGroups | Format-Table -AutoSize

# Export to CSV
$nestedGroups | Export-Csv -Path ".\NestedGroupsInOU.csv" -NoTypeInformation
