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
    [Arguments]     ${phone}    ${password}     ${message}
    Login With Account      ${phone}    ${password}
    Verify Login Error      ${message}
    
Login Template
[Arguments]
    ...    ${tc_id}
    ...    ${description}
    ...    ${phone}
    ...    ${password}
    ...    ${expected}
    ...    ${message}

    Log To Console    ===== ${tc_id} : ${description} =====

    Login With Account
    ...    ${phone}
    ...    ${password}

    IF    '${expected}' == 'SUCCESS'
        Verify Login Success
    ELSE
        Verify Login Error Message
        ...    ${message}
    END