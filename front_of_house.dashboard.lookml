- dashboard: front_of_house
  title: Front of House
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: dna_appts
    title: DNA Appointments 
    type: looker_area
    model: core_reports
    explore: appointment
    dimensions: [appointment.start_date,appointment.dna]
    pivots: [appointment.dna]
    measures: [appointment.number_of_appts]
    limit: 500
    total: false
    show_view_name: true
    show_null_labels: false
    show_null_points: true
    stacking: normal
    x_axis_gridlines: false
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: time
    x_axis_datetime_label: '%d-%m-%y'
    interpolation: linear
    show_value_labels: false
    point_style: none
    y_axis_gridlines: true
    show_y_axis_label: false
    show_y_axis_ticks: true

  - name: all_active_appts
    title: All/New Appts
    type: looker_line
    model: core_reports
    explore: appointment
    dimensions: [appointment.start_date]
    measures: [appointment.number_of_appts, derived_first_appointment.new_appointments]
    filters:
      appointment.status: '"A"'
    sorts: [derived_first_appointment.new_appointments desc]
    limit: 500
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
      '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    label_density: 25
    legend_position: center
    y_axis_gridlines: true
    show_view_names: true
    series_labels:
      derived_first_appointment.new_appointments: New Appts
      appointment.number_of_appts: Total Appts
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [Appts]
    y_axis_tick_density: default
    show_x_axis_label: true
    x_axis_label: Date
    show_x_axis_ticks: true
    x_axis_datetime_label: '%d-%b-%y'
    x_axis_scale: auto
    x_axis_label_rotation: -45
    show_null_points: true
    point_style: none
    interpolation: linear
    
  - name: total_outstanding_invoices
    title: Outstanding Invoices
    type: single_value
    model: core_reports
    explore: invoices
    measures: [charge.number_of_invoices]
    filters:
      charge.invoiced_date: 180 days
      charge.self_payer: 'Yes'
      invoices.sum_outstanding: '>0'
    sorts: [charge.number_of_invoices desc]
    limit: 500
    font_size: medium
    
