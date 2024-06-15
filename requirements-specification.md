---
title: Requirements Specification
nav_order: 2
---

# Software Requirements Specification
{: .no_toc }

## Preface

### Version History

| Version | Date       | Description      |
|---------|------------|------------------|
| 1.0     | 2024-05-20 | Initial revision |

### Document Conventions

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119).

Requirements in this specification are classified at three levels of aggregation to suit the needs of various readers of this document: functional or non-functional, user requirement identifier, and an optional trailing system requirement sub identifier. Unless otherwise stated, it is to be assumed that each requirement is hierarchical and that stated user-level requirements implicitly depend on the system requirements sharing the same identifier.

Functional requirements will be prefixed with "FREQ-". Non-functional requirements will be prefixed with "NREQ-".

Requirement identifiers will be proceeded by a short title. This title should be applicable to the requirement, but should not be construed as part of the requirement and exists only to improve the navigability and searchability of this document.

FREQ-0 Example User Requirement
: This denotes a functional user requirement with the id of 0.

NREQ-0.0 Example System Requirement
: This denotes a non-functional system requirement with the id of 0.0. This requirement is implicitly a dependency of the non-functional user requirement NREQ-0.

### Intended Audience and Reading Suggestions

This document is relevant for various audience involved in the development, deployment, and use of the system as outlined below:

Developers
: Product Objectives and Scope, Product Perspective, Use Cases, User Classes and Characteristics, Functional Requirements, Non-Functional Requirements, System Design Architecture, System Evolution.

Project Managers
: Introduction, Product Objectives and Scope, Product Perspective, User Classes and Characteristics, Product Functions, System Evolution.

Marketing Staff
: Introduction, Product Objectives and Scope, Product Functions, Functional Requirements.

End Users 
: Introduction, Product Objectives and Scope, Product Functions, Functional Requirements.

Test Engineers
: Introduction, Product Objectives and Scope, Product Perspective, Use Cases, User Classes and Characteristics, Functional Requirements, Non-Functional Requirements.
 
Documentation Writers
: Introduction, Product Functions, System Evolution.
 
## Table of Contents
{: .no_toc }

- TOC
{:toc}

## Introduction

This document is written as a Software Requirements Specification (SRS) for the "System for Citizen-centric Human Resource Management in Smart Cities" project. It aims to outline what the system will do and how it will be expected to perform. It will also define any high-level constraints that may affect deployment of the system.

### Product Objectives and Scope

#### Objectives

The system is designed to optimize human resource management in a smart city context, providing data-driven insights and engaging citizens in exploring job opportunities and educational materials.

- Engage citizenry by allowing them to explore available opportunities.
- Provide a data-driven approach to human resource management in smart cities.
- Encourage reskilling and upskilling by gamifying the process.

#### Scope

The prototype will cover a single metropolitan area and a limited subset of occupational segments based on available data.

### Product Perspective

![C4 System Context Diagram](/diagrams/PBL3-2024-system-context-diagram.svg)

In the context of a smart city, this system is an asset for optimizing human resource management. By integrating this system into the city's infrastructure through data-driven insights (demand predictions) and citizen engagement (suggestions of educational material), it enhances the city's capacity to anticipate and meet evolving labor demands. Ultimately, this product contributes to the overarching objective of creating a more efficient and citizen-centric urban environment.

### Product Functions

- Allow citizens to select a career goal and receive customized resources based on it.
- Allow citizens to explore news, educational material, job postings, employment trends, employment forecasts, and projected demand for each occupation.
- Provide engagement data and employment trend forecasts to assist smart city managers in predicting future demand.

### Use Cases

![Use Case Diagram](/diagrams/new-use-case-diagram-SRS.svg)

| Number | Name                            | Description                                                                                                             | Associated FREQ   |
|--------|---------------------------------|-------------------------------------------------------------------------------------------------------------------------|-------------------|
| U1     | Create Account                  | Register an account on the system                                                                                       | FREQ-1            |
| U2     | Administer Account              | Administer an account and assign a role                                                                                 | FREQ-2            |
| U3     | Edit Account Profile            | Edit profile to change profile information such as legal name, occupation, location                                     | FREQ-3            |
| U4     | Reset Account Password          | Reset and recover account's password                                                                                    | FREQ-4            |
| U5     | Delete Account                  | Delete account from the system                                                                                          | FREQ-5            |
| U6     | View Occupation Information     | View general information about each occupation, such as a title, description, and illustrative examples                 | FREQ-6 - FREQ-7   |
| U7     | Select Goal Job                 | Select an occupation as the preferred goal job                                                                          | FREQ-8, FREQ-6    |
| U8     | View Unemployment Data          | View historical unemployment data                                                                                       | FREQ-9            |
| U9     | View Occupation Trend           | View historical data and estimated trend forecast for a given occupation                                                | FREQ-10, FREQ-6   |
| U10    | View Job Postings               | View job postings for a given occupation                                                                                | FREQ-11, FREQ-6   |
| U11    | View Certifications Information | View applicable certifications for a given occupation                                                                   | FREQ-12, FREQ-6   |
| U12    | View Learning Material          | View applicable online learning material for a given occupation                                                         | FREQ-13, FREQ-6   |
| U13    | Manage Learning Material        | Create, update, remove online learning material for a given occupation on the system                                    | FREQ-14, FREQ-6   |
| U14    | View Occupation Demands         | View the targeted change in employment for a given occupation                                                           | FREQ-16, FREQ-6   |
| U15    | View Occupation News            | View news from various sources associated with a given occupation                                                       | FREQ-15, FREQ-6   |
| U16    | Manage Occupation Demands       | Set demand targets for a given occupation                                                                               | FREQ-17, FREQ-6   |
| U17    | View Analytics Report           | View a generated report on aggregated data of citizens' information and engagement activity with content on the website | FREQ-18 - FREQ-32 |
| U18    | Load News                       | Automatically pull news from RSS feeds                                                                                  | FREQ-37           |
| U19    | Load Unemployment               | Automatically pull unemployment data from the BLS public data API                                                       | FREQ-35           |
| U20    | Load Certifications             | Import the careeronestop certification dataset                                                                          | FREQ-36           |
| U21    | Load SOC Datasets               | Import SOC definitions and yearly employment statistics                                                                 | FREQ-33, FREQ-34  |

