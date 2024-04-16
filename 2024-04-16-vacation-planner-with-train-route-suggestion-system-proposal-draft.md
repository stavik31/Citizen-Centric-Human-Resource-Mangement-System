# Vacation Planner project Proposal

flowchart LR

A[Hard] -->|Text| B(Round)
B --> C{Decision}
C -->|One| D[Result 1]
C -->|Two| E[Result 2]



1. Vision: To create a user-friendly vacation planner app specifically for Japan that empowers travelers to design efficient and enjoyable itineraries.

2. Problem: Vacation in Japan usually incentivize tourists to use Japan's extensive railway system which can be over-whelming, researching timetables, and factoring in crowdedness becomes a time-consuming task. This often leads to suboptimal travel schedules, missed opportunities, and more work.

3. Objectives:
* Develop a user-friendly interface for travelers to input desired destinations in Japan.
* Integrate a Smart Train Route Suggestion System that utilizes real-time train schedules.
* Optimize travel time by suggesting the fastest or "x" route based on the user.
* Factor in real-world situations like crowdedness.
* Recommend additional destinations based on the chosen route and user filtering or maybe interests.

3. Scope: This project will focus on developing software for route plannning initially for major cities and popular tourist destinations in Japan. Real-time data integration for train crowdedness is subject to further investigation and potential data source availabilit (hopefully).

4. Smart cities: "Mobility as a service" in a smart city as part of smart city transport that optimize human travel experience with public transportation infrastructure.

User research and Needs Analysis

1. Clarification of Needs:
* Identify and understand target user needs and requirements. 
* Identify the focus on which destinations or travel conditions 
* Discover what constitutes the optimal travel experience desired by users.

2. Data Collection and Analysis:
Gather and analyze data such as travel times between destinations and congestion conditions. Explore methods to obtain real-time data from * Optimize or traffic data providers.

Selection of Planning Optimization Algorithms:
Choose appropriate planning optimization algorithms to propose the optimal travel routes based on selected destinations. For finding the shortest path between destinations, algorithms like Dijkstra's or A* are useful. Additionally, mixed-integer linear programming (MILP) or heuristic algorithms are suitable for optimizing routes considering congestion conditions.

3. System Design and Development:
Design the architecture of the proposed system and proceed with development. Integrate databases, backend services, and frontend interfaces to build a system that provides a seamless user experience.

4. Implementation and Testing:
Implement planning optimization algorithms and test the entire system. Ensure the system can suggest optimal routes based on added destinations and congestion conditions.