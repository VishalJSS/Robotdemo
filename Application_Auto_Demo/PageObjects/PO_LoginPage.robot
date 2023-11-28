*** Settings ***
Documentation   This is for elements in Login Page
Library     SeleniumLibrary
Resource    ../DataObjects/Data_LoginPage.robot

*** Variables ***
${AccountName_Locator}=     id:accountName
${UserName_Locator}=        id:userName
${Password_Locator}=        id:password
${LoginButton_Locator}=     id:btnLogin
${Homepage_Locator}=        xpath://nav[@class='nxt-sidenav-list']

*** Keywords ***
Load Browser
    Open Browser        about:blank                 ${BROWSER}

Open URL
    GO TO           ${URL}

Login AccountName
    input text          ${AccountName_Locator}      ${AccountName}

Login UserName
    input text          ${UserName_Locator}         ${UserName}

Login Password
    input text          ${Password_Locator}         ${Password}

Click Login Button
    click button        ${LoginButton_Locator}

Verify Loaded Homepage
    wait until page contains element    ${Homepage_Locator}

Quit Browser
    Close Browser


Login using Credentials
    Open URL
    maximize browser window
    Set Browser Implicit Wait   15s
    Login AccountName
    Login UserName
    Login Password
    Click Login Button
    Verify Loaded Homepage
