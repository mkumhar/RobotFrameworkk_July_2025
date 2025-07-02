*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://testautomationpractice.blogspot.com
${url1}     https://www.redbus.in/
${browser}  Chrome

*** Test Cases ***
Testing the Launch of browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text  xpath://input[@id='name']   Manoj kumhar
    Input Text  xpath://input[@id='email']   Manojkumar315@gmail.com
    Input Text  xpath://input[@id='phone']   1234567890
    Input Text  xpath://textarea[@id='textarea']    B 422 jaipur
    click element   xpath://input[@id="male"]
    click element   xpath://input[@id='wednesday']
    Log to Console  This Test case Got Passed
    Log     This Test case Got Passed1
    Close Browser

Testing the Title of the browser
    Open Browser    ${url1}    ${browser}
    Maximize Browser Window
    ${title}    get title
    title should be     Bus Ticket Booking Online at Cheapest Price with Top Bus Operators- redBus
    Log to Console  ${title}
    Log     ${title}
    Close Browser

Testing the radio button,dropdown,checkbox
    open browser    ${url}  ${browser}
    maximize browser window
    select radio button     gender      male
    sleep   2
    select radio button     gender      female
    sleep   2
    select checkbox     id:monday
    select checkbox     id:thursday
    sleep   3
    unselect checkbox   id:monday
    sleep   2
    select from list by label   id:country      India
    sleep   2
    select from list by label   id:colors     Blue
    sleep   2
    unselect from list by label   id:colors     Blue
    sleep   2
    select from list by index   id:colors     3
    sleep   2
    unselect from list by index   id:colors      3
    sleep   2
    close browser

Testing with alert element
    open browser    ${url}  ${browser}
    maximize browser window
    click element   xpath://button[@id="alertBtn"]
    handle alert    accept
    sleep   2
    click element   xpath://button[@id="confirmBtn"]
    handle alert    dismiss
    sleep   2
    click element   xpath://button[@id="promptBtn"]
    handle alert    accept
    sleep   2
    ${title_validation}     get title
    log to console      ${title_validation}
    Should Be Equal As Strings  ${title_validation}     Automation Testing Practice
    sleep   2

Handling Frames and screenshot
    Go to   https://www.globalsqa.com/demo-site/frames-and-windows/#iFrame
    Select Frame    xpath://iframe[@name='globalSqa']
    Wait Until Element is visible   xpath://span[text()='Trainings']    timeout=10s
    Click Element   xpath://span[text()='Trainings']
    Unselect Frame
    capture element screenshot      xpath://iframe[@name='globalSqa']   /image1.png
    capture page screenshot        /image2.png
    close browser


Testing of window handling
    open browser    ${url}  ${browser}
    maximize browser window
    click element   xpath://button[@onclick="myFunction()"]
    switch window   new
    ${title_new}    get title
    log to console  ${title_new}
    capture page screenshot  /title_new.png
    sleep   2
    switch window   main
    ${title_main}    get title
    log to console  ${title_main}
    capture page screenshot  /title_main.png
    sleep   2
    close browser

Handling searching operation
     open browser    ${url}  ${browser}
     maximize browser window
     input text     //input[@id="Wikipedia1_wikipedia-search-input"]        Sachin
     click element  xpath://input[@class="wikipedia-search-button"]
     wait until element is visible      xpath://div[@id="Wikipedia1_wikipedia-search-results"]//a
     @{list}    get webelements        xpath://div[@id="Wikipedia1_wikipedia-search-results"]//a
     FOR  ${item}  IN  @{list}
        log to console  Item: ${item.text}
        RUN KEYWORD IF  '${item.text}'=='Sachin Tendulkar'     Click Element  ${item}
        END

Mouse hovering Validation
     go to     https://demo.automationtesting.in/Register.html
     maximize browser window
     mouse over    xpath://a[text()='Interactions ']
     mouse over    xpath://a[text()='Drag and Drop ']
     click element   xpath://a[text()='Static ']
     go to   https://testautomationpractice.blogspot.com/
     title should be     Automation Testing Practice
     scroll element into view   xpath://button[text()='Copy Text']
     sleep   2
     double click element   xpath://button[text()='Copy Text']
     sleep   3
     drag and drop   id=draggable    id:droppable
     sleep   3
     ${title validation} =    get title
     Run Keyword If	'${title validation}' == 'Automation Testing Practice'	   Print something
     ...   ELSE    Print Nothing


*** Keywords ***
Print something
    log to console     titleexists
Print Nothing
    log to console     titlenotexists
