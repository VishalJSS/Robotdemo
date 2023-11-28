*** Settings ***
Documentation   This is for elements in AMP Page
Library     SeleniumLibrary
Library     Collections

*** Variables ***
${Drag and Drop locator}=           xpath:(//div[@class='nxt-card nxt-card-code-editor']//p)[text()='Drag & drop']
${Email template page locator}=     xpath://div[@class='nxt-form-setup ng-star-inserted']
${email page container locator}=    id:outercontainer
${iFrame id}=                       id:ampEditor
${template list count locator}=     xpath://div[@class='empty-state-buttons']/a/span

*** Keywords ***

Click Drag and Drop email template
    click element    ${Drag and Drop locator}

Verify Email template page
    wait until page contains element    ${Email template page locator}
    ${page_header}=     get text        ${Email template page locator}
    log    ${page_header}

Check email template box
    wait until page contains element        ${iFrame id}
    select frame        ${iFrame id}
    sleep    30s

Check Options in Template
    ${template_list_count}=       get element count        ${template list count locator}
    ${count}=    convert to integer   ${template_list_count}
    log     ${count}

    @{template_list}        create list

    FOR    ${i}     IN RANGE    1     ${count}+1
        ${options}=     get text        xpath:(//div[@class='empty-state-buttons']/a/span)[${i}]
        log    ${options}
        append to list      ${template_list}        ${options}
    END

    log     ${template_list}

Check Email Template options
    Click Drag and Drop email template
    Verify Email template page
    Check email template box
    Check Options in Template





