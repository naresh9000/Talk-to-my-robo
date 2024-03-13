Alwasy use combination of on-demand and spot instances..

Handling Temporary Workloads:
Spot instances are ideal for workloads that are short-lived or can tolerate interruptions. Examples include batch processing, data analysis, and CI/CD build agents.

Fleet Diversification:
Using a combination of spot instances and on-demand instances provides resilience to potential capacity issues or pricing fluctuations. Spot instances can supplement on-demand capacity to maintain a consistent workload capacity.


**Startegy for handling the spot instances**

Auto Scaling Groups (ASG) Configuration:

Configure Auto Scaling Groups for your node groups, both for spot instances and on-demand instances.
Set up a mix of spot and on-demand instances in your Auto Scaling Groups, and define appropriate scaling policies based on spot instance availability and workload demand.


Graceful Termination and Replacement:

Implement logic in your application to gracefully handle node termination events, including spot instance interruptions.
Utilize Kubernetes features such as PodDisruptionBudgets (PDBs) and PodAntiAffinity to ensure that critical workloads are distributed across multiple nodes and can tolerate node failures.