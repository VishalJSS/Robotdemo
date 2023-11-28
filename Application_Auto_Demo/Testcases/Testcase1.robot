*** Settings ***
Documentation   HomePage Login
Library     SeleniumLibrary
Resource    ../PageObjects/PO_LoginPage.robot
Resource    ../PageObjects/PO_Homepage.robot
Resource    ../PageObjects/PO_AMPPage.robot
Resource    ../PageObjects/PO_Emailtemplate.robot
Resource    ../PageObjects/PO_EmailOptions.robot
Resource    ../PageObjects/PO_AMP_Layout.robot
#Test Setup      PO_LoginPage.Load Browser
#Test Teardown    PO_LoginPage.Quit Browser

*** Test Cases ***
Click on layout one column option in AMP email template
    [Tags]     Main
    Choose new canvas
    PO_EmailOptions.Move Pointer to Layout Option and get available options
    PO_AMP_Layout.Choose one column layout
    PO_AMP_Layout.Verify one column layout header
    PO_AMP_Layout.Verify one column layout summary
    PO_AMP_Layout.Verify one column layout readmore link
    PO_AMP_Layout.Verify Options in readmore link
    PO_AMP_Layout.Click basic options heading from readmore link
    #PO_AMP_Layout.click basic options paragraph from readmorelink
    #PO_EmailOptions.Move Pointer to Basic Element Option and get available options
    PO_LoginPage.Quit Browser


*** Keywords ***

Choose new canvas
    set selenium timeout    60s
    PO_LoginPage.Load Browser
    PO_LoginPage.Login using Credentials
    PO_Homepage.Load AMP Page
    PO_AMPPage.Choose Blank canvas
    PO_Emailtemplate.Check Email Template options
    #PO_EmailOptions.Check Layout Options
