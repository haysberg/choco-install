class ChocoProgram {
    [string]$DisplayName
    [string]$InstallCommand
    [bool]$installing
}

$global:Apps[ChocoProgram[]] = @(
    ChocoProgram::new("Spotify", "choco install spotify")
)