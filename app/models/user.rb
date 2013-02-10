class User < ActiveRecord::Base

  def self.find_or_create_with_omniauth(auth)
      user = where(steam_id: auth.uid).first_or_initialize
      user.name = auth.info.name
      user.save
        # display_name: auth.info.nickname,
        # profile_image_url: auth.extra.raw_info.avatarmedium,
        # profile_url: "http://steamcommunity.com/profiles/#{auth.uid}"
      user
    end

end
