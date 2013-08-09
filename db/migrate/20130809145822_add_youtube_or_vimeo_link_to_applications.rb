class AddYoutubeOrVimeoLinkToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :youtube_or_vimeo_link, :string
  end
end
