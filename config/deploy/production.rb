set :stage, :production

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w{square@swipeyrank-a-01.corp.squareup.com}
role :web, %w{square@swipeyrank-a-01.corp.squareup.com}
role :db,  %w{square@swipeyrank-a-01.corp.squareup.com}
