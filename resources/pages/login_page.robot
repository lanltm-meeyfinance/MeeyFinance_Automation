*** Settings ***
Library     Browser
Resource        ../../variables/locator.robot

*** Keywords ***

Input Phone Number
    [Arguments]     ${phone}
    Fill Text   ${TXT_PHONE_NUMBER}    ${phone}

Input Password
    [Arguments]     ${password}
    Fill Text   ${TXT_PASSWORD}    ${password}

Click Login button
    Click   ${BTN_LOGIN}

Click Show Password
    Click   ${BTN_SHOW_PW}

Verify Login Success
    Wait For Elements State
    ...     ${LBL_DASHBOARD}
    ...     state=visible

Verify Login Error
    [Arguments]     ${messsage}
    Wait For Elements State
    ...     text=${messsage}
    ...     state=visible
