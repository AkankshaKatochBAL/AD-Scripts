# Data points from analyzing Active Directory.  

Currently performed research on groups only, in current investigation Users and Computers are not included. 

> Pointing out main focus on **OU =  Distribution and Security under BAL group**

## Data Regarding Nested Groups

**Questions:**

I found total **597** Groups empty in BAL.com domain.

**How many empty Distribution Group under BALGroup OU?**

- 350

**How many empty Security group under BALGroup OU?**

- 114

**How many Groups are nested with in other nested groups?**

- 60 

**How many OU = distributed Groups are nested?**

- 36

**How many OU = Security Groups are nested?**

- 8

---
--- 

## Data Regarding Last Modified or used. 

**Set threshold for inactivity (e.g., 90 days)
$inactiveDays = 90**

**Comparison used: ($group.whenChanged -lt $cutoffDate)**

**How many inactive groups year wise comparison?**

| Year | Count |
|------|-------|
| 2018 | 99    |
| 2019 | 49    |
| 2020 | 14    |
| 2021 | 206   |
| 2022 | 27    |

Total records: 572

---
---

## Question Regarding LDAP clean Up policies:

**How do we delete these empty Groups? Any script is running? If yes where is the Script?**

- Waiting on Tanbir

> Note: AWS one are getting modified currently, we can ignore. 

**Discuss which groups we can totally remove after confirmation?**

- With whom this discussion should happen?

What are the parameters to check for the clean up in security as well as distribution list. 

- Check with Tanbir

Who perform it is it automated process or manually performed by someone. 

- Need to check with Tanbir. 

