*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}     Chrome
${URL}     http://demo.guru99.com/telecom/index.html
${CustomerId}

*** Test Cases ***
TC01
        Log To Console    Starting TC01
        Launch Browser
        Navigate to Add Customer
        Add Customer Fill Details
        Add Customer Click Submit And Verify Success
        Navigate to HOME

TC02
        Navigate to Pay Billing
        Go to Billing Details Page
        Get Total Billing Amount
        Close Browser

*** Keywords ***
Launch Browser
        Open Browser        ${URL}         ${BROWSER}
        Maximize Browser Window
        Wait Until Element Is Enabled    xpath://h3/*[text()='Add Customer']

Navigate to Add Customer
        Click Link    xpath://h3/*[text()='Add Customer']
        ${title}    Get Title
        Log To Console    Title:${title}
        Should Contain    ${title}      Add Customer

Add Customer Fill Details
        Click Element    xpath://*[text()='Done']
        Input Text    id:fname    Karthik
        Input Text    id:lname    Guru
        Input Text    id:email    erkarthik.g@gmail.com
        Input Text    xpath://textarea[@id='message']    MyAddress MyStreet
        Input Text    id:telephoneno    9894979899

Add Customer Click Submit And Verify Success
        Click Button    name:submit
        ${CustomerID}   Get Text    xpath://h3
        Set Global Variable    ${CustomerID}
        Log To Console    CustomerID:${CustomerID}
        
Navigate to HOME
        Click Element    xpath://ul[@class='actions']/..//*[text()='Home']

Navigate to Pay Billing
        Click Element    xpath://h3/*[text()='Pay Billing']
        ${titlePayBilling}    Get Title
        Log To Console    Title:${titlePayBilling}
        Should Contain    ${titlePayBilling}      Billing

Go to Billing Details Page
        Input Text    id:customer_id    ${CustomerID}
        Click Button    name:submit
        Element Should Be Visible    xpath://*[text()='Free Usage Limit']

Get Total Billing Amount
        ${TotalAmount}   Get Text    xpath://*[text()='Total Bill']/ancestor::tr/td[2]
        Log To Console    Total Amount:${TotalAmount}


