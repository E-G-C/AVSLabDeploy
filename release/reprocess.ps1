$SDDC_NUMBER = 

$FAILED_LABS = @() # EXAMPLE $NUMBER_OF_LABS = @(5,8,9,10)

foreach ($lab_number in $FAILED_LABS) {
 
    Write-Output "############# RE-PROCESSING LAB#$lab_number #############"
   
    .\labdeploy.exe -config .\configs\SDDC$SDDC_NUMBER-config.yml -lab .\labs\SDDC$SDDC_NUMBER\lab$lab_number.yml | Tee-Object .\logs\lab$lab_number.log
    # In case you need to cleanup use  -cleanuplab option instead of -lab
}

