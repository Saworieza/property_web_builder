module Pwb
  class Api::V1::PropertyResource < JSONAPI::Resource
    model_name 'Pwb::Prop'

    # http://jsonapi-resources.com/v0.9/guide/resources.html#Callbacks
    # thought of using below to dynamically set globalize attributes dynamically but 
    # it doesn't get called when resource is just being retrieved...
    # after_create :add_attributes
    # def add_attributes
    #   binding.pry
    # end

    attributes :area_unit, :photos, :property_photos, :extras
    attributes :street_address, :street_name, :street_number, :postal_code
    attributes :city, :region, :currency
    attributes :country, :longitude, :latitude

    attributes :count_bathrooms, :count_bedrooms, :count_garages, :count_toilets
    attributes :constructed_area, :year_construction, :plot_area
    attributes :prop_type_key, :prop_state_key, :prop_origin_key

    attributes :title_fr, :title_de, :title_ru, :title_pt
    attributes :description_fr, :description_de, :description_ru, :description_pt
    attributes :title_es, :title_en, :title, :description_es, :description_en, :description

    attributes :for_sale, :for_rent_short_term, :for_rent_long_term, :obscure_map, :hide_map

    attributes :price_sale_current_cents, :price_sale_original_cents
    attributes :price_rental_monthly_current_cents, :price_rental_monthly_original_cents
    attributes :price_rental_monthly_low_season_cents, :price_rental_monthly_high_season_cents
    attributes :price_rental_monthly_standard_season_cents
    attributes  :visible, :highlighted, :reference

    def extras
      # override needed here as I have an extras has_many r/n on property
      # which is not yet in use..
      return @model.get_extras
    end

    # TODO - fix client side so I don't have to use these legacy names
    def property_photos
      photos = @model.prop_photos
      return photos
    end

    def photos
      photos = @model.prop_photos
      return photos
    end

    # def ano_constr
    #   ano_constr = @model.year_construction, :plot_area
    #   return ano_constr
    # end

    # t.integer  :year_construction, :plot_area, default: 0, null: false
    # t.integer  :count_bedrooms, default: 0, null: false
    # t.integer  :count_bathrooms, default: 0, null: false
    # t.integer  :count_toilets, default: 0, null: false
    # t.integer  :count_garages, default: 0, null: false

  end
end
