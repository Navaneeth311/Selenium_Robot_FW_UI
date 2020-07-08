*** Settings ***

Library  SeleniumLibrary
Resource  ../../Resorces/Reg_Resource.robot
Library    ../../ExternalKeywords/locators.py
#test timeout  2mins 5s
Suite Setup  Before Each Test Suite
Test Setup  Browser_Start_Maximize  ${URL}  ${Browser}
Test Teardown  Get_Title_Close_Browser
Suite Teardown  After Each Test Suite
Default Tags  Default
Force Tags  All_TC


*** Variables ***
${Browser}    Chrome
${URL}    https://my.asos.com/identity/register



*** Test Cases ***
TC_001 Valid Registration
    [Tags]  Smoke
    [Documentation]    This is a sample test caases for registraation page
    [Timeout]  1mins 2s      # Show time out if execution exceeds the given time
    ${Res} =    Page_title
    Log  ${Res}
    Set Selenium Speed  1seconds
    ${email}=    Read Elements Locators  Registration.email_textbox_name
    Input Text  name:${email}  navaneeth@example.com
    ${firstName}=  Read Elements Locators  Registration.firstname_textbox_xpath
    Input Text  xpath:${firstName}  Navaneeth
    Input Text  id:LastName  S
    Clear Element Text  xpath://input[@id='LastName']
    Input Text  xpath://input[@type='password']  password
    Enter DOB  5  July  2001
    Click Element  xpath://div[@id='male']
    Select Checkbox  id:newnessLabel
    Click Button  id:register

TC_002 Check link navigaation
    [Tags]  Smoke  Sanity
    [Documentation]    To check the link navigation works properly
    ${speed}=  get selenium speed
    Log  ${speed}
    ${text}=  Get Text  xpath://a[text()='Tell me more about these...']
    Log  ${text}
    Click Link  xpath://a[text()='Tell me more about these...']
    Click Element  xpath://a[@aria-label='close']


*** Keywords ***
Enter DOB
    [Arguments]  ${BirthDay}  ${BirthMonth}  ${BirthYear}
    Select From List By Index  name:BirthDay  ${BirthDay}
    Select From List By Label  id:BirthMonth  ${BirthMonth}
    Select From List By Value  name:BirthYear  ${BirthYear}
    ${month}=  Get Selected List Label  id:BirthMonth
    Log  ${month}
    ${all_months}=  Get List Items  id:BirthMonth
    Log  ${all_months}

Read Elements Locators
    [Arguments]  locator_name
    ${result}=    read_locators  locator_name
    [Return]    ${result}
