---
title: System Design Diagrams
nav_order: 3
---

# System Design Diagrams

## UI

## Backend

### Operations

#### getCertifications

![getCertifications sequence diagram](/diagrams/CertificationController-getCertifications-sequence.svg)

#### notifyEntryPublished

![notifyEntryPublished sequence diagram](/diagrams/ContentfulController-notifyEntryPublished-sequence.svg)

#### notifyEntryUnpublished

![notifyEntryUnpublished sequence diagram](/diagrams/ContentfulController-notifyEntryUnpublished-sequence.svg)

#### getEmploymentBySocCode

![getEmploymentBySocCode sequence diagram](/diagrams/EmploymentController-getEmploymentBySocCode-sequence.svg)

#### getJobPosting

![getJobPosting sequence diagram](/diagrams/JobPostingController-getJobPosting-sequence.svg)

#### getLearningMaterial

![getLearningMaterial sequence diagram](/diagrams/LearningMaterialController-getLearningMaterial-sequence.svg)

#### getNews

![getNews sequence diagram](/diagrams/NewsController-getNews-sequence.svg)

#### getOccupationsBySocCode

![getOccupationsBySocCode sequence diagram](/diagrams/OccupationController-getOccupationsBySocCode-sequence.svg)

#### getUnemploymentBySocCode

![getUnemploymentBySocCode sequence diagram](/diagrams/UnemploymentController-getUnemploymentBySocCode-sequence.svg)

#### deleteCurrentUserProfile

![deleteCurrentUserProfile sequence diagram](/diagrams/UserController-deleteCurrentUserProfile-sequence.svg)

#### getCurrentUserProfile

![getCurrentUserProfile sequence diagram](/diagrams/UserController-getCurrentUserProfile-sequence.svg)

#### updateUserProfile

![updateUserProfile sequence diagram](/diagrams/UserController-updateUserProfile-sequence.svg)

#### getDemand

![getDemand sequence diagram](/diagrams/ViewDemandController-getDemand-sequence.svg)

#### setDemand

![setDemand sequence diagram](/diagrams/ViewDemandController-setDemand-sequence.svg)

## Accounts / Profiles

### U1 - Create Account
#### Activity Diagram
![Create Account](/diagrams/CreateProfile.jpg)

### U2 - Administer Account
#### Activity Diagram
![Administer Account](/diagrams/AdministerAccount.jpg)

### U3 - Edit Account Profile
#### Activity Diagram
![Edit Account Profile](/diagrams/EditAccountProfile.jpg)

### U4 - Reset Account Password

### U5 - Delete Account
#### Activity Diagram
![Delete Account](/diagrams/DeleteAccount.jpg)

### U7 - Select Job Goal
#### Activity Diagram
![Select Job Goal](/diagrams/SelectJobGoal.jpg)

## Occupations

### U6 - View Occupation Information
#### Activity Diagram
![View Occupation Information](/diagrams/ViewOcupationalInformation.jpg)

### U8 - View Unemployment Data
#### Activity Diagram
![View Unemployment Data](/diagrams/ViewUnemploymentData.jpg)

### U9 - View Occupation Trend
#### Activity Diagram
![View Occupation Trend](/diagrams/ViewOccupationTrend.jpg)

### U14 - View Occupation Demand
#### Activity Diagram
![View Occupation Demand](/diagrams/ViewOccupationDemand.jpg)

### U16 - Manage Occupation Demand
#### Activity Diagram
![Manage Occupation Demand](/diagrams/ManageOccupationDemand.jpg)

## Job Postings

### U10 - View Job Postings
#### Activity Diagram
![View Job Postings](/diagrams/ViewJobPosting.jpg)

## Certifications

### U11 - View Certifications
#### Activity Diagram
![View Certifications](/diagrams/ViewCertifications.jpg)

## Learning Material

### U12 - View Learning Material
#### Activity Diagram
![View Learning Material](/diagrams/ViewLearningMaterial.jpg)

### U13 - Manage Learning Material

#### State Diagram

```mermaid
stateDiagram-v2
  new : NEW
  synchronized : SYNCHRONIZED
  unsynchronized : SYNCHRONIZATION_FAILED
  state if_success <<choice>>

  [*] --> new
  new --> if_success
  if_success --> synchronized : received content
  if_success --> unsynchronized : error
  synchronized --> new : if content changes
  unsynchronized --> new : after 5 minutes  
```

#### Using Contentful

![Activity diagram showing the process flow for managing learning content](/diagrams/pbl3-manage-learning-material-activity-diagram.svg)

## News

### U15 - View Occupation News

### Load News

#### State Diagram

```mermaid
stateDiagram-v2
  new : NEW
  classified : CLASSIFIED
  unclassified : UNCLASSIFIED
  state if_success <<choice>>

  [*] --> new
  new --> if_success
  if_success --> classified : if classification successful
  if_success --> unclassified : if classification failed
  classified --> new : if article changes
  unclassified --> new : if article changes  
```

#### News Classification

![Activity diagram showing the process flow for news classification using doc2vec](/diagrams/pbl3-news-classification-activity-diagram.svg)

## Reporting

### U17 - View Analytics Reports
#### Activity Diagram
![View Analytics Reports](/diagrams/ViewAnalyticsReports.jpg)

