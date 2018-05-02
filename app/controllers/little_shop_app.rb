class LittleShopApp < Sinatra::Base

  get '/' do
    erb :"homepage/index"
  end

  get '/merchants' do
    @merchants = Merchant.all

    erb :"merchant/index"
  end
end
