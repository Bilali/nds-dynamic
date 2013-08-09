class AddGithubOrBitbucketProfileToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :github_or_bitbucket_profile, :string
  end
end
