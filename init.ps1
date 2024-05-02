function Link-Directory {
    param (
        [string]$sourceDir,
        [string]$destinationRoot = "$env:USERPROFILE\AppLocal\Local\nvim"
    )

    # 元のディレクトリからすべてのファイルを検索
    Get-ChildItem -Path $sourceDir -Recurse -File | Where-Object { $_.FullName -notmatch '\\.git\\' } | ForEach-Object {
        $sourceFile = $_.FullName
        $relativePath = $sourceFile.Substring($sourceDir.Length)

        $destinationPath = Join-Path -Path $destinationRoot -ChildPath $relativePath

        # 目的のディレクトリが存在しない場合は作成
        $destinationDir = Split-Path -Path $destinationPath
        if (-not (Test-Path -Path $destinationDir)) {
            New-Item -Path $destinationDir -ItemType Directory -Force | Out-Null
        }

        # シンボリックリンクを作成
        New-Item -ItemType SymbolicLink -Path $destinationPath -Target $sourceFile -Force
    }
}

# スクリプトを実行
Link-Directory -sourceDir '.config\nvim'