## Glossary

### General Terms

The following are terminologies and their definitions used in the document.

Account
: A set of credentials used to access the system, with associated roles and permissions.

Control
: A form control. This may be an input, a button, a link, or any other interactable element that the user may utilize to complete some action.

Profile
: A collection of user information such as name or location, used for reporting and personalization.

SOC Broad Occupation
: Denoted by the fourth and fifth characters of a SOC code. Provides a more granular aggregation level than SOC Minor Groups, but does not yet refer to individual occupations.

SOC Code(s)
: Standard Occupational Classification (SOC) codes are a standardized system used to hierarchically classify occupations. These code consist of a major group identifier (`MM`), minor group identifier (`m`), broad occupation identifier (`bb`), and detailed occupation identifier (`d`) and are formatted as `MM-mbbd` (e.g., `29-1020` for the broad occupution of dentists). For more information, refer to the 2018 Standard Occupational Classification System (SOC) specification in Appendix A.

SOC Detailed Occupation
: Denoted by the sixth character of a SOC code. This refers to a specific occupation. Note that the SOC standard does not capture job titles but seeks only to classify the work done, so in practice more granular classifications may be possible but are out of scope for this standard and our system. 

SOC Major Group
: Denoted by the first two character of a SOC code. The highest level of aggregation, composed of roughly 25 categories encompassing all jobs.

SOC Minor Group
: Denoted by the third character of a SOC code. Provides a more granular aggregation level than SOC Major Groups, but does not yet refer to individual occupations.

User
: In this document, when 'User' is mentioned, it encompasses both 'Citizen' and 'Smart City Manager' defined in User Classes and Characteristics. If a requirement only applies to one class of user, that class will be mentioned specifically.

### User Classes and Characteristics

Citizen
: Direct user of the system that is from the citizenry. Citizens use the system to view job opportunities, acquire educational materials, and gain insights into their skillsets and job market trends to transition into new employment opportunities.

Smart City Manager
: Direct end user of the system from the government. Smart City Managers utilize the system to analyze and manage the workforce within the city, using data-driven insights to predict labor demands, assess workforce skills, and plan for future urban development needs.

System Administrator
: An individual responsible for managing, maintaining, and overseeing the system's technical aspects. This role includes administrating accounts for city managers, maintaining system, troubleshooting issues, and supporting users.

## Functional Requirements

### FREQ-1 - Account Creation

Citizens MUST be able to register for an account by initiating the signup process, providing necessary information, and consenting to terms of use.

#### System Requirements

FREQ-1.1
: System MUST provide a control to initiate the signup process.

FREQ-1.2
: System MUST collect the citizen's email, password, legal name, current occupation, and postal code.

FREQ-1.3
: The system MUST enforce password strength requirements. This may be achieved by either enforcing character restrictions (a mix of uppercase letters, lowercase letters, numbers, and symbols) or by measuring complexity (using a tool such as zxcvbn).

FREQ-1.4
: Users MUST receive feedback on the strength of their password as they enter it.

FREQ-1.5
: System MUST collect citizens consent to our terms of use.

---

### FREQ-2 - Account Administration

This system MUST allow System Administrators to create user accounts and assign a role to them.

#### System Requirements

FREQ-2.1
: System must provide an interface for System Administrators to create new user accounts.

FREQ-2.2
: System Administrators MUST be able to associate an account with an email, legal name, and optionally a postal code.

FREQ-2.3
: System Administrators MUST be able to assign security roles to the users, such as "citizen" or "smart city manager".

FREQ-2.4
: The system SHOULD email users created in this fashion a one-time password reset link. This link should function as described in FREQ-4.

---

### FREQ-3 - Edit Profile

Users must be able to edit their profile to change important information about themselves, such as their legal name, current occupation, or location.

#### System Requirements

FREQ-3.1
: The system MUST provide the capability for existing users to modify their legal name.

FREQ-3.2
: The system MUST provide the capability for existing users to modify their current occupation.

FREQ-3.3
: The system MUST provide the capability for existing users to modify their postal code.

FREQ-3.4
: The system MUST provide the capability for existing users to change their password. This may utilize the functionality described in FREQ-4.

FREQ-3.5
: The system MAY provide the capability for existing users to change their email. This may require additional verification steps depending on the IdAM provider being used.

---

### FREQ-4 - Recover Password

Citizens MUST be able to recover their accounts by using a "Forgot Password" link, receiving a password reset email, and creating a new, secure password within a limited time frame.

