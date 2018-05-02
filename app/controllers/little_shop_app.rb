class LittleShopApp < Sinatra::Base

  get '/' do
    'hello world'
  end

  get '/merchants' do
    @merchants = Merchant.all

    erb :"merchant/index"
  end
end
