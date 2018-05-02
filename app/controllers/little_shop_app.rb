class LittleShopApp < Sinatra::Base

  get '/' do
    @merchants = Merchant.all

    erb :"merchant/index"
  end

  get '/merchants' do
    @merchants = Merchant.all

    erb :"merchant/index"
  end
end
