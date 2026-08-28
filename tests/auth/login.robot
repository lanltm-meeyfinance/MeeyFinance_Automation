*** Settings ***
Resource    ../../resources/common.robot
Resource   ../../resources/keywords/login_keywords.robot
Resource   ../../variables/account.robot

Test Setup      Open Browser To Login Page
Test Teardown   Run Keywords
...     Capture Screenshot If Test Failed
...     AND
...     Close Browser Session

*** Test Cases ***
TC_Login_001_Login_Success
    [Documentation]     Verify customer can login successfully
    [Tags]      smoke       regression      login
    Login With Account      ${VALID_PHONE}  ${VALID_PASSWORD}

    Wait For Elements State
    ...     text=Trang chủ
    ...     state=visible

TC_Login_002_Login_Incorrect_Password
    [Documentation]     Verify customer cannot login successfully with incorrect password
    [Tags]      smoke             login
    Login With Account      ${VALID_PHONE}  ${INVALID_PASSWORD}

    Wait For Elements State
    ...     text=Mật khẩu không chính xác. Vui lòng kiểm tra và thử lại
    ...     state=visible

TC_Login_003_Login_Invalid_Phone
    [Documentation]     Verify customer cannot login successfully with invalid phone number

    [Tags]      smoke      login
    Login With Account      ${INVALID_PHONE}    ${VALID_PASSWORD}

    Wait For Elements State
    ...     text=Số điện thoại không hợp lệ
    ...     state=visible

TC_Login_004_Login_Not_Exist_Phone
    [Documentation]     Verify customer cannot login successfully with not exists phone number

    [Tags]      smoke             login
    Login With Account      ${NOTEXIST_PHONE}    ${VALID_PASSWORD}

    Wait For Elements State
    ...     text=Số điện thoại không tồn tại. Vui lòng kiểm tra lại
    ...     state=visible
