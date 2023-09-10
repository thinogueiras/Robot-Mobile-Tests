*** Settings ***
Documentation              Base resources

Library                    AppiumLibrary
Library                    libs/extend.py

Resource                   helpers.resource

*** Variables ***
${START}                   QAX

*** Keywords ***
Start Session
    Open Application       http://localhost:4723
    ...                    alias=Yodapp
    ...                    platformName=Android
    ...                    deviceName=Android Emulator
    ...                    automationName=UIAutomator2
    ...                    app=${EXECDIR}/app/yodapp-beta.apk
    ...                    udid=emulator-5554
    # ...                    udid=RQ8N20A2PXK
    ...                    autoGrantPermissions=true

    Get Started

Get Started
    Click By Text              ${START}

Navigate To
    [Arguments]                ${menu_item_text}

    ${menu}                    Set Variable        xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Click By Element           ${menu}

    ${menu_item}               Set Variable        xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="${menu_item_text}"]

    Click By Element           ${menu_item}

Go To Item
    [Arguments]                ${item}        ${text}

    Click By Text                     ${item}
    Wait Until Screen Contains        ${text}

Finish Session
    Take Screenshot
    Close Application

Take Screenshot
    Sleep    1
    Capture Page Screenshot