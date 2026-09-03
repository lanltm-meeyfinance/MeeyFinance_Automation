*** Settings ***
Resource    ../../resources/common.robot
Resource   ../../resources/keywords/login_keywords.robot
Resource   ../../variables/account.robot
Resource    ../../data/auth/login_list.robot

Test Setup      Open Browser To Login Page
Test Teardown   Run Keywords
...     Capture Screenshot If Test Failed
...     AND
...     Close Browser Session

*** Test Cases ***
TC_Login_001_Login_Success
    [Documentation]     Verify customer can login successfully
    [Tags]      smoke       regression      login
    Login Succesfully      
    ...     ${VALID_ACCOUNT.phone}
    ...     ${VALID_ACCOUNT.password}

TC_Login_002_Login_Incorrect_Password
    [Documentation]     Verify customer cannot login successfully with incorrect password
    [Tags]      smoke             login
    Login Failed     
    ...     ${WRONG_PASSWORD_ACCOUNT.phone}
    ...     ${WRONG_PASSWORD_ACCOUNT.password}
    ...     ${WRONG_PASSWORD_ACCOUNT.expected}

TC_Login_003_Login_Invalid_Phone
    [Documentation]     Verify customer cannot login successfully with invalid phone number

    [Tags]      smoke      login
    Login Failed      
    ...     ${INVALID_PHONE}
    ...    ${VALID_PASSWORD}
    ...     Số điện thoại không hợp lệ

TC_Login_004_Login_Not_Exist_Phone
    [Documentation]     Verify customer cannot login successfully with not exists phone number

    [Tags]      smoke             login
    Login Failed      
    ...     ${NOTEXIST_PHONE}
    ...    ${VALID_PASSWORD}
    ...     Số điện thoại không tồn tại. Vui lòng kiểm tra lại

Loop Phone Number
    FOR      ${phone}    IN  @{PHONE_LIST}
        Log To Console      ${phone}
    END

