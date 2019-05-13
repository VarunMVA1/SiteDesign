#add site design
$adminSiteUrl = "https://captureminds-admin.sharepoint.com"
$siteScriptFile = $PSScriptRoot + "\Site_Script.json"
$webTemplate = "64" #64 = Team Site, 68 = Communication Site, 1 = Groupless Team Site
$siteScriptTitle = "Unum Team Site Script"
$siteDesignTitle = "Unum Team Site Design"
$siteDesignDescription = "Unum team site design with multiple themes, external sharing disabled, site logo, join hub site and addin."
$previewImageUrl = "\Unum\Site Assets\Unum_Logo_2019_Black_RGB_165_64.jpg" # if left empty, the default preview image will be used.
$designPackageId = "6142d2a0-63a5-4ba0-aede-d9fefca2c767" #Showcase
$cred = Get-Credential
Connect-SPOService $adminSiteUrl -Credential $cred
$siteScript = (Get-Content $siteScriptFile -Raw | Add-SPOSiteScript -Title $siteScriptTitle) | Select -First 1 Id
Add-SPOSiteDesign -SiteScripts $siteScript.Id -Title $siteDesignTitle -WebTemplate $webTemplate -Description $siteDesignDescription -PreviewImageUrl $previewImageUrl -DesignPackageId $designPackageId

#update site script
$siteScriptId = "5f51c27f-575e-4d95-80ee-2bbe645f3b00"
$siteScriptFile = "C:\Users\vatluri\Desktop\SiteScript\Site_Script.json"
Set-SPOSiteScript -Identity $siteScriptId -Content (Get-Content $siteScriptFile -Raw)

#remove sitedesign
Remove-SPOSiteDesign -Identity "d643c731-091d-4fce-a5d2-621fad934dfc"