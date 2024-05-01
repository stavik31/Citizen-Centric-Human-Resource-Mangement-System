---
title: 2024-04-30 Initial Requirement Discussion
author: Andy
---

### Ethical Concern Discussion
- Make sure that all our information presented to public are of credible/official sources
- General compliance 

### Usability Requirements, Accessibility?:
- AA level WCAG 2 Guidelines
- Mobile and desktop interface support in WCAG 2 
- Compliance support multiple languages - i18n support

### Performance Requirements
- Our UI should pass google page speed 80+
- Total ui bundle requirement, minimize the size to [10mb] we will figure out the number later
- Application startup time (backend) below 60 seconds

### Operational Requirements:
- Our code is always be on a git repository
- We gonna follow chunk based development
- Force pull requests and force to approve pushes (2 approvals)
- Continuous integration for merging branches
- Automated testing - 60% automated test coverage
- Continuous delivery/deployment CI/CD

### Requirements (Non-Functional):
- Aim for 99.9% uptime of server
- Space requirements: needs to fit in a low cost commodity VMs, hosting shouldnt exceed 20 bucks

We need
- Metrics to measure that uptime - cheap
- Diagnostics logging for network - mid
- Distributed tracing / tracing - expensive

### Notes
- Figure out how much logging do we need
- We need user login -> just use google or other sites man
- We need interface for deleting self user data for privacy
- We need more about throughput than latency for our servers
- We want to capture performance metrics - how long it is taking 
- We will attempt to give estimates of how long the system will do the operations -> good for testing methodology
- Make it so we can organize the codebase


### Security
- User level access data aka data should be able to be seen by their owner but not other 

