---
title: System Design Diagrams
nav_order: 3
---

# System Design Diagrams

## Accounts / Profiles

### U1 - Create Account

### U2 - Administer Account

### U3 - Edit Account Profile

### U4 - Reset Account Password

### U5 - Delete Account

### U7 - Select Job Goal

## Occupations

### U6 - View Occupation Information

### U8 - View Unemployment Data

### U9 - View Occupation Trend

### U14 - View Occupation Demand

### U16 - Manage Occupation Demand

## Job Postings

### U10 - View Job Postings

## Certifications

### U11 - View Certifications

## Learning Material

### U12 - View Learning Material

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
