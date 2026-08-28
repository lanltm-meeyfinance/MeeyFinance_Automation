*** Settings ***
Library     Browser
Resource    ../pages/login_page.robot

*** Keywords ***

Login With Account
    [Arguments]     ${phone}    ${password}
    Input Phone Number      ${phone}
    Input Password          ${password}
    Click Login Button

Login Succesfully
    [Arguments]     ${phone}    ${password}
    Login With Account      ${phone}    ${password}
    Verify Login Success

Login Failed
    [Arguments]     ${phone}    ${password}
    Login With Account      ${phone}    ${password}
    Verify Login Error      ${message}
    