#### System Requirements

FREQ-4.1
: The system MUST provide a "Forgot Password" link on the login page for users who have forgotten their passwords.

FREQ-4.2
: When users click on the "Forgot Password" link, they MUST be directed to a password recovery page.

FREQ-4.3
: Users MUST be prompted to enter their email address or username associated with their account.

FREQ-4.4
: After entering their email address or username, the system MUST send a password reset link to the user's registered email address.

FREQ-4.5
: The password reset link sent to the user's email MUST be unique and valid for 2 hours, after which it should cease functioning.

FREQ-4.6
: Clicking on the password reset link MUST redirect the user to a page where they can create a new password for their account.

FREQ-4.7
: The system MUST enforce password strength requirements. This may be achieved by either enforcing character restrictions (a mix of uppercase letters, lowercase letters, numbers, and symbols) or by measuring complexity (using a tool such as zxcvbn).

FREQ-4.8
: Users MUST receive feedback on the strength of their new password as they enter it.

FREQ-4.9
: After successfully resetting their password, users MUST receive a confirmation message informing them that their password has been changed.

FREQ-4.10
: Users MUST be redirected to the login page to log in with their new password.

---

### FREQ-5 - Delete Account

Citizen MUST be able to delete their account any time they want.

#### System Requirements

FREQ-5.1
: Citizen MUST be logged in for their account to be deleted.

FREQ-5.2
: If the citizen has no access to the account, the person shall contact the service via email or customer support and the person then provide information to verify their identity and then system MUST delete user profile.

---

### FREQ-6 - Occupation Views

The system MUST present content to users in hierarchical views mirroring the structure described in the 2018 Standard Occupational Classification System (Appendix A).

#### Mockup

![An example detailed occupation view](/diagrams/pbl3-hierarchical-view-mockup.svg)

The above figure shows an example of what these hierarchical views may look like. In this case, a detailed occupational view for SOC 29-1022 is shown.

#### System Requirements

FREQ-6.1
: The system MUST provide a root view aggregating content for all occupations.

FREQ-6.2
: The root view MUST contain navigational links and informative content for each SOC major group. 

FREQ-6.3
: The root view MAY contain additional content depending on the role of the currently signed-in user.

FREQ-6.4
: The system MUST provide a SOC major group view aggregating content for all occupations in that major group.

FREQ-6.5
: The SOC major group view MUST contain navigational links and informative content for each SOC minor group.

FREQ-6.6
: The SOC major group view MAY contain additional content depending on the role of the currently signed-in user.

FREQ-6.7
: The system MUST provide a SOC minor group view aggregating content for all occupations in that minor group.

FREQ-6.8
: The SOC minor group view MUST contain navigational links and informative content for each SOC broad occupation.

FREQ-6.9
: The SOC minor group view MAY contain additional content depending on the role of the currently signed-in user.

FREQ-6.10
: The system MUST provide a SOC broad occupation view aggregating content for all occupations in that broad occupation.

FREQ-6.11
: The SOC broad occupation view MUST contain navigational links and informative content for each SOC detailed occupation.

FREQ-6.12
: The SOC broad occupation view MAY contain additional content depending on the role of the currently signed-in user.

FREQ-6.13
: The system MUST provide a SOC detailed occupation view displaying content for a specific detailed occupation.

FREQ-6.14
: The SOC detailed occupation view SHOULD contain navigational links and informative content for other detailed occupations in the same minor group.

FREQ-6.15
: Citizens that have selected a career goal as defined in FREQ-4 SHOULD be automatically navigated to the SOC detailed occupation view for that occupation upon signing in to the system.

FREQ-6.16
: Users SHOULD be able to navigate to a specific occupation (at any level) by typing the occupation name or title into a search control.

FREQ-6.17
: Users SHOULD be able to navigate to a specific occupation (at any level) by typing the SOC code into a search control.

FREQ-6.18
: Each SOC view should have a dedicated URL to allow standard browser functionality, such as bookmarking and history, to function as expected.

---

### FREQ-7 - Occupation Information

Users MUST be able to view general information about each occupation, such as a title, description, and illustrative examples. This information should be visible on each view described in FREQ-6 at the appropriate level of aggregation (i.e., the broad occupation view should display information about that broad occupation).

#### System Requirements

FREQ-7.1
: The system MUST display the title, brief description, and illustrated examples of each occupation as defined in the 2018 SOC specification (Appendix A).

FREQ-7.2
: The system SHOULD display the most recent average salary of each occupation as reported by the Bureau of Labor Statistics, if available.

---

### FREQ-8 - Select Career Goal

Citizens MUST be able to select a detailed occupation as their career goal.

#### System Requirements

FREQ-8.1
: The SOC detailed occupation view (described in FREQ-6) should present a control that, when interacted with, sets the citizen's career goal to the current detailed occupation.

FREQ-8.2
: Selected career goal MUST be saved to the citizen's profile.

---

### FREQ-9 - Unemployment Data

Smart city managers MUST be able to view historical unemployment data.

#### System Requirements

FREQ-9.1
: System MUST display aggregate unemployment data to smart city managers as a line chart.

FREQ-9.2
: System MUST display aggregate unemployment data to smart city managers as a table.

FREQ-9.3
: System MAY display specific occupation unemployment data in the associated SOC view (as described in FREQ-6) when available.

---

### FREQ-10 - Employment Trends

