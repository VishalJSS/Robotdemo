*** Settings ***
Documentation       Data to be used in Home Page
Library     SeleniumLibrary

*** Variables ***
${contenttab_link_locator}=         xpath://a[@id='sit_3']
${content_verification_locator}=    xpath://ul[@class='breadcrumb']/li/a
${AMP_Template_locator}=            xpath://a[contains(@href, 'amptemplates')]
${AMP_Page_locator}=                xpath://div[@class='nxt-apn-template-options']/p
${AMPTemplatepage}=                 Create a new AMP template or select from the gallery

*** Keywords ***

Click Content Tab
    click link          ${contenttab_link_locator}

Verify Loaded Content Tab
    wait until page contains element        ${content_verification_locator}
    ${content_text}=            get text        ${content_verification_locator}
    log     ${content_text}

Click AMP Template Tab
    click link          ${AMP_Template_locator}

Verify AMP Template Tab
    wait until page contains element        ${AMP_Page_locator}
    ${AMPoption}=       get text            ${AMP_Page_locator}
    log     ${AMPoption}
    should be equal as strings      ${AMPoption}        ${AMPTemplatepage}

Load AMP Page
    Click Content Tab
    Verify Loaded Content Tab
    Click AMP Template Tab
    Verify AMP Template Tab