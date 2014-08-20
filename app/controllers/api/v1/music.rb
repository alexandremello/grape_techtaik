module API
  module V1
    class Music < Grape::API
      version "v1"
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers

      helpers API::PermittedParams

      resource :music do
        desc "Returns the musics"
        get "/", root: false do
          ::Music.all
        end

        desc "Returns music by id"
        params do
          requires :music_id, type: Integer, desc: "Music ID"
        end
        get "/:music_id", root: false do
          ::Music.find(params[:music_id])
        end

        desc "Create a music"
        params do
          requires :music, type: Hash do
            requires :name, type: String, desc: "Music Name"
            requires :author, type: String, desc: "Author Name"
            requires :album, type: String, desc: "Album name"
          end
        end
        post "/" do
          music = ::Music.new(permited_params[:music])
          error!(music.errors, 422) unless music.save
        end
      end
    end
  end
end
