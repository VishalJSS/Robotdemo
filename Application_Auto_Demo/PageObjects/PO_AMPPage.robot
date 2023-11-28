*** Settings ***
Documentation   This is for elements in AMP Page
Library     SeleniumLibrary
Library     Collections

*** Variables ***
${AMP_Page_locator}=                xpath://div[@class='nxt-apn-template-options']/p
${AMP_emailtemplate_locator}=       xpath://h5[@class='nxt-large nxt-bold mb-2']
${AMP_Page_header}=                 Select template
${Blank_canvas_selecter}=           xpath://div[@class='nxt-apn-template-options']/p
${Blank_canvas_tab}=                Blank Canvas
${Template_editor}=                 xpath://div[@class='nxt-side-drawer-header']/h3
${Template_title}=                  Select template editor
${email editor option}=             xpath://p[@class='nxt-regular nxt-semibold mb-0']
${Drag and Drop locator}=           xpath:(//div[@class='nxt-card nxt-card-code-editor']//p)[text()='Drag & drop']
${Code editor locator}=             xpath://div[@class='nxt-card nxt-card-code-editor']//p[text()='Code editor']

*** Keywords ***
click to select template
    #wait until page contains element        ${AMP_Page_locator}
    click element      ${AMP_Page_locator}

Verify AMP email template
    wait until page contains element        ${AMP_emailtemplate_locator}
    ${AMP_header}=      get text        ${AMP_emailtemplate_locator}
    #log     ${AMP_header}
    #should be equal as strings          ${AMP_header}       ${AMP_Page_header}

Verify Blank Canvas Option
    wait until page contains element        ${Blank_canvas_selecter}
    ${Blank_canvas}=        get text        ${Blank_canvas_selecter}
    log     ${Blank_canvas}
    should be equal as strings      ${Blank_canvas}             ${Blank_canvas_tab}

Click blank canvas option
    wait until page contains element        ${Blank_canvas_selecter}
    click element            ${Blank_canvas_selecter}

Verify Select template editor
    wait until page contains element        ${Template_editor}
    ${select_template_title}=       get text        ${Template_editor}
    log     ${select_template_title}
    should be equal as strings      ${select_template_title}            ${Template_title}

Check Drag and Drop and Code editor
    wait until page contains element       ${email editor option}
    ${Drag and Drop Option}=        get text                ${Drag and Drop locator}
    log     ${Drag and Drop Option}
    ${Code editor option}=         get text                 ${Code editor locator}
    log    ${Code editor Option}

Choose Blank canvas
    click to select template
    Verify AMP email template
    Verify Blank Canvas Option
    Click blank canvas option
    Verify Select template editor
    Check Drag and Drop and Code editor
