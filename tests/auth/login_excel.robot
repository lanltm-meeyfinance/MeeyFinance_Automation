*** Settings ***
Library     Browser
Library     DataDriver    ../../data/auth/login.xlsx

Resource    ../../resources/common.robot
Resource    ../../resources/keywords/login_keywords.robot

Test Setup       Open Browser To Login Page
Test Teardown    Close Browser Session

Test Template    Login Template


*** Test Cases ***
Login From Excel