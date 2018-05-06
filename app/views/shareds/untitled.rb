if user_signed_in?
            if current_user.admin?
                @properties = Property.all.order("created_at DESC").page(params[:page]).per(6)
                @properties_numbers = @properties.count
            else
                if params[:property_type].present? and params[:ad_type].present? and params[:city].present?
                    @properties = Property.where("property_type_id = ? AND ad_type_id = ? AND city LIKE ?", params[:property_type].to_i, params[:ad_type].to_i, "%#{params[:city]}%").all.order("created_at DESC").published.page(params[:page]).per(6)
                    @properties_numbers = @properties.count
                elsif params[:property_type].present? and params[:ad_type].present? and params[:city].blank?
                    @properties = Property.where("property_type_id = ? AND ad_type_id = ?", params[:property_type].to_i, params[:ad_type].to_i).all.order("created_at DESC").published.page(params[:page]).per(6)
                    @properties_numbers = @properties.count
                elsif params[:property_type].present?
                    @property_type_id = PropertyType.find_by(name: params[:property_type]).id
                    @properties = Property.where("property_type_id = ?", @property_type_id).all.order("created_at DESC").published.page(params[:page]).per(6)
                    @properties_numbers = @properties.count
                elsif params[:ad_type].present?
                    @ad_type_id = AdType.find_by(name: params[:ad_type]).id
                    @properties = Property.where("ad_type_id = ?", @ad_type_id).all.order("created_at DESC").published.page(params[:page]).per(6)
                    @properties_numbers = @properties.count
                else
                    @properties = Property.all.order("created_at DESC").published.page(params[:page]).per(6)
                    @properties_numbers = @properties.count
                end
            end
        else