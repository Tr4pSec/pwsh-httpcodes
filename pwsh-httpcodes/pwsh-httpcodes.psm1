function Search-httpcode {
    <#
  .SYNOPSIS
      Gets your specified http status code.
  .DESCRIPTION
      Get your specified http status code description and type.
  .EXAMPLE
      PS C:\> Search-httpcodes -Status 200
      Outputs "OK, Successful"
  .PARAMETER Status
      Should be an int .
  #>
    param (
      # Id of the album we want to get information on
      [Parameter(Mandatory)]
      [Int]
      $Status
    )

    $csv = Import-csv $PSScriptRoot\statuscodes.csv
    if ($Status -ne $null) {
        $csv | Where-Object {$_.status -eq "$Status"} | Select-Object "status_description","status_type" 
    }

  }