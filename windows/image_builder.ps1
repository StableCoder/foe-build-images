Param(
    [string] $ImageName, # Core name of the image
    [switch] $NoCache, # --no-cache mode
    [switch] $Test, # Test the image
    [switch] $Push, # Pushes the image (must be logged in previously)
    [switch] $Remove # Removes/untags image after (for testing purposes)
)

if($NoCache) {
    $NO_CACHE="--no-cache"
} else {
    $NO_CACHE=""
}

try {
    # Determine variants
    $VARIANTS=$(ls *.Dockerfile)

    foreach($VARIANT in $VARIANTS) {
        $TAG=(Get-Item $VARIANT).BaseName
        $FILE="$TAG.Dockerfile"

        Write-Host ">> Working on ${ImageName}:${TAG} <<"

        Write-Host ">> docker build --pull $NO_CACHE -t ${ImageName}:${TAG} -f ${FILE} -m 8GB ." -ForegroundColor Yellow
        docker build --pull $NO_CACHE -t ${ImageName}:${TAG} -f ${FILE} -m 8GB .
        if ($LastExitCode -ne 0) { throw }

        if($Test) {
            Write-Host ">> docker run --rm ${ImageName}:${TAG}" -ForegroundColor Yellow
            docker run --rm ${ImageName}:${TAG}
            if ($LastExitCode -ne 0) { throw }
        }

        if($Push) {
            Write-Host ">> docker push ${ImageName}:${TAG}" -ForegroundColor Yellow
            docker push ${ImageName}:${TAG}
            if ($LastExitCode -ne 0) { throw }
        }

        if($Remove) {
            Write-Host ">> docker rmi ${ImageName}:${TAG}" -ForegroundColor Yellow
            docker rmi ${ImageName}:${TAG}
            if ($LastExitCode -ne 0) { throw }
        }
    }
}
catch
{
    Write-Host " >> Failed <<" -ForegroundColor Red
    exit 1
}
