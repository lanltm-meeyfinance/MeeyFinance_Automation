*** Settings ***
Library     Browser

*** Test Cases ***
Search Robot framework
    New Browser     chromium    headless=False
    New Page    https://demoqa.com/text-box

    Fill Text   css=input#userName   Robot Framework Browser Library
    Fill Text   css=input#userEmail   robotfw@gmail.com
    Fill Text   css=textarea#currentAddress   Robot Framework Browser Library Address
    Fill Text   css=textarea#permanentAddress   Robot Framework Browser Library Permanent Address

    Click   text=Submit

    Wait For Elements State
    ...     id=name
    ...     state=visible

    ${path}=    Take Screenshot
    ...    filename=${CURDIR}/../../screenshots/demoqa_form.png

    Log To Console    Screenshot saved: ${path}

    Close Browser