*** Settings ***
Documentation   This is for elements in Email Options
Library     SeleniumLibrary
Library     Collections

*** Variables ***
${Layout option locator}=               xpath:(//div[@class='empty-state-buttons']/a/span)[1]
${Basic element option locator}=        xpath:(//div[@class='empty-state-buttons']/a/span)[2]
${Form option locator}=                 xpath:(//div[@class='empty-state-buttons']/a/span)[3]
${Widgets option locator}=              xpath:(//div[@class='empty-state-buttons']/a/span)[4]
${Layout count}=                        xpath://div[@id='popup-grid-section-box']//li[@data-section='Base']
${Basic element count}=                 xpath://div[@id='popup-basic-section-box']//li[@data-section='Base']
${form count}=                          xpath://div[@id='popup-form-section-box']//li[@data-section='Custom']
${widget count}=                        xpath://div[@id='popup-widgets-section-box']//li[@data-section='Base']

*** Keywords ***
Move Pointer to Layout Option and get available options
    set selenium timeout    80s
    mouse over      ${Layout option locator}
    ${layout_option_counts}=     get element count       ${Layout count}
    log     ${layout_option_counts}
    ${layout_option_count}=     convert to integer      ${layout_option_counts}

    should not be equal as integers     ${layout_option_count}          0

    @{layout_options}       create list

    FOR    ${i}     IN RANGE    2       ${layout_option_count}+1
        ${temp}=    get element attribute     xpath:(//div[@id='popup-grid-section-box']//li[@data-section='Base'])[${i}]       data-type
        log     ${temp}
        append to list      ${layout_options}           ${temp}
    END

    log     ${layout_options}


Move Pointer to Basic Element Option and get available options
    set selenium timeout    80s
    mouse over      ${Basic element option locator}
    ${basicelement_option_counts}=     get element count       ${Basic element count}
    log     ${basicelement_option_counts}
    ${basicelement_option_count}=     convert to integer      ${basicelement_option_counts}

    should not be equal as integers     ${basicelement_option_count}          0

    @{basicelement_options}       create list

    FOR    ${i}     IN RANGE    2       ${basicelement_option_count}+1
        ${temp}=    get element attribute     xpath:(//div[@id='popup-basic-section-box']//li[@data-section='Base'])[${i}]       data-type
        log     ${temp}
        append to list      ${basicelement_options}           ${temp}
    END

    log     ${basicelement_options}

Move Pointer to Form Option and get available options
    set selenium timeout    80s
    mouse over      ${Form option locator}
    ${form_option_counts}=     get element count       ${form count}
    log     ${form_option_counts}
    ${form_option_count}=     convert to integer      ${form_option_counts}

    should not be equal as integers     ${form_option_count}          0

    @{form_options}       create list

    FOR    ${i}     IN RANGE    2       ${form_option_count}+1
        ${temp}=    get element attribute     xpath:(//div[@id='popup-form-section-box']//li[@data-section='Custom'])[${i}]       data-type
        log     ${temp}
        append to list      ${form_options}           ${temp}
    END

    log     ${form_options}

Move Pointer to Widget Option and get available options
    set selenium timeout    80s
    mouse over      ${Widgets option locator}
    ${widget_option_counts}=     get element count       ${widget count}
    log     ${widget_option_counts}
    ${widget_option_count}=     convert to integer      ${widget_option_counts}

    should not be equal as integers     ${widget_option_count}          0

    @{widget_options}       create list

    FOR    ${i}     IN RANGE    2       ${widget_option_count}+1
        ${temp}=    get element attribute     xpath:(//div[@id='popup-widgets-section-box']//li[@data-section='Base'])[${i}]       data-type
        log     ${temp}
        append to list      ${widget_options}           ${temp}
    END

    log     ${widget_options}

Check Layout Options
    Move Pointer to Layout Option and get available options
    Move Pointer to Basic Element Option and get available options
    Move Pointer to Form Option and get available options
    Move Pointer to Widget Option and get available options
    sleep       10s