Users MUST be able to see employment trends for the occupation they are currently viewing.

#### System Requirements

FREQ-10.1
: The system MUST apply time series analysis to historical employment data to forecast future trends.

FREQ-10.2
: The system MUST display historical and forecasted employment trends for the occupation currently being viewed.

FREQ-10.3
: The system SHOULD display historical and forecasted employment trends for occupations related to the occupation currently being viewed (as described in FREQ-6.2, FREQ-6.5, FREQ-6.8, FREQ-6.11, and FREQ-6.14).

FREQ-10.4
: The system SHOULD clearly denote which trend data is historical and which is forecasted. This may be done using colors, symbols, or other visual techniques.

---

### FREQ-11 - Job Postings

Users MUST be able to view job postings for the occupation they are currently viewing.

#### System Requirements

FREQ-11.1
: The system MUST integrate with an external job posting API to retrieve this data.

FREQ-11.2  
: The system MUST display job listings in a clear and organized manner, showing relevant information such as job title, company name, salary range, location, and application deadline.

FREQ-11.3
: Each job listing MUST be clickable, allowing users to view more details about the job on an external web page.

FREQ-11.4
: If available in the dataset, the system MAY additionally display user reviews and ratings for each job posting.

FREQ-11.5
: The system SHOULD provide sorting and filtering capability for job posting.

---

### FREQ-12 - Certifications

Users MUST be able to view certifications applicable to the occupation they are currently viewing.

#### System Requirements

FREQ-12.1
: The system MUST display relevant information about each certification, such as a title and description.

FREQ-12.2
: Each certification MUST be clickable, allowing users to view more detailed information on a separate page.

FREQ-12.3
: This detailed certification page must contain the title, description, links to external resources, and any other relevant information obtained in the careeronestop dataset.

FREQ-12.4
: The system MUST provide a unique URL for each detailed certification page to allow for browser capabilities such as bookmarking and history to function.

FREQ-12.5
: The system SHOULD provide sorting and filtering capability for certifications.

---

### FREQ-13 - Online Learning Material

Users MUST be able to view online learning material applicable to the occupation they are currently viewing.

#### System Requirements

FREQ-13.1
: The system MUST display relevant information about each material, such as a title and description.

FREQ-13.2
: Each material MUST be clickable, allowing users to view more detailed information on a separate page.

FREQ-13.3
: This detailed learning material page MUST contain the title, description, links to external resources, and any other relevant information about the learning material.

FREQ-13.4
: The system MUST provide a unique URL for each detailed learning material page to allow for browser capabilities such as bookmarking and history to function.

FREQ-13.5
: The system SHOULD provide sorting and filtering capability for learning material.

---

### FREQ-14 - Online Learning Material Management

Smart city managers MUST be able to create, update, and delete online learning material from the system.

#### System Requirements

FREQ-14.1
: The system MUST provide the capability for smart city managers to define prerequisites for the learning material.

FREQ-14.2
: The system MUST provide the capability for smart city managers to define the title of the learning material.

FREQ-14.3
: The system MUST provide the capability for smart city managers to define the description of the learning material.

FREQ-14.4
: The system MUST provide the capability for smart city managers to define the category of the learning material.

FREQ-14.5
: The system MUST provide the capability for smart city managers to define the target applicable occupation of the learning material.

FREQ-14.6
: The system MUST provide the capability for smart city managers to define the content type of the learning material.

FREQ-14.7
: The system MUST provide the capability for smart city managers to define keywords for the learning material.

FREQ-14.8
: The system MUST provide the capability for smart city managers to attach files and videos to the learning material.

FREQ-14.9
: The system MUST provide the capability for smart city managers to add external URLs.

---

### FREQ-15 News

Users MUST be able to view aggregated news from various sources and associate it with its related occupation / SOC codes.

#### System Requirements

FREQ-15.1
: System SHOULD display the title, date, source of news article of its original source to Users.

FREQ-15.2
: The system SHOULD be able to assess keywords of SOC code job descriptions and news articles to assess similarly in text analysis with methods such as cosine similarity.

---

### FREQ-16 View Demand

Users MUST be able to view the demand for each detailed occupation, as specified by smart city managers in FREQ-16.

#### System Requirements

FREQ-16.1
: Detailed occupations MUST display a percentage representing the difference between current employment and target demand for that job (e.g. +50%).

FREQ-16.2
: The system MUST NOT display this indicator if a value has not been provided by a smart city manager.

FREQ-16.3
: The system MAY aggregate more detailed demand values to populate this indicator for broader occupational categories, but only if values are provided for all child occupations.

---

### FREQ-17 Manage Demand

Smart city managers MUST be able to set demand targets for a given detailed occupation.

#### System Requirements

FREQ-17.1
: The system MUST allow smart city managers to input a demand target for each detailed occupation.

---

### FREQ-18 - Reporting (Citizen Current Occupation)

City managers SHALL be able to view a report on aggregated data of citizens' current occupation.

#### System Requirements

FREQ-18.1
: The system SHALL retrieve current occupation data of citizens from the existing database.

FREQ-18.2
: The system SHALL aggregate occupation data of citizens.

FREQ-18.3
: The system SHALL generate reports which include statistics of the aggregated data such as total number of citizens per occupation.

FREQ-18.4
: The system SHALL generate a bar chart and/or pie chart based on the aggregated occupation data.

FREQ-18.5
: The system SHALL ensure privacy by aggregating citizens' data in the reports.

