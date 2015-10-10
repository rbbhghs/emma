- connection: emma

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards



- explore: patient
  joins:
  - join: individual
    foreign_key: individual_id
