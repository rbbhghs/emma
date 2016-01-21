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

  - name: all_appointments
    title: All/New Appointments
    type: looker_line
    model: core_reports
    explore: appointment
    dimensions: [appointment.start_date]
    measures: [appointment.number_of_appts, derived_first_appointment.new_appointments]
    filters:
      appointment.status: '"A"'
    sorts: [appointment.start_date desc]
    limit: 500
    label_density: 25
    legend_position: center
    y_axis_gridlines: true
    show_view_names: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_points: true
    point_style: none
    interpolation: linear
