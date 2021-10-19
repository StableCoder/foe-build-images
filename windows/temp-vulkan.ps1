try {
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
wget https://sdk.lunarg.com/sdk/download/1.2.189.0/windows/VulkanSDK-1.2.189.0-Installer.exe?Human=true -OutFile VulkanSDK.exe -UseBasicParsing
.\VulkanSDK.exe /S /D=C:\VulkanSDK | Out-Null
Remove-Item VulkanSDK.exe
Remove-Item -Path C:\VulkanSDK\Bin32 -Recurse -ErrorAction SilentlyContinue

[Environment]::SetEnvironmentVariable( "CUSTOM_INCLUDE", [System.Environment]::GetEnvironmentVariable("CUSTOM_INCLUDE","Machine") + ";C:\VulkanSDK\Include", [System.EnvironmentVariableTarget]::Machine )
[Environment]::SetEnvironmentVariable( "CUSTOM_LIB", [System.Environment]::GetEnvironmentVariable("CUSTOM_LIB","Machine") + ";C:\VulkanSDK\lib", [System.EnvironmentVariableTarget]::Machine )
}
catch
{
    exit 1
}
