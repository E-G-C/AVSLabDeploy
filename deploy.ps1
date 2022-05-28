$SDDC_NUMBER = 5

$NUMBER_OF_LABS = 10



Write-Output  '########### Generating new labs Ids #########################'
.\labdeploy -id -d .\labs\

Write-Output '############  Bootstrapping the Config #######################'
.\labdeploy.exe -bootstrap -config .\configs\SDDC$SDDC_NUMBER-config.yml | Tee-Object .\logs\bootstrap.log 




for (($i = 1); $i -lt $NUMBER_OF_LABS + 1; $i++) {
 
    Write-Output "############# CREATING LAB#$i #############"

    #.\labdeploy.exe -lab .\labs\SDDC$SDDC_NUMBER \lab01.yml | tee .\logs\lab01.log
    Write-Output .\labdeploy.exe -config .\configs\SDDC$SDDC_NUMBER-config.yml -lab .\labs\SDDC$SDDC_NUMBER\lab$i.yml | Tee-Object .\logs\lab$i.log
}
