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
end
