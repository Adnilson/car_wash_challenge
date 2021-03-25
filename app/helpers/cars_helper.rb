module CarsHelper
  def models_options
    @models_options ||= option_groups_from_collection_for_select(
      Maker.includes(:models),
      :models,
      :name,
      :id,
      :name
    )
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, sort: column, direction: direction
  end
end
