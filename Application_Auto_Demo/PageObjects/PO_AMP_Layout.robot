*** Settings ***
Documentation   This is for elements in Email Options
Library     SeleniumLibrary
Library     Collections
Library     String

*** Variables ***
${inner_iframe_locator}=                id:iframe1
${layout_onecolumn_locator}=            xpath:(//div[@id='popup-grid-section-box']//li[@data-section='Base'])[2]
${layout_onecolumn_header_locator}=     xpath:(//div[@class='smt-element']/p)[1]
${layout_onecolumn_summary_locator}=    xpath:(//div[@class='smt-element']/p)[2]
${layout_onecolumn_readmore_locator}=   xpath://div[@class='smt-element']//a[starts-with(@class, 'cta_btn')]
#${Add Inner element locator}=           xpath://a[@class='add-inner-non-form-elements']
${new_inner_element_locator}=           xpath://div[@id='iframe-layer']//a[@class='add-inner-non-form-elements']
${clone_button_locator}=                xpath://div[@class='all-icons-inner-non-form-elements']//a[@class='clone-btn']
${up_button_locator}=                   xpath://div[@class='all-icons-inner-non-form-elements']//a[@class='up-btn']
${delete_button_locator}=               xpath://div[@class='all-icons-inner-non-form-elements']//a[@class='delete-btn']
${inner element flex locator}=          xpath://div[@class='all-icons-inner-non-form-elements']
${close inner element locator}=         xpath://a[@class='close-inner-non-form-elements']
${heading_option_read}=                 xpath://div[@id='inner-non-form-section-box']//li[@data-type='html/innerheading']
${heading_text_locator}=                xpath://div[@class='smt-element tinymce-heading']/h1
${paragraph_option_read}=               xpath://div[@id='inner-non-form-section-box']//li[@data-type='html/innerparagraph']
${paragraph_text_locator}=              xpath://div[@class='smt-column']//p[@class='tinymce-body']

${iFrame id}=                       id:ampEditor

${header_detail}=           Blog Article
${summary detail}=          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet integer ut nulla tincidunt felis elit id ac.
${readmore_text}=           Read more

*** Keywords ***
Choose one column layout
    mouse over                  ${layout_onecolumn_locator}
    click element               ${layout_onecolumn_locator}
    sleep       30s
Verify one column layout header
    select frame                ${inner_iframe_locator}
    ${header}=      get text            ${layout_onecolumn_header_locator}
    should be equal as strings    ${header}         ${header_detail}
Verify one column layout summary
    ${summary}=     get text            ${layout_onecolumn_summary_locator}
    should be equal as strings    ${summary}        ${summary detail}
Verify one column layout readmore link
    ${readmore}=    get text            ${layout_onecolumn_readmore_locator}
    should be equal as strings      ${readmore}     ${readmore_text}
Verify Options in readmore link
    #mouse over                          ${layout_onecolumn_readmore_locator}
    click element            ${layout_onecolumn_readmore_locator}
    unselect frame
    select frame            ${iFrame id}
    page should contain element         ${new_inner_element_locator}
    page should contain element         ${clone_button_locator}
    page should contain element         ${up_button_locator}
    page should contain element         ${delete_button_locator}
    click element           ${new_inner_element_locator}
    sleep    5s

Click basic options heading from readmore link
    click element       ${heading_option_read}
    sleep      3s
    select frame                    ${inner_iframe_locator}
    page should contain element         ${heading_text_locator}
    ${header}=          get text        ${heading_text_locator}
    log     ${header}

click basic options paragraph from readmorelink
    click element            ${layout_onecolumn_readmore_locator}
    sleep       3s
    #select frame            ${iFrame id}
    click element           ${new_inner_element_locator}
    sleep       3s
    click element       ${paragraph_option_read}
    select frame        ${inner_iframe_locator}
    page should contain element         ${paragraph_text_locator}
    ${paragraph_text}=      get text        ${paragraph_text_locator}
    log     ${paragraph_text}











