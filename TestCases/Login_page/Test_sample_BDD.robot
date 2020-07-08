*** Settings ***

Library  SeleniumLibrary
Resource  ../../Resorces/Reg_Resource.robot


*** Variables ***


*** Test Cases ***
Test Cases in BDD
    Given Browser_Start_Maximize
    When Create Folder at RunTime
    Then Get_Title_Close_Browser
