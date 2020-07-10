*** Settings ***

Library    SeleniumLibrary
Library    ../ExternalKeywords/UserKeywords.py

*** Variables ***



*** Keywords ***
Browser_Start_Maximize
    [Documentation]    This keyword opens the browser and maximize the window
    [Arguments]  ${URL}  ${Browser}
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window



Page_title
    ${title} =  Get Title
    [Return]  ${title}


Get_Title_Close_Browser
    ${title}=  Get Title
    Log  ${title}
    Close Browser

Before Each Test Suite
    Log  Before Each Test Suite

After Each Test Suite
    Log  After Each Test Suite

Create Folder at RunTime
    [Arguments]  ${Folder}  ${Subfolder}
    create_folder  ${Folder}
    create_subfolder  ${Subfolder}
    Log  "Task done successfully"

Create_Username
    [Arguments]  ${name}  ${domain}
    ${user}=  username  ${name}  ${domain}
