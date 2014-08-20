module API
  module PermittedParams

    def permited_params
      @permited_params ||= declared(params, include_missing: false)
    end
  end
end
