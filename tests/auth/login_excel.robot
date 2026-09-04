*** Settings ***
Library     Browser
Library    DataDriver
...    file=../../data/auth/login.xlsx
...    sheet_name=Sheet1

Resource    ../../resources/common.robot
Resource    ../../resources/keywords/login_keywords.robot

Test Setup      Open Browser To Login Page
Test Teardown   Close Browser Session
Test Template   Login Template


*** Test Cases ***
Login From Excel

*** Keywords ***
Login Template
    [Arguments]
    ...    ${description}
    ...    ${phone}
    ...    ${password}
    ...    ${expected}
    ...     ${error_field}
    ...    ${message}
    Run Login Template
    ...    ${description}
    ...    ${phone}
    ...    ${password}
    ...    ${expected}
    ...     ${error_field}
    ...    ${message}