FREQ-18.6
: The system SHALL allow city managers to export the aggregated data to an CSV format.

FREQ-18.7
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

### FREQ-19 - Reporting (Citizen Location)

City managers SHALL be able to view a report on aggregated data of citizens' general location.

#### System Requirements

FREQ-19.1
: The system SHALL retrieve location data of citizens from the existing database.

FREQ-19.2
: The system SHALL aggregate location data of citizens.

FREQ-19.3
: The system SHALL generate reports which include statistics of the aggregated data such as total number of citizens in a given location.

FREQ-19.4
: The system SHALL generate a map chart based on the aggregated location data.

FREQ-19.5
: The system SHALL ensure privacy by aggregating citizens' data in the reports.

FREQ-19.6
: The system SHALL allow city managers to export the aggregated data to an CSV format.

FREQ-19.7
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

### FREQ-20 - Reporting (Citizen Job Goals)

City managers SHALL be able to view a report on aggregated data of citizens' selected job goals.

#### System Requirements

FREQ-20.1
: The system SHALL retrieve selected job goals of citizens from the existing database.

FREQ-20.2
: The system SHALL aggregate job goals data of citizens.

FREQ-20.3
: The system SHALL generate reports which include statistics of the aggregated data such as total number of citizens per job goal.

FREQ-20.4
: The system SHALL generate a bar chart and/or pie chart based on the aggregated job goal data.

FREQ-20.5
: The system SHALL ensure privacy by aggregating citizens' data in the reports.

FREQ-20.6
: The system SHALL include a feature for city managers to export the aggregated data to an CSV format.

FREQ-20.7
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

### FREQ-21 - Reporting (Citizen Current Occupation based on Location)

City managers SHALL be able to view a report on aggregated data of citizens' selected current occupation based on their locations.

#### System Requirements

FREQ-21.1
: The system SHALL retrieve both location and selected occupation data of citizens from the existing database.

FREQ-21.2
: The system SHALL aggregate occupation and location data of citizens.

FREQ-21.3
: The system SHALL generate reports which include statistics of the aggregated data such as the quantitative and qualitative data of occupation for a given location and vice versa.

FREQ-21.4
: The system SHALL generate a heatmap based on the aggregated occupation data by location.

FREQ-21.5
: The system SHALL allow city managers to filter and sort the aggregated data by different occupation and location categories.

FREQ-21.6
: The system SHALL ensure privacy by aggregating citizens' data in the reports.

FREQ-21.7
: The system SHALL allow city managers to export the aggregated data to an CSV format.

FREQ-21.9
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

### FREQ-22 - Reporting (Citizen Goal Job based on Location)

City managers SHALL be able to view a report on aggregated data of citizens' selected job goals based on their locations.

#### System Requirements

FREQ-22.1
: The system SHALL retrieve both location and selected goal job data of citizens from the existing database.

FREQ-22.2
: The system SHALL aggregate job goals and location data of citizens.

FREQ-22.3
: The system SHALL generate reports which include statistics of the aggregated data such as the quantitative and qualitative data of job goals for a given location and vice versa.

FREQ-22.4
: The system SHALL generate a heatmap based on the aggregated job goals data by location.

FREQ-22.5
: The system SHALL allow city managers to filter and sort the aggregated data by different job goals and location categories.

FREQ-22.6
: The system SHALL ensure privacy by aggregating citizens' data in the reports.

FREQ-22.7
: The system SHALL allow city managers to export the aggregated data to an CSV format.

FREQ-22.9
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

### FREQ-23 - Reporting (Citizen Job Goal based on Current Occupation)

City managers SHOULD be able to view a report on aggregated data of selected job goals of citizens based on their current occupation.

#### System Requirements

FREQ-23.1
: The system SHALL retrieve both current occupation and selected goal job data of citizens from the existing database.

FREQ-23.2
: The system SHALL aggregate job goals and current occupation data of citizens.

FREQ-23.3
: The system SHALL generate reports which include statistics of the aggregated data such as the quantitative and qualitative data of job goals for a given occupation and vice versa.

FREQ-23.4
: The system SHALL generate a heatmap based on the aggregated job goals data by occupation.

FREQ-23.5
: The system SHALL allow city managers to filter and sort the aggregated data by different job goals and current occupation categories.

FREQ-23.6
: The system SHALL ensure privacy by aggregating citizens' data in the reports.

FREQ-23.7
: The system SHALL allow city managers to export the aggregated data to an CSV format.

FREQ-23.9
: The system SHALL provide real-time updates to the aggregated data as new information is added or updated.

---

### FREQ-24 - Reporting (Content Engagement between Job Listings and Occupation)

City managers SHALL be able to view engagement analytics of the job listing information viewed by citizens based on the citizen's occupation.

#### System Requirements

FREQ-24.1
: The system SHALL capture and log clickstream data that includes the job listing viewed whenever a citizen views job listing information.

FREQ-24.2
: The system SHALL aggregate the collected data.

FREQ-24.3
: The system SHALL generate reports which include analytics on the type of job listing viewed by occupation.

FREQ-24.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-25 - Reporting (Content Engagement between Job Listings and Citizen Location)

City managers SHALL be able to view engagement analytics of the job listing information viewed by citizens based on the citizen's general location.

#### System Requirements

FREQ-25.1
: The system SHALL capture and log clickstream data that includes the job listing viewed and the citizen's location whenever a citizen views job listing information.

