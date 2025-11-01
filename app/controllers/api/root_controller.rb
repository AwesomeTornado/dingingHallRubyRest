class Api::RootController < ApiController
  self.extra_actions = { test: :get }

  def root
    render(
      api: {
        message: "Welcome to my second Ruby application, and my first Rails one!"
      },
    )
  end

  def test
    render(api: { message: "Hellow, World!" })
  end
end
