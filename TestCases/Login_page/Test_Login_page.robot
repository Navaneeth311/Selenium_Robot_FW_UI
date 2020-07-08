*** Settings ***

Library  SeleniumLibrary
Resource  ../../Resorces/Reg_Resource.robot
Test Setup  Browser_Start_Maximize  ${URL}  ${Browser}
Test Teardown  Get_Title_Close_Browser



*** Variables ***
${Browser}    Chrome
${URL}    https://my.asos.com/identity/register


*** Test Cases ***
TC_001 Valid Login
    [Tags]  Regression
    [Documentation]    This is a sample test caases for registraation page
    [Timeout]  1mins 2s      # Show time out if execution exceeds the given time
    Create Folder at RunTime  Mail_folder  Sub_Folder
    ${Res} =    Page_title
    Log  ${Res}
    Click Button  id:sign-in
    ${username}=  create_username  navaneeth  @example.com
    signin details  ${username}  password
    Click Button  id:signin
    ${current_URL}=  Get Location
    Log  ${current_URL}
    ${page_source}=  Get Source
    Log  ${page_source}


*** Keywords ***
SignIn Details
    [Arguments]  ${username}  ${password}
    Input Text  name:Username  ${username}
    Input Text  id:Password  ${password}