FREQ-25.2
: The system SHALL aggregate the collected data.

FREQ-25.3
: The system SHALL generate reports which include analytics on the type of job listing viewed by citizen location.

FREQ-25.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-26 - Reporting (Content Engagement between Job Listings and Selected Goal Job)

City managers SHALL be able to view engagement analytics of the job listing information viewed by citizens based on the citizen's selected goal job.

#### System Requirements

FREQ-26.1
: The system SHALL capture and log clickstream data that includes the job listing viewed and the citizen's selected goal job whenever a citizen views job listing information.

FREQ-26.2
: The system SHALL aggregate the collected data.

FREQ-26.3
: The system SHALL generate reports which include analytics on the type of job listing viewed by selected goal job.

FREQ-26.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-27 - Reporting (Content Engagement between News Content and Occupation)

City managers MAY be able to view engagement analytics of the news content viewed by citizens based on the citizen's occupation.

#### System Requirements

FREQ-27.1
: The system SHALL capture and log clickstream data that includes the news content viewed and the citizen's occupation whenever a citizen views news content.

FREQ-27.2
: The system SHALL aggregate the collected data.

FREQ-27.3
: The system SHALL generate reports which include analytics on the type of news content viewed by occupation.

FREQ-27.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-28 - Reporting (Content Engagement between News Content and Citizen Location)

City managers MAY be able to view engagement analytics of the news content viewed by citizens based on the citizen's general location.

#### System Requirements

FREQ-28.1
: The system SHALL capture and log clickstream data that includes the news content viewed and the citizen's location whenever a citizen views news content.

FREQ-28.2
: The system SHALL aggregate the collected data.

FREQ-28.3
: The system SHALL generate reports which include analytics on the type of news content viewed by citizen location.

FREQ-28.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-29 - Reporting (Content Engagement between News Content and Selected Goal Job)

City managers MAY be able to view engagement analytics of the news content viewed by citizens based on the citizen's selected goal job.

#### System Requirements

FREQ-29.1
: The system SHALL capture and log clickstream data that includes the news content viewed and the citizen's selected goal job whenever a citizen views news content.

FREQ-29.2
: The system SHALL aggregate the collected data.

FREQ-29.3
: The system SHALL generate reports which include analytics on the type of news content viewed by selected goal job.

FREQ-29.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-30 - Reporting (Content Engagement between Certifications and Occupation)

City managers SHALL be able to view engagement analytics of the certification information viewed by citizens based on the citizen's occupation.

#### System Requirements

FREQ-30.1
: The system SHALL capture and log clickstream data that includes the certification information viewed and the citizen's occupation whenever a citizen views certification information.

FREQ-30.2
: The system SHALL aggregate the collected data.

FREQ-30.3
: The system SHALL generate reports which include analytics on the type of certification information viewed by occupation.

FREQ-30.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-31 - Reporting (Content Engagement between Certifications and Citizen Location)

City managers SHALL be able to view engagement analytics of the certification information viewed by citizens based on the citizen's general location.

#### System Requirements

FREQ-31.1
: The system SHALL capture and log clickstream data that includes the certification information viewed and the citizen's location whenever a citizen views certification information.

FREQ-31.2
: The system SHALL aggregate the collected data.

FREQ-31.3
: The system SHALL generate reports which include analytics on the type of certification information viewed by citizen location.

FREQ-31.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-32 - Reporting (Content Engagement between Certifications and Selected Goal Job)

City managers SHALL be able to view engagement analytics of the certification information viewed by citizens based on the citizen's selected goal job.

#### System Requirements

FREQ-32.1
: The system SHALL capture and log clickstream data that includes the certification information viewed and the citizen's selected goal job whenever a citizen views certification information.

FREQ-32.2
: The system SHALL aggregate the collected data.

FREQ-32.3
: The system SHALL generate reports which include analytics on the type of certification information viewed by selected goal job.

FREQ-32.4
: The system SHALL generate a heatmap based on the aggregated data.

---

### FREQ-33 - Load SOC Definition Dataset

The system MUST provide functionality to load SOC definitions and descriptions from a government dataset.

#### System Requirements

FREQ-33.1
: The system MUST pull SOC definition data from the Bureau of Labor Statistics API on the first of each month.

FREQ-33.2
: The system MUST internally store SOC definition data for use within the system. It MUST NOT call an external API each time this data is used.

---

### FREQ-34 - Load Employment Dataset

The system MUST provide functionality to load employment data from a government dataset.

#### System Requirements

FREQ-34.1
: The system MUST pull employment data from the Bureau of Labor Statistics API on the first of each month.

FREQ-34.2
: The system MUST internally store employment data for use within the system. It MUST NOT call an external API each time this data is used.

---

### FREQ-35 - Load Unemployment Dataset

The system MUST provide functionality to load unemployment data from a government dataset.

#### System Requirements

FREQ-35.1
: The system MUST pull unemployment data from the Bureau of Labor Statistics API on the first of each month.

FREQ-35.2
: The system MUST internally store unemployment data for use within the system. It MUST NOT call an external API each time this data is used.

---

### FREQ-36 - Load Certification Dataset

The system MUST provide functionality to load certification data from a government partner dataset.

#### System Requirements

FREQ-36.1
: The system MUST maintain a SQL-compatible database with a table structure matching that provided by careeronestop.

FREQ-36.2
: The system MUST allow Administrators to directly push this dataset to the database.

---

### FREQ-37 - Scrape News

The system MUST periodically scrape news sources, identify relevant news articles, and aggregate links to be displayed in the system.

#### System Requirements

FREQ-37.1
: The system MUST run a daily automated job to scrape news articles that were posted in the last 24 hours.

FREQ-37.2
: The system MUST utilize NLP or similar techniques to determine the relevance of each news article in relation to each SOC code.

FREQ-37.3
: The system MUST persist links to each news article along with their SOC mappings.

---

## Non-Functional Requirements

### NREQ-1 - WCAG 2 AA Compliance

The system MUST adhere to the Web Content Accessibility Guidelines (WCAG) 2.2, meeting a minimum of AA level success criteria outlined in the guidelines. Refer to Appendix A for further details.

---

### NREQ-2 - Supported Devices

The system MUST provide equivalent experiences for both mobile and desktop clients.

#### System Requirements

NREQ-2.1
: The system MUST provide a web interface with responsive capabilities as defined by the MDN web docs (See Appendix A).

NREQ-2.2
: The system MAY provide alternative clients, such as iOS or Android native apps.

---

### NREQ-3 - Internationalization

The system MUST be able to translate displayed content into one or more languages as selected by the user.

#### System Requirements

NREQ-3.1
: The system MUST expose a control that allows users to select a language or locale for the user interface.

NREQ-3.2
: The system MUST at minimum support the generic English locale (en).

NREQ-3.3
: The system MUST display all static text, such as labels or prompts, in the language or locale selected by the user.

NREQ-3.4
: The system MAY display alternate dynamic content, such as news articles or job postings, in the language or locale selected by the user.

---

### NREQ-4 - Client Performance

The system MUST be usable on low-end to medium-end devices.

#### System Requirements

NREQ-4.1
: The system MUST limit the bundle size of the web interface's static content to no more than 10MB.

NREQ-4.2
: The system SHOULD support responsive images as defined by the MDN web docs (See Appendix A).

NREQ-4.3
: The system MUST achieve a Google PageSpeed **Performance** score of 80 or higher for its web interface.

---

### NREQ-5 - Server Performance

Any APIs presented by the system MUST be able to handle peak load without degraded performance.

#### System Requirements

NREQ-5.1
: All HTTP APIs presented by the system MUST maintain P95 latency not exceeding 1000ms.

NREQ-5.2
: All server-side components of the system MUST be capable of starting up in less than 60 seconds to allow for sufficient elasticity when deployed in autoscale-capable environments.

---

### NREQ-6 - Availability and Uptime

The system MUST achieve three nines of availability (99.9% uptime) during standard operating hours. Maintenance downtime scheduled in advance is excluded from this requirement.

---

### NREQ-7 - Development Practices

The system MUST be developed using processes that follow industry standard best practices.

#### System Requirements

NREQ-7.1
: All system source code MUST be persisted in a git repository.

NREQ-7.2
: Each source code repository MUST follow trunk-based development. The `main` branch should always be in a deployable state; all feature work should take place on auxiliary branches.

NREQ-7.3
: The `main` branch of each git repository MUST enforce change controls preventing direct modification or merges.

NREQ-7.4
: Each source code repository MUST achieve at least 60% test coverage.

NREQ-7.5
: Changes to the `main` branch of each source code repository MUST be made via pull request. 

NREQ-7.6
: Pull requests SHOULD require at least two peer approvals and the successful execution of the component's test suite before being merged.

---

### NREQ-8 - Continuous Deployment

The system SHOULD be deployed using processes that minimize human involvement.

---

### NREQ-9 - Observability and Monitoring

The system SHOULD expose diagnostic logging and metrics to aide in measuring performance and business indicators.

#### System Requirements

NREQ-9.1
: Server-side components MUST expose operational logs via STDOUT for collection by external log aggregation systems.

NREQ-9.2
: Server-side components SHOULD expose performance and operational metrics using a standardized format (e.g., Prometheus) for collection by external metrics ingestion systems.

NREQ-9.3
: Client-side components SHOULD integrate with a web or mobile monitoring solution (e.g., Raygun).

---

### NREQ-10 - Authentication

The system MUST require users to authenticate using an externalized authentication scheme, such as OAuth 2, OIDC, or SAML.

#### System Requirements

NREQ-10.1
: The system MUST NOT have any knowledge of user credentials, such as passwords.

---

### NREQ-11 - Authorization

The system MUST enforce Role Based Access Control (RBAC) to limit interactions with system components to only users that are authorized to do so.

#### System Requirements

NREQ-11.1
: The system MUST define a role for citizens and limit their access to only functions designated for "user" or "citizen" access.

NREQ-11.2
: The system MUST define a role for smart city managers and limit their access to only functions designated for "user" or "smart city manager" access.

---

### NREQ-12 - Personally Identifiable Information

The system MUST manage citizen data in compliance with the terms of the General Data Protection Regulation (GDPR), California Consumer Protection Act (CCPA), and other similar legislation.

#### System Requirements

NREQ-12.1
: The system MUST limit personally identifiable information collection to only that which is required for system operation.

NREQ-12.2
: The system MUST acquire citizen consent before collecting any analytics data on their usage of the system.

NREQ-12.3
: The system MUST provide the capability for citizens to retrieve a complete copy of all data that the system has collected about them.

