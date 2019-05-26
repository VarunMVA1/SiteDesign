#add site design
$adminSiteUrl = "https://captureminds-admin.sharepoint.com"
$siteScriptFile = $PSScriptRoot + "\Site_Script.json"
$webTemplate = "64" #64 = Team Site, 68 = Communication Site, 1 = Groupless Team Site
$siteScriptTitle = "Custom Team Site Script"
$siteDesignTitle = "Custom Team Site Design"
$siteDesignDescription = "Custom team site design with multiple themes, external sharing enabled, join hub site and addin."
#$previewImageUrl = "\Unum\Site Assets\Unum_Logo_2019_Black_RGB_165_64.jpg" # if left empty, the default preview image will be used.
$designPackageId = "6142d2a0-63a5-4ba0-aede-d9fefca2c767" #Showcase
$cred = Get-Credential
Connect-SPOService $adminSiteUrl -Credential $cred
$siteScript = (Get-Content $siteScriptFile -Raw | Add-SPOSiteScript -Title $siteScriptTitle) | Select -First 1 Id
Add-SPOSiteDesign -SiteScripts $siteScript.Id -Title $siteDesignTitle -WebTemplate $webTemplate -Description $siteDesignDescription -PreviewImageUrl $previewImageUrl -DesignPackageId $designPackageId

#update site script
$siteScriptId = "5f51c27f-575e-4d95-80ee-2bbe645f3b00"
$siteScriptFile = "D:\ModrenSPFxCodesnippets\SiteDesign\Site_Script.json"
Set-SPOSiteScript -Identity $siteScriptId -Description "CaptureMinds Custom Site Script"  -Content (Get-Content $siteScriptFile -Raw)

#remove sitedesign
#Remove-SPOSiteDesign -Identity "137abc0c-f27e-48ef-bcdb-e1fa867d2ed0"
Get-SPOSiteDesign
#Add-SPOSiteDesign -SiteScripts "5f51c27f-575e-4d95-80ee-2bbe645f3b00" -Title "Capture Minds Custom TSD" -WebTemplate "64" -Description "Custom team site design with multiple themes, external sharing enabled, join hub site and addin." -PreviewImageUrl "" -DesignPackageId "6142d2a0-63a5-4ba0-aede-d9fefca2c767"