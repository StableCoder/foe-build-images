Param(
    [string] $imagename, # Core name of the image
    [string] $suffix, # suffix for the tag
    [switch] $n, # --no-cache mode
    [switch] $test, # Test the image
    [switch] $push # Pushes the image (must be logged in previously)
)

try {
    # Blank
    Write-Host "`n >> Base Image" -ForegroundColor Yellow

    if($n) {
        Write-Host "docker build  --no-cache -t ${imagename}:windows${suffix} -m 4GB ." -ForegroundColor Yellow
        docker build  --no-cache -t ${imagename}:windows${suffix} -m 4GB .
        if($LastExitCode -ne 0) { throw }
    } else {
        Write-Host "docker build  -t ${imagename}:windows${suffix} -m 4GB ." -ForegroundColor Yellow
        docker build  -t ${imagename}:windows${suffix} -m 4GB .
        if($LastExitCode -ne 0) { throw }
    }

    if($test) {
        Write-Host "docker run --rm ${imagename}:windows${suffix}" -ForegroundColor Yellow
        docker run --rm ${imagename}:windows${suffix}
        if($LastExitCode -ne 0) { throw }
    }
    if($push) {
        Write-Host "docker push ${imagename}:windows${suffix}" -ForegroundColor Yellow
        docker push ${imagename}:windows${suffix}
        if($LastExitCode -ne 0) { throw }
    }
}
catch
{
    Write-Host " >> Script Failed" -ForegroundColor Red
    
    exit 1
}