NREQ-12.4
: The system MUST provide the capability for citizens to request deletion of all data that the system has collected about them.

NREQ-12.5
: Upon receiving a data deletion request, the system MUST complete it within 30 days in compliance with the terms of the GDPR.

---

### NREQ-13 - Encryption in Transit

All communication between a user and the system MUST utilize end-to-end encryption.

#### System Requirements

NREQ-13.1
: All HTTP APIs MUST utilize TLS 1.3 or newer.

NREQ-13.2
: Private keys MUST NOT be accessible to developers of the system.

---

### NREQ-14 - Encryption at Rest

All personally identifiable information related to citizens MUST be encrypted at rest.

#### System Requirements

NREQ-14.1
: All databases containing personally identifiable information relating to a citizen MUST utilize some form of encryption at rest, either at the filesystem level or, if supported, in the database itself.

NREQ-14.2
: Encryption keys MUST NOT be accessible to developers of the system.

---

### NREQ-15 - Clickstream Analytics

The system MUST collect and ingest clickstream data for use in reports specified in FREQ-18 - FREQ-32.

#### System Requirements

NREQ-15.1
: The system MUST expose an API for the collection of clickstream data. This data should contain at minimum the citizen's profile ID, current occupation SOC code, and identifying information about the content they interacted with.

NREQ-15.2
: Clickstream data SHOULD be indexed and aggregated for efficient querying and reporting.

NREQ-15.3
: Client-side components MUST, with citizen consent, publish clickstream data for all citizen actions in the system to the API described in NREQ-15.1.

## System Architecture

![C4 System Container Diagram](/diagrams/PBL3-2024-system-container-diagram.svg)

## System Models

### Logical Data Flow Diagram

![Simplified logical DFD](/diagrams/pbl3-logical-dfd.svg)

This simplified logical data flow diagram shows how users of the system interact with its datasets through their various use cases. Note that reporting use cases were omitted for clarity. Refer to Appendix B for a list of datasets and more information on their contents.

## System Evolution

### Assumptions

SOC Code Sufficiency
* It is assumed for the system that the existing SOC codes adequately covers all required occupation and job classifications. It is also assumed that when SOC standards evolve over time, it will retain a level of backward compatibility, allowing for incremental updates rather than complete overhauls.

User Proficiency
* It is assumed that the end users (citizens and city managers) will have the basics technical proficiency necessary to utilize the web application without extensive training or support.

API Stability
* It is assumed that third-party APIs used by the system will follow standard versioning practices, providing backward compatibility and advance notice of deprecations.

End-User Device Compatibility
* It is assumed that the majority of end-users will access the web application using devices and operating systems that are compatible with modern web technologies.

Network Infrastructure Reliability
* It is assumed that internet and network infrastructure will continue to be reliable and accessible to the majority of users, ensuring consistent access to the web application.

### Anticipated Changes

#### SOC Standard

SOC Standard Changes
: The system will implement necessary changes to maintain new compliance and functionality in the even of new SOC standard being introduced. While ensuring that SOC standards updates that are utilized do not disrupt existing functionality by maintaining support for previous versions where feasible.

#### Browser Integration

Browser Compatibility 
: The system is a web application and will avoid reliance on browser-specific or proprietary APIs to ensure compatibility across different web browsers. 

Browser Updates
: The system will implement progressive enhancement to leverage new browser features when available while providing fallbacks for older browsers.

#### Cloud Hosting

Cloud Provider Dependence
: The system's backend will be designed to avoid dependencies on specific cloud provider features, ensuring ease of migration between different providers.

#### Containerization

System as Containerized Application
: The system runs as containerized apps to eliminate dependence on the underlying VMs. Furthermore, the system aims to maintain compliance with OCI container image standards to ensure portability across different container platforms.

#### Interfaces

Vendor Independence
: The system prioritize standard interfaces over vendor-specific APIs when possible to ensure flexibility to switch providers without overhauls in the system code.

## Appendix A: References

* [2018 Standard Occupational Classification System (SOC)](https://www.bls.gov/soc/2018/)
* [Web Content Accessibility Guidelines (WCAG) 2.2](https://www.w3.org/TR/WCAG22/)
* [MDN Web Docs - Responsive Design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)
* [MDN Web Docs - Responsive Images](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images)

## Appendix B: Datasets

| ID  | Title                | Source                        | URL                                                                                         |
|-----|----------------------|-------------------------------|---------------------------------------------------------------------------------------------|
| D1  | 2018 SOC Definitions | US Bureau of Labor Statistics | <https://www.bls.gov/soc/2018/#materials>                                                   |
| D2  | Employment           | US Bureau of Labor Statistics | <https://www.bls.gov/emp/tables/emp-by-detailed-occupation.htm>                             |
| D3  | Unemployment         | US Bureau of Labor Statistics | <https://www.bls.gov/cps/lfcharacteristics.htm#unemp>                                       |
| D4  | Certifications       | careeronestop (US partner)    | <https://www.careeronestop.org/Developers/Data/certifications.aspx> (Requires US-based VPN) |
| D5  | Account              | IdAM Provider                 | N/A                                                                                         |
| D6  | Profile              | Internal                      | N/A                                                                                         |
| D7  | Learning Material    | Internal                      | N/A                                                                                         |
| D8  | Occupational Demand  | Internal                      | N/A                                                                                         |
| D9  | News                 | Internal / Scraped            | N/A                                                                                         |

