$SDDC_NUMBER = 
$NUMBER_OF_LABS = 10

cd c:\LabDeploy\

Write-Output  '########### Generating new labs Ids #########################'
.\labdeploy -id -d .\labs\

Write-Output '############  Bootstrapping Config file  #######################'
.\labdeploy.exe -bootstrap -config .\configs\SDDC$SDDC_NUMBER-config.yml | Tee-Object .\logs\bootstrap.log 



for (($i = 1); $i -lt $NUMBER_OF_LABS + 1; $i++) {
 
    Write-Output "############# CREATING LAB#$i #############"
   
    .\labdeploy.exe -config .\configs\SDDC$SDDC_NUMBER-config.yml -lab .\labs\SDDC$SDDC_NUMBER\lab$i.yml | Tee-Object .\logs\lab$i.log